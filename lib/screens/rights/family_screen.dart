import 'package:flutter/material.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Família e convivência'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _SecaoInformacao(
              titulo: 'Direito à convivência familiar',
              texto:
                  'A pessoa idosa tem direito de conviver com sua família, amigos e comunidade. '
                  'Ter contato com outras pessoas ajuda a manter os vínculos, a autoestima e a qualidade de vida.',
            ),
            _SecaoInformacao(
              titulo: 'Respeito dentro da família',
              texto:
                  'A idade não diminui a importância de uma pessoa. A pessoa idosa deve ser tratada com respeito, '
                  'paciência e dignidade por familiares, cuidadores e outras pessoas próximas.',
            ),
            _SecaoInformacao(
              titulo: 'Autonomia da pessoa idosa',
              texto:
                  'Sempre que estiver em condições de decidir, a pessoa idosa deve participar das decisões sobre '
                  'sua própria vida, sua rotina, seus cuidados e seu futuro.',
            ),
            _SecaoInformacao(
              titulo: 'A pessoa idosa pode tomar suas próprias decisões',
              texto:
                  'Ser idoso não significa perder automaticamente a capacidade de decidir. '
                  'Quando precisar de ajuda, a pessoa deve receber orientação e apoio, sem perder sua dignidade e sua autonomia.',
            ),
            _SecaoInformacao(
              titulo: 'Abandono e negligência',
              texto:
                  'Deixar uma pessoa idosa sem os cuidados necessários, ignorar suas necessidades ou abandoná-la '
                  'pode colocar sua saúde e sua segurança em risco. Situações assim precisam ser levadas a sério.',
            ),
            _SecaoInformacao(
              titulo: 'Quando a família precisa ajudar',
              texto:
                  'A família pode ajudar em tarefas do dia a dia, consultas, medicamentos, alimentação e outras necessidades. '
                  'A ajuda deve respeitar os limites, os desejos e a autonomia da pessoa idosa.',
            ),
            _SecaoInformacao(
              titulo: 'Cuidados sem retirar a autonomia',
              texto:
                  'Ajudar não significa fazer tudo pela pessoa idosa. Sempre que possível, permita que ela faça sozinha '
                  'aquilo que consegue fazer com segurança.',
            ),
            _SecaoInformacao(
              titulo: 'Convivência com filhos e netos',
              texto:
                  'A convivência entre diferentes gerações pode ser muito importante. Conversar, participar de atividades '
                  'familiares e compartilhar experiências ajuda a fortalecer os vínculos.',
            ),
            _SecaoInformacao(
              titulo: 'Pessoa idosa que mora sozinha',
              texto:
                  'Morar sozinho não significa estar abandonado. É importante manter contato regular com familiares, amigos '
                  'ou pessoas de confiança e ter acesso a serviços de saúde e emergência quando necessário.',
            ),
            _SecaoInformacao(
              titulo: 'Quando existe conflito familiar',
              texto:
                  'Discussões e diferenças podem acontecer nas famílias. Procure conversar com calma e, quando necessário, '
                  'peça ajuda de uma pessoa de confiança ou de um serviço de assistência social.',
            ),
            _SecaoInformacao(
              titulo: 'Violência dentro da família',
              texto:
                  'A violência pode acontecer mesmo dentro da família. Agressões físicas, ameaças, humilhações, abandono, '
                  'controle do dinheiro ou outras formas de abuso não devem ser aceitas.',
            ),
            _SecaoInformacao(
              titulo: 'Quando procurar ajuda',
              texto:
                  'Se você estiver sofrendo violência, abandono, ameaças ou exploração, procure ajuda. '
                  'Converse com alguém de confiança, procure um serviço de assistência social ou saúde e denuncie a situação.',
            ),
            _SecaoInformacao(
              titulo: 'Disque 100',
              texto:
                  'O Disque 100 recebe denúncias e orientações relacionadas a violações de direitos humanos, '
                  'incluindo situações de violência contra pessoas idosas.',
            ),
            _SecaoInformacao(
              titulo: 'Peça ajuda sem vergonha',
              texto:
                  'Pedir ajuda não é sinal de fraqueza. Se alguma situação estiver causando medo, sofrimento ou insegurança, '
                  'procure alguém de confiança e não enfrente o problema sozinho.',
            ),
            _SecaoInformacao(
              titulo: 'Uma mensagem importante',
              texto:
                  'Envelhecer faz parte da vida. A pessoa idosa merece respeito, carinho, segurança, autonomia e participação '
                  'na família e na comunidade.',
            ),
            SizedBox(height: 20),
            Text(
              'As informações apresentadas são educativas e não substituem orientação de profissionais ou atendimento dos serviços públicos.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _SecaoInformacao extends StatelessWidget {
  final String titulo;
  final String texto;

  const _SecaoInformacao({
    required this.titulo,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Semantics(
        container: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
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