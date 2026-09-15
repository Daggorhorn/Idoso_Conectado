import 'package:flutter/material.dart';

class MentalHealthScreen extends StatelessWidget {
  const MentalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saúde mental'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Semantics(
            header: true,
            child: const Text(
              'Saúde mental',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'A saúde mental faz parte da saúde e da qualidade de vida. '
            'Cuidar da mente é tão importante quanto cuidar do corpo. '
            'Ao longo da vida, podemos passar por momentos de tristeza, '
            'preocupação, ansiedade, perdas, mudanças na rotina ou dificuldades '
            'nos relacionamentos. Esses sentimentos merecem atenção e não devem '
            'ser ignorados quando começam a atrapalhar a vida cotidiana.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'Envelhecer não significa deixar de ter sonhos, relações, atividades '
            'e projetos. Manter contato com outras pessoas, participar da '
            'comunidade, conversar com familiares e amigos, aprender coisas novas '
            'e manter uma rotina saudável podem contribuir para o bem-estar '
            'emocional.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'Se você estiver passando por um período difícil, pedir ajuda não é '
            'sinal de fraqueza. Conversar com alguém de confiança ou procurar '
            'um profissional de saúde pode ser um passo importante para cuidar '
            'de si mesmo.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          _SecaoInformacao(
            titulo: 'Solidão e isolamento',
            icone: Icons.people,
            texto:
                'A solidão pode acontecer mesmo quando existem outras pessoas '
                'por perto. Ela pode aparecer depois da perda de alguém querido, '
                'de mudanças na família, da aposentadoria, de dificuldades de '
                'locomoção ou quando a pessoa deixa de participar das atividades '
                'que costumava realizar.\n\n'
                'O isolamento social também pode afetar negativamente a saúde. '
                'Por isso, manter vínculos e buscar oportunidades de convivência '
                'é importante. Conversar com familiares, amigos ou vizinhos, '
                'participar de grupos, atividades comunitárias ou centros de '
                'convivência e manter contato por telefone ou videochamada são '
                'algumas possibilidades.\n\n'
                'Se estiver se sentindo muito sozinho, procure conversar com '
                'alguém de confiança. Você não precisa enfrentar esse sentimento '
                'sozinho.',
          ),

          _SecaoInformacao(
            titulo: 'Ansiedade e preocupação',
            icone: Icons.psychology,
            texto:
                'Preocupações fazem parte da vida. Porém, quando a preocupação '
                'fica muito intensa ou começa a atrapalhar o sono, a rotina, '
                'os relacionamentos ou as atividades do dia a dia, é importante '
                'dar atenção ao que está acontecendo.\n\n'
                'Não é preciso tentar resolver tudo sozinho. Converse com '
                'alguém de confiança e, se necessário, procure uma Unidade '
                'Básica de Saúde (UBS), um CAPS ou outro serviço de saúde.',
          ),

          _SecaoInformacao(
            titulo: 'Tristeza persistente',
            icone: Icons.sentiment_dissatisfied,
            texto:
                'Sentir tristeza em determinados momentos é natural, '
                'principalmente depois de perdas ou mudanças importantes. '
                'Entretanto, quando a tristeza permanece por muito tempo, '
                'fica muito intensa ou começa a dificultar as atividades '
                'do dia a dia, é importante procurar ajuda.\n\n'
                'Mudanças importantes no comportamento, no sono, no interesse '
                'pelas atividades ou na convivência com outras pessoas também '
                'merecem atenção.\n\n'
                'Somente um profissional de saúde pode avaliar corretamente '
                'o que está acontecendo e indicar o cuidado adequado.',
          ),

          _SecaoInformacao(
            titulo: 'Cuidando da saúde mental',
            icone: Icons.favorite,
            texto:
                'Algumas atitudes podem ajudar no cuidado com a saúde mental:\n\n'
                '• Mantenha contato com familiares, amigos e outras pessoas.\n'
                '• Participe de atividades sociais ou comunitárias.\n'
                '• Pratique atividade física, quando possível e de acordo com '
                'sua condição de saúde.\n'
                '• Procure manter uma rotina de sono adequada.\n'
                '• Continue aprendendo e realizando atividades que tragam '
                'interesse e satisfação.\n'
                '• Converse sobre seus sentimentos com pessoas de confiança.\n'
                '• Procure uma equipe de saúde quando sentir que precisa de ajuda.\n\n'
                'Não tome medicamentos por conta própria. O uso de medicamentos '
                'deve seguir a orientação de um profissional de saúde.',
          ),

          _SecaoInformacao(
            titulo: 'Quando procurar ajuda',
            icone: Icons.support_agent,
            texto:
                'Procure ajuda profissional quando os sentimentos ou mudanças '
                'de comportamento estiverem causando sofrimento ou atrapalhando '
                'a rotina, o sono, os relacionamentos ou as atividades do dia '
                'a dia.\n\n'
                'Também é importante procurar ajuda quando a pessoa percebe que '
                'não está conseguindo lidar sozinha com aquilo que está vivendo.\n\n'
                'A Unidade Básica de Saúde (UBS) pode ser uma porta de entrada '
                'para o cuidado. Os CAPS também oferecem atendimento em saúde '
                'mental pelo SUS.',
          ),

          const SizedBox(height: 10),

          Semantics(
            header: true,
            child: const Text(
              'Onde buscar ajuda em Fortaleza',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Existem diferentes serviços que podem ajudar. Em situações que '
            'precisam de atendimento imediato, procure um serviço de urgência '
            'ou ligue para o SAMU 192.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          _ServicoAjuda(
            titulo: 'CAPS — Centro de Atenção Psicossocial',
            icone: Icons.local_hospital,
            destaque: true,
            texto:
                'Os CAPS são serviços públicos de saúde mental do SUS. '
                'Eles contam com equipes multiprofissionais e oferecem '
                'acolhimento, acompanhamento, atendimento individual e em '
                'grupo, atividades terapêuticas e apoio psicossocial.\n\n'
                'O primeiro acolhimento pode ser procurado diretamente no '
                'CAPS, sem necessidade de marcar consulta. A pessoa também '
                'pode chegar por meio de uma UBS ou de outros serviços da '
                'rede de saúde.\n\n'
                'Para saber qual CAPS atende sua região, procure a UBS mais '
                'próxima ou a Secretaria Municipal da Saúde de Fortaleza.',
          ),

          _ServicoAjuda(
            titulo: 'UBS — Unidade Básica de Saúde',
            icone: Icons.health_and_safety,
            texto:
                'A Unidade Básica de Saúde é uma das principais portas de '
                'entrada do SUS. A equipe pode acolher a pessoa, avaliar a '
                'situação e orientar sobre o cuidado necessário, inclusive '
                'quando existe sofrimento emocional ou psicológico.\n\n'
                'Se você não sabe onde procurar ajuda, a UBS da sua região '
                'é um bom lugar para começar.',
          ),

          _ServicoAjuda(
            titulo: 'Hospital de Saúde Mental de Messejana',
            icone: Icons.local_hospital,
            texto:
                'O Hospital de Saúde Mental Professor Frota Pinto, localizado '
                'em Messejana, é uma referência para atendimento especializado '
                'em saúde mental no Ceará.\n\n'
                'Endereço:\n'
                'Rua Vicente Nobre Macêdo, s/n — Messejana, Fortaleza — CE\n'
                'CEP: 60841-110\n\n'
                'Núcleo de Atendimento ao Cliente (NAC):\n'
                '(85) 3125-9905\n\n'
                'Em uma situação de emergência, procure atendimento imediato '
                'ou ligue para o SAMU 192.',
          ),

          _ServicoAjuda(
            titulo: 'SAMU 192 — Emergência',
            icone: Icons.emergency,
            destaque: true,
            texto:
                'O SAMU 192 é gratuito e funciona 24 horas por dia, todos '
                'os dias da semana. O serviço também atende situações de '
                'urgência psiquiátrica.\n\n'
                'Ligue para 192 quando houver uma situação de emergência que '
                'precise de atendimento imediato, principalmente quando a '
                'segurança da pessoa ou de outras pessoas estiver em risco.',
          ),

          _ServicoAjuda(
            titulo: 'CVV — Centro de Valorização da Vida',
            icone: Icons.phone_in_talk,
            destaque: true,
            texto:
                'O CVV oferece apoio emocional gratuito, com atendimento '
                'voluntário, sigiloso e sem julgamentos.\n\n'
                'Telefone: 188\n'
                'Atendimento: 24 horas por dia, todos os dias.\n\n'
                'O serviço está disponível para qualquer pessoa que queira '
                'conversar ou esteja passando por um momento difícil.\n\n'
                'Site: cvv.org.br',
          ),

          _ServicoAjuda(
            titulo: 'Uma mensagem importante',
            icone: Icons.favorite_border,
            texto:
                'Se você está passando por um momento difícil, procure ajuda. '
                'Falar sobre o que está sentindo pode ser um primeiro passo.\n\n'
                'Não tenha vergonha de pedir ajuda. A saúde mental faz parte '
                'da saúde, e existem serviços preparados para acolher você.\n\n'
                'Se houver risco imediato de você se machucar ou machucar '
                'outra pessoa, procure um serviço de emergência ou ligue '
                'para o SAMU 192.',
          ),

          const SizedBox(height: 24),

          const Text(
            'Esta tela tem finalidade informativa e não substitui avaliação '
            'ou atendimento de profissionais de saúde.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _SecaoInformacao extends StatelessWidget {
  final String titulo;
  final String texto;
  final IconData icone;

  const _SecaoInformacao({
    required this.titulo,
    required this.texto,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icone,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              texto,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServicoAjuda extends StatelessWidget {
  final String titulo;
  final String texto;
  final IconData icone;
  final bool destaque;

  const _ServicoAjuda({
    required this.titulo,
    required this.texto,
    required this.icone,
    this.destaque = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icone,
                    size: 36,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      titulo,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        decoration: destaque
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                texto,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}