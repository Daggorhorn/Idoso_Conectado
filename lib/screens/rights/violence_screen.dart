import 'package:flutter/material.dart';

class ViolenceScreen extends StatelessWidget {
  const ViolenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proteção contra violência'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SecaoInformacao(
              titulo: 'O que é violência contra a pessoa idosa?',
              icone: Icons.shield_outlined,
              texto:
                  'Violência contra a pessoa idosa é qualquer ação ou '
                  'omissão que cause sofrimento, dano, medo ou prejuízo. '
                  'Ela pode acontecer dentro de casa, na rua, em instituições '
                  'ou em outros lugares. A violência nunca deve ser considerada '
                  'normal ou aceitável.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Violência física',
              icone: Icons.accessibility_new,
              texto:
                  'A violência física acontece quando alguém agride ou machuca '
                  'a pessoa idosa de propósito. Empurrões, tapas, socos, '
                  'chutes, queimaduras ou qualquer outra agressão física '
                  'são formas de violência.',
            ),
            const _SecaoInformacao(
              titulo: 'Violência psicológica',
              icone: Icons.psychology,
              texto:
                  'A violência psicológica pode acontecer por meio de ameaças, '
                  'humilhações, insultos, intimidações, isolamento ou outras '
                  'ações que causem medo, tristeza ou sofrimento emocional. '
                  'A pessoa idosa merece ser tratada com respeito.',
            ),
            const _SecaoInformacao(
              titulo: 'Abandono e negligência',
              icone: Icons.person_off,
              texto:
                  'Abandono acontece quando a pessoa idosa é deixada sem o '
                  'cuidado necessário. Negligência pode ocorrer quando alguém '
                  'responsável deixa de oferecer cuidados básicos, como '
                  'alimentação, higiene, medicamentos, segurança ou atendimento '
                  'de saúde quando necessário.',
            ),
            const _SecaoInformacao(
              titulo: 'Violência financeira e patrimonial',
              icone: Icons.account_balance_wallet_outlined,
              texto:
                  'A violência financeira ou patrimonial acontece quando alguém '
                  'usa, controla ou retira dinheiro, benefícios, documentos '
                  'ou bens da pessoa idosa sem autorização ou de forma abusiva. '
                  'A pessoa idosa deve ter seus recursos e patrimônio respeitados.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Violência sexual',
              icone: Icons.warning_amber_outlined,
              texto:
                  'Qualquer ato ou contato sexual sem consentimento é uma forma '
                  'de violência. A pessoa idosa tem o direito de dizer não e '
                  'de ter seu corpo e sua vontade respeitados em qualquer situação.',
            ),
            const _SecaoInformacao(
              titulo: 'Violência institucional',
              icone: Icons.account_balance,
              texto:
                  'A violência também pode acontecer em serviços públicos, '
                  'instituições ou outros locais de atendimento. Tratamento '
                  'humilhante, desrespeitoso, discriminatório ou que cause '
                  'prejuízo à pessoa idosa pode ser denunciado.',
            ),
            const _SecaoInformacao(
              titulo: 'Sinais de que algo pode estar errado',
              icone: Icons.visibility_outlined,
              texto:
                  'Alguns sinais podem indicar uma situação de violência, '
                  'como medo constante, mudanças repentinas de comportamento, '
                  'ferimentos sem explicação, falta de alimentação ou higiene, '
                  'perda frequente de dinheiro ou documentos e isolamento '
                  'repentino de familiares e amigos.',
            ),
            const _SecaoInformacao(
              titulo: 'Se você estiver sofrendo violência',
              icone: Icons.pan_tool_outlined,
              texto:
                  'Procure uma pessoa de confiança e conte o que está acontecendo. '
                  'Se possível, procure um serviço de saúde, assistência social '
                  'ou segurança pública. Você não precisa enfrentar uma situação '
                  'de violência sozinho.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Disque 100',
              icone: Icons.phone_in_talk,
              texto:
                  'O Disque 100 é um canal para receber denúncias de violações '
                  'de direitos humanos. A denúncia pode envolver violência '
                  'contra pessoas idosas e outras situações de violação de direitos. '
                  'O serviço pode orientar sobre os encaminhamentos necessários.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Quando procurar a polícia',
              icone: Icons.local_police_outlined,
              texto:
                  'Se houver agressão, ameaça, perigo ou outra situação que '
                  'possa configurar crime, procure a polícia. Em uma situação '
                  'de emergência que esteja acontecendo naquele momento, '
                  'ligue para o 190.',
            ),
            const _SecaoInformacao(
              titulo: 'Em uma emergência de saúde',
              icone: Icons.local_hospital_outlined,
              texto:
                  'Se a pessoa idosa estiver gravemente ferida, passando mal '
                  'ou precisar de atendimento médico urgente, ligue para o '
                  'SAMU pelo número 192.',
            ),
            const _SecaoInformacao(
              titulo: 'Proteja seus documentos e senhas',
              icone: Icons.lock_outline,
              texto:
                  'Evite entregar senhas, códigos de banco, cartões ou documentos '
                  'a pessoas desconhecidas. Quando alguém pedir acesso ao seu '
                  'dinheiro ou aos seus documentos, procure orientação de uma '
                  'pessoa de confiança ou de um serviço oficial.',
            ),
            const _SecaoInformacao(
              titulo: 'Não tenha vergonha de pedir ajuda',
              icone: Icons.groups_outlined,
              texto:
                  'A violência nunca é culpa da vítima. Pedir ajuda é uma forma '
                  'de se proteger. Converse com alguém de confiança e procure '
                  'os serviços públicos disponíveis quando precisar.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Uma mensagem importante',
              icone: Icons.favorite_outline,
              texto:
                  'Toda pessoa idosa tem direito a viver com dignidade, segurança, '
                  'respeito e liberdade. Nenhuma forma de violência deve ser '
                  'aceita como parte normal do envelhecimento.',
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Semantics(
                container: true,
                child: const Text(
                  'Estas informações são educativas e têm como objetivo '
                  'facilitar o conhecimento sobre proteção e direitos da '
                  'pessoa idosa. Em situações de violência ou risco, procure '
                  'os serviços oficiais e de emergência disponíveis.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _SecaoInformacao extends StatelessWidget {
  final String titulo;
  final String texto;
  final IconData icone;
  final bool destaque;

  const _SecaoInformacao({
    required this.titulo,
    required this.texto,
    required this.icone,
    this.destaque = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: '$titulo. $texto',
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: destaque
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
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
    );
  }
}