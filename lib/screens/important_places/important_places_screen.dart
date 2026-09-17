import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImportantPlacesScreen extends StatelessWidget {
  const ImportantPlacesScreen({super.key});

  Future<void> _abrirMapa(String endereco) async {
    final enderecoCodificado = Uri.encodeComponent(endereco);

    final googleMapsUri = Uri.parse(
      'google.navigation:q=$enderecoCodificado',
    );

    try {
      final abriuMaps = await launchUrl(
        googleMapsUri,
        mode: LaunchMode.externalApplication,
      );

    if (abriuMaps) return;
  } catch (_) {
    // Tenta pelo navegador.
    }

  final navegadorUri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query='
    '$enderecoCodificado',
  );

  try {
    await launchUrl(
      navegadorUri,
      mode: LaunchMode.platformDefault,
    );
  } catch (_) {
    // Não foi possível abrir o mapa.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locais importantes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Locais importantes',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Encontre serviços e locais que podem oferecer '
            'ajuda e atendimento em diferentes situações.',
            style: TextStyle(
              fontSize: 20,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          _LocalCard(
            titulo: 'Hospital de Saúde Mental de Messejana',
            descricao: 'Emergência psiquiátrica 24 horas.',
            informacoes: const [
              'Endereço: Rua Vicente Nobre Macêdo, S/N - '
                  'Messejana, Fortaleza - CE, 60841-110',
              'Contato: 3125-9905 (NAC)',
            ],
            enderecoMapa:
                'Hospital de Saúde Mental de Messejana, '
                'Rua Vicente Nobre Macêdo, Messejana, Fortaleza - CE',
            onMapa: _abrirMapa,
          ),

          _LocalCard(
            titulo: 'Centro de Valorização da Vida (CVV)',
            descricao:
                'Serviço voluntário de prevenção do suicídio, '
                'sem qualquer custo para o usuário e sem '
                'vinculação de ordem religiosa, filosófica, '
                'sociológica ou política.',
            informacoes: const [
              'Telefone: 188',
              'Atendimento por telefone: 24 horas.',
              'Chat: Dom - 17h às 01h; '
                  'Seg a Qui - 09h às 01h; '
                  'Sex - 15h às 23h; '
                  'Sáb - 16h às 01h.',
              'Site: www.cvv.org.br',
            ],
            enderecoMapa: 'Centro de Valorização da Vida, Fortaleza - CE',
            onMapa: _abrirMapa,
          ),

          _LocalCard(
            titulo: 'Rede Pode Falar - UNICEF',
            descricao:
                'Canal de escuta acolhedora da UNICEF.',
            informacoes: const [
              'Público-alvo: pessoas de 13 a 24 anos.',
              'Atendimento: segunda a sábado, exceto feriados.',
              'Horário: 08h às 22h.',
              'Site: podefalar.org.br',
            ],
            enderecoMapa: 'Rede Pode Falar UNICEF, Fortaleza - CE',
            onMapa: _abrirMapa,
          ),

          _LocalCard(
            titulo: 'Grupo para Enlutados',
            descricao:
                'Grupo destinado a pessoas em processo de luto.',
            informacoes: const [
              'Contato: @cosmos.ufc',
              'Sextas-feiras: 08h às 10h - '
                  'Centro de Humanidades II - Universidade Federal do Ceará.',
              'Segundas-feiras: 17h30 às 19h - '
                  'Clínica Escola de Psicologia.',
            ],
            enderecoMapa:
                'Centro de Humanidades II, Universidade Federal do Ceará, '
                'Fortaleza - CE',
            onMapa: _abrirMapa,
          ),

          _LocalCard(
            titulo: 'Grupo terapêutico Reencontrar-se',
            descricao:
                'Grupo para mulheres acima de 18 anos que enfrentam '
                'processos de relacionamentos abusivos e/ou '
                'dependência emocional.',
            informacoes: const [
              'Contato: @lapfes',
              'Endereço: Casa da Mulher Brasileira do Ceará - '
                  'Rua Tabuleiro do Norte, S/N - Couto Fernandes.',
              'Horário: quartas-feiras, das 17h às 18h30.',
            ],
            enderecoMapa:
                'Casa da Mulher Brasileira do Ceará, '
                'Rua Tabuleiro do Norte, Couto Fernandes, Fortaleza - CE',
            onMapa: _abrirMapa,
          ),

          _LocalCard(
            titulo: 'PRAVIDA - Projeto de Apoio à Vida',
            descricao:
                'Atendimento psicológico presencial para maiores '
                'de 18 anos com ideação e comportamento suicida.',
            informacoes: const [
              'Atendimento: quintas-feiras, das 13h às 17h.',
              'Inscrição: cadastro prévio via telefone.',
              'Endereço: Ambulatório de Psiquiatria do HUWC - '
                  'R. Pastor Samuel Munguba, 1290, Rodolfo Teófilo.',
              'Telefone: (85) 98400-5672',
              'Instagram: @pravidaufc',
            ],
            enderecoMapa:
                'Ambulatório de Psiquiatria do HUWC, '
                'R. Pastor Samuel Munguba, 1290, Rodolfo Teófilo, '
                'Fortaleza - CE',
            onMapa: _abrirMapa,
          ),

          const SizedBox(height: 16),

          const Text(
            'Importante: os horários e formas de atendimento '
            'podem mudar. Quando possível, confirme as informações '
            'antes de se deslocar até o local.',
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _LocalCard extends StatelessWidget {
  final String titulo;
  final String descricao;
  final List<String> informacoes;
  final String enderecoMapa;
  final Future<void> Function(String endereco) onMapa;

  const _LocalCard({
    required this.titulo,
    required this.descricao,
    required this.informacoes,
    required this.enderecoMapa,
    required this.onMapa,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: Text(
                titulo,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              descricao,
              style: const TextStyle(
                fontSize: 19,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 16),

            ...informacoes.map(
              (informacao) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  informacao,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            Semantics(
              button: true,
              label: 'Ver localização de $titulo no mapa',
              child: SizedBox(
                height: 60,
                child: FilledButton.icon(
                  onPressed: () => onMapa(enderecoMapa),
                  icon: const Icon(Icons.location_on),
                  label: const Text(
                    'Ver localização no mapa',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}