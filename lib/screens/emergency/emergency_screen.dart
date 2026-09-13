import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergência'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              Semantics(
                label: 'Emergência',
                child: Icon(
                  Icons.emergency_rounded,
                  size: 90,
                  color: colorScheme.error,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Você precisa de ajuda?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 12),

              Text(
                'Escolha um dos serviços abaixo para pedir ajuda.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 30),

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
                icone: Icons.medical_services,
                cor: colorScheme.primary,
              ),

              _ContatoEmergencia(
                nome: 'Polícia Militar',
                numero: '190',
                descricao: 'Emergências policiais',
                icone: Icons.local_police,
                cor: colorScheme.secondary,
              ),

              _ContatoEmergencia(
                nome: 'Corpo de Bombeiros',
                numero: '193',
                descricao: 'Incêndios, resgates e emergências',
                icone: Icons.fire_truck,
                cor: colorScheme.error,
              ),

              _ContatoEmergencia(
                nome: 'Disque 100',
                numero: '100',
                descricao: 'Direitos Humanos e denúncias',
                icone: Icons.support_agent,
                cor: colorScheme.tertiary,
              ),

              const SizedBox(height: 24),

              Semantics(
                header: true,
                child: Text(
                  'Outros contatos',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Outros números úteis poderão ser adicionados aqui.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 30),
            ],
          ),
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