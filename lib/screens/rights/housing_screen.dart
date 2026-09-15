import 'package:flutter/material.dart';

class HousingScreen extends StatelessWidget {
  const HousingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moradia'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SecaoInformacao(
              titulo: 'Direito à moradia',
              icone: Icons.home_outlined,
              texto:
                  'A pessoa idosa tem direito a uma moradia digna, '
                  'segura e adequada às suas necessidades. O local onde '
                  'a pessoa vive deve oferecer condições de segurança, '
                  'higiene, acessibilidade e respeito.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Morar com segurança',
              icone: Icons.health_and_safety_outlined,
              texto:
                  'A casa deve ser um lugar seguro. Evite objetos espalhados '
                  'pelo chão, fios soltos e móveis que dificultem a passagem. '
                  'Mantenha os ambientes bem iluminados para reduzir o risco '
                  'de quedas.',
            ),
            const _SecaoInformacao(
              titulo: 'Cuidados no banheiro',
              icone: Icons.bathtub_outlined,
              texto:
                  'O banheiro merece atenção especial. Sempre que possível, '
                  'utilize barras de apoio, piso que não seja escorregadio '
                  'e iluminação adequada. Um tapete solto pode aumentar o '
                  'risco de queda e deve ser evitado.',
            ),
            const _SecaoInformacao(
              titulo: 'Acessibilidade',
              icone: Icons.accessible,
              texto:
                  'A moradia deve, sempre que possível, permitir que a pessoa '
                  'idosa se movimente com segurança. Rampas, corrimãos, barras '
                  'de apoio e outros recursos podem facilitar a circulação '
                  'e aumentar a independência.',
            ),
            const _SecaoInformacao(
              titulo: 'Morar com a família',
              icone: Icons.family_restroom,
              texto:
                  'A pessoa idosa pode viver com familiares quando essa for '
                  'uma opção adequada e desejada. O convívio familiar deve '
                  'ser baseado em respeito, cuidado, diálogo e preservação '
                  'da autonomia da pessoa idosa.',
            ),
            const _SecaoInformacao(
              titulo: 'A pessoa idosa não deve ser abandonada',
              icone: Icons.person_off_outlined,
              texto:
                  'Abandonar uma pessoa idosa que precisa de cuidados pode '
                  'representar uma situação de violência e violação de direitos. '
                  'Quando a família ou responsável estiver enfrentando '
                  'dificuldades para cuidar, deve procurar ajuda nos serviços '
                  'de saúde e assistência social.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Instituições de longa permanência',
              icone: Icons.apartment,
              texto:
                  'Quando a pessoa idosa precisa morar em uma instituição '
                  'de longa permanência, o local deve oferecer cuidados '
                  'adequados, segurança, higiene, alimentação e respeito '
                  'aos seus direitos. A pessoa deve ser tratada com dignidade.',
            ),
            const _SecaoInformacao(
              titulo: 'A pessoa idosa deve ser respeitada',
              icone: Icons.volunteer_activism_outlined,
              texto:
                  'Morar com outras pessoas não significa perder seus direitos. '
                  'A pessoa idosa continua tendo direito à privacidade, '
                  'à liberdade, ao respeito e à participação nas decisões '
                  'que dizem respeito à sua própria vida.',
            ),
            const _SecaoInformacao(
              titulo: 'Programas habitacionais',
              icone: Icons.apartment_outlined,
              texto:
                  'Existem políticas e programas habitacionais que podem '
                  'atender pessoas de diferentes perfis e condições de renda. '
                  'Os critérios e formas de inscrição podem variar. Procure '
                  'a prefeitura ou os órgãos responsáveis pela habitação '
                  'do seu município para saber quais programas estão disponíveis.',
            ),
            const _SecaoInformacao(
              titulo: 'Prioridade em programas habitacionais',
              icone: Icons.priority_high,
              texto:
                  'A legislação brasileira prevê proteção e prioridade '
                  'para pessoas idosas em determinadas políticas habitacionais. '
                  'Os critérios dependem do programa e da situação da família. '
                  'Procure informações diretamente nos canais oficiais.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Quando a renda é baixa',
              icone: Icons.account_balance_wallet_outlined,
              texto:
                  'Quando a família possui baixa renda e enfrenta dificuldades '
                  'para manter a moradia ou pagar despesas básicas, pode procurar '
                  'o CRAS. A equipe pode orientar sobre serviços, benefícios '
                  'e programas sociais disponíveis no município.',
            ),
            const _SecaoInformacao(
              titulo: 'Aluguel e problemas de moradia',
              icone: Icons.receipt_long_outlined,
              texto:
                  'Se houver dificuldades relacionadas à moradia, como risco '
                  'de perder o local onde vive, falta de condições básicas '
                  'ou problemas que afetem a segurança, procure a assistência '
                  'social ou os órgãos públicos responsáveis pela habitação '
                  'do município.',
            ),
            const _SecaoInformacao(
              titulo: 'Não aceite situações de risco',
              icone: Icons.warning_amber_outlined,
              texto:
                  'Problemas como infiltrações graves, instalações elétricas '
                  'perigosas, falta de água, risco de desabamento ou outras '
                  'condições que coloquem a vida em perigo precisam de atenção. '
                  'Procure ajuda dos órgãos responsáveis quando necessário.',
            ),
            const _SecaoInformacao(
              titulo: 'Peça ajuda para adaptar a casa',
              icone: Icons.build_outlined,
              texto:
                  'Se a pessoa idosa tiver dificuldade para caminhar, enxergar '
                  'ou realizar atividades dentro de casa, converse com a equipe '
                  'de saúde. Profissionais podem orientar sobre adaptações '
                  'que tornem a residência mais segura e acessível.',
            ),
            const _SecaoInformacao(
              titulo: 'Respeito e autonomia',
              icone: Icons.person_outline,
              texto:
                  'A pessoa idosa deve participar das decisões sobre onde e '
                  'como vai morar sempre que tiver condições de decidir. '
                  'Cuidar não significa retirar sua autonomia ou tomar todas '
                  'as decisões sem conversar com ela.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Se houver violência dentro de casa',
              icone: Icons.shield_outlined,
              texto:
                  'Se a pessoa idosa estiver sofrendo ameaças, agressões, '
                  'humilhações ou exploração dentro de casa, procure ajuda. '
                  'O Disque 100 pode receber denúncias de violações de direitos. '
                  'Em uma emergência, ligue para o 190 ou para o SAMU 192, '
                  'conforme a situação.',
            ),
            const _SecaoInformacao(
              titulo: 'Uma dica importante',
              icone: Icons.lightbulb_outline,
              texto:
                  'Uma casa segura ajuda a preservar a independência e '
                  'a qualidade de vida. Pequenas mudanças, como melhorar '
                  'a iluminação, retirar obstáculos e instalar barras de apoio, '
                  'podem fazer uma grande diferença.',
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
                  'facilitar o conhecimento sobre moradia, segurança e '
                  'direitos da pessoa idosa. Para informações sobre programas '
                  'habitacionais e serviços disponíveis, procure os órgãos '
                  'oficiais do seu município.',
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