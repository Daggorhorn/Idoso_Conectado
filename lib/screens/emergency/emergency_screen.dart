import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/contato_emergencia.dart';
import '../../services/location_service.dart';
import '../../services/storage_service.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  final StorageService _storageService = StorageService();
  final LocationService _locationService = LocationService();

  ContatoEmergencia? _contatoEmergencia;

  @override
  void initState() {
    super.initState();
    _carregarContato();
  }

  Future<void> _carregarContato() async {
    final contato = await _storageService.carregarContatoEmergencia();

    if (!mounted) return;

    setState(() {
      _contatoEmergencia = contato;
    });
  }

  Future<void> _cadastrarContato() async {
    final contato = await showDialog<ContatoEmergencia>(
      context: context,
      builder: (context) {
        return _DialogoContatoEmergencia(
          contatoAtual: _contatoEmergencia,
        );
      },
    );

    if (contato == null) return;

    await _storageService.salvarContatoEmergencia(contato);

    if (!mounted) return;

    setState(() {
      _contatoEmergencia = contato;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Contato de emergência salvo.'),
      ),
    );

    // Solicita a permissão de localização antecipadamente.
    // Assim, em uma situação de emergência, o aplicativo
    // não precisa interromper o usuário com esse pedido.
    final permissaoConcedida =
        await _locationService.solicitarPermissaoLocalizacao();

    if (!mounted) return;

    if (!permissaoConcedida) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'A permissão de localização não foi concedida. '
            'Ela será necessária para compartilhar sua localização.',
          ),
        ),
      );
    }
  }

  Future<void> _compartilharLocalizacao() async {
  final localizacao =
      await _locationService.obterLocalizacaoAtual();

  if (!mounted) return;

  if (localizacao == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Não foi possível obter sua localização. '
          'Verifique se a localização do celular está ativada.',
        ),
      ),
    );
    return;
  }

  final latitude = localizacao.latitude;
  final longitude = localizacao.longitude;

  final linkMapa =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

  final mensagem = '''
  Olá, preciso de ajuda.

  Esta é minha localização atual:

  $linkMapa
  ''';

  await SharePlus.instance.share(
    ShareParams(
      text: mensagem,
    ),
  );
  }

  Future<void> _ligarParaContato() async {
    final contato = _contatoEmergencia;

    if (contato == null) return;

    final uri = Uri.parse('tel:${contato.telefone}');

    try {
      final abriu = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!abriu && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Não foi possível abrir o aplicativo de telefone.',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Não foi possível abrir o aplicativo de telefone.',
            ),
          ),
        );
      }
    }
  }

  Future<void> _removerContato() async {
    final contato = _contatoEmergencia;

    if (contato == null) return;

    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remover contato'),
          content: Text(
            'Deseja remover ${contato.nome} como seu contato de emergência?',
          ),
          actions: [
            Semantics(
              button: true,
              label: 'Cancelar remoção do contato',
              child: TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
            ),
            Semantics(
              button: true,
              label: 'Confirmar remoção do contato',
              child: FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Remover'),
              ),
            ),
          ],
        );
      },
    );

    if (confirmar != true) return;

    await _storageService.removerContatoEmergencia();

    if (!mounted) return;

    setState(() {
      _contatoEmergencia = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Contato de emergência removido.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergência'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: Text(
                'Serviços de emergência',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            const SizedBox(height: 12),

            _ContatoEmergencia(
              nome: 'SAMU',
              numero: '192',
              descricao: 'Atendimento médico de emergência',
              icone: Icons.local_hospital,
              cor: Colors.red,
            ),

            const SizedBox(height: 12),

            _ContatoEmergencia(
              nome: 'Polícia Militar',
              numero: '190',
              descricao: 'Emergências policiais',
              icone: Icons.local_police,
              cor: Colors.indigo,
            ),

            const SizedBox(height: 12),

            _ContatoEmergencia(
              nome: 'Corpo de Bombeiros',
              numero: '193',
              descricao: 'Incêndios, acidentes e resgates',
              icone: Icons.fire_truck,
              cor: Colors.deepOrange,
            ),

            const SizedBox(height: 12),

            _ContatoEmergencia(
              nome: 'Disque 100',
              numero: '100',
              descricao: 'Direitos humanos e proteção',
              icone: Icons.support_agent,
              cor: Colors.teal,
            ),

            const SizedBox(height: 28),

            Semantics(
              header: true,
              child: Text(
                'Meu contato de emergência',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            const SizedBox(height: 12),

            if (_contatoEmergencia == null)
              _ContatoVazio(
                onPressed: _cadastrarContato,
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ContatoSalvo(
                    contato: _contatoEmergencia!,
                    onLigar: _ligarParaContato,
                    onEditar: _cadastrarContato,
                    onRemover: _removerContato,
                  ),

                  const SizedBox(height: 16),

                  Semantics(
                    button: true,
                    label: 'Compartilhar minha localização atual',
                    child: SizedBox(
                      height: 64,
                      child: FilledButton.icon(
                        onPressed: _compartilharLocalizacao,
                        icon: const Icon(Icons.location_on),
                        label: const Text(
                        'Compartilhar minha localização',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _DialogoContatoEmergencia extends StatefulWidget {
  final ContatoEmergencia? contatoAtual;

  const _DialogoContatoEmergencia({
    this.contatoAtual,
  });

  @override
  State<_DialogoContatoEmergencia> createState() =>
      _DialogoContatoEmergenciaState();
}

class _DialogoContatoEmergenciaState
    extends State<_DialogoContatoEmergencia> {
  late final TextEditingController _nomeController;
  late final TextEditingController _telefoneController;

  @override
  void initState() {
    super.initState();

    _nomeController = TextEditingController(
      text: widget.contatoAtual?.nome ?? '',
    );

    _telefoneController = TextEditingController(
      text: widget.contatoAtual?.telefone ?? '',
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();

    super.dispose();
  }

  void _salvar() {
    final nome = _nomeController.text.trim();
    final telefone = _telefoneController.text.trim();

    if (nome.isEmpty || telefone.isEmpty) {
      return;
    }

    Navigator.pop(
      context,
      ContatoEmergencia(
        nome: nome,
        telefone: telefone,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Contato de emergência'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            textField: true,
            label: 'Nome do contato de emergência',
            child: TextField(
              controller: _nomeController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Ex.: Maria',
              ),
            ),
          ),

          const SizedBox(height: 16),

          Semantics(
            textField: true,
            label: 'Telefone do contato de emergência',
            child: TextField(
              controller: _telefoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Telefone',
                hintText: 'Ex.: (85) 99999-9999',
              ),
            ),
          ),
        ],
      ),
      actions: [
        Semantics(
          button: true,
          label: 'Cancelar cadastro do contato',
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ),

        Semantics(
          button: true,
          label: 'Salvar contato de emergência',
          child: FilledButton(
            onPressed: _salvar,
            child: const Text('Salvar'),
          ),
        ),
      ],
    );
  }
}

class _ContatoVazio extends StatelessWidget {
  final VoidCallback onPressed;

  const _ContatoVazio({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Cadastrar contato de emergência',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(
                Icons.person_add_alt_1,
                size: 48,
              ),

              const SizedBox(height: 12),

              const Text(
                'Cadastre uma pessoa de confiança para ligar em uma emergência.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              FilledButton.icon(
                onPressed: onPressed,
                icon: const Icon(Icons.person_add),
                label: const Text('Cadastrar contato'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContatoSalvo extends StatelessWidget {
  final ContatoEmergencia contato;
  final VoidCallback onLigar;
  final VoidCallback onEditar;
  final VoidCallback onRemover;

  const _ContatoSalvo({
    required this.contato,
    required this.onLigar,
    required this.onEditar,
    required this.onRemover,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              label:
                  'Contato de emergência: ${contato.nome}. Telefone ${contato.telefone}',
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 48,
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contato.nome,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),

                        const SizedBox(height: 4),

                        Text(
                          contato.telefone,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Semantics(
              button: true,
              label: 'Ligar para ${contato.nome}',
              child: FilledButton.icon(
                onPressed: onLigar,
                icon: const Icon(Icons.phone),
                label: const Text('Ligar'),
              ),
            ),

            const SizedBox(height: 8),

            Semantics(
              button: true,
              label: 'Alterar contato de emergência',
              child: TextButton.icon(
                onPressed: onEditar,
                icon: const Icon(Icons.edit),
                label: const Text('Alterar contato'),
              ),
            ),

            Semantics(
              button: true,
              label: 'Remover contato de emergência',
              child: TextButton.icon(
                onPressed: onRemover,
                icon: const Icon(Icons.delete_outline),
                label: const Text('Remover contato'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContatoEmergencia extends StatelessWidget {
  final String nome;
  final String numero;
  final String descricao;
  final IconData icone;
  final Color cor;

  const _ContatoEmergencia({
    required this.nome,
    required this.numero,
    required this.descricao,
    required this.icone,
    required this.cor,
  });

  Future<void> _ligar(BuildContext context) async {
    final uri = Uri.parse('tel:$numero');

    try {
      final abriu = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!abriu && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Não foi possível abrir o aplicativo de telefone.',
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Não foi possível abrir o aplicativo de telefone.',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Ligar para $nome, número $numero. $descricao',
      child: SizedBox(
        width: double.infinity,
        height: 124,
        child: ElevatedButton.icon(
          onPressed: () => _ligar(context),
          icon: Icon(
            icone,
            size: 38,
          ),
          label: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$nome — $numero',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  descricao,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            foregroundColor: Colors.white,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}