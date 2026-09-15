import 'package:flutter/material.dart';

class PhysicalActivityScreen extends StatelessWidget {
  const PhysicalActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade física e prevenção de quedas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SecaoInformacao(
              titulo: 'Por que se movimentar?',
              icone: Icons.directions_walk,
              texto:
                  'A atividade física ajuda a melhorar a força, o equilíbrio, '
                  'a disposição e a qualidade de vida. Também pode ajudar '
                  'a manter a autonomia para realizar as atividades do '
                  'dia a dia.',
            ),

            const _SecaoInformacao(
              titulo: 'Comece devagar',
              icone: Icons.speed,
              texto:
                  'Se você não está acostumado a fazer atividade física, '
                  'comece com atividades leves e por pouco tempo. Aos poucos, '
                  'aumente a duração e a intensidade conforme sua condição '
                  'e suas possibilidades.',
            ),

            const _SecaoInformacao(
              titulo: 'Caminhada',
              icone: Icons.directions_walk,
              texto:
                  'Caminhar pode ser uma forma simples de incluir movimento '
                  'na rotina. Escolha um local seguro, bem iluminado e '
                  'adequado para caminhar. Use roupas confortáveis e '
                  'calçados firmes.',
            ),

            const _SecaoInformacao(
              titulo: 'Força e equilíbrio',
              icone: Icons.fitness_center,
              texto:
                  'Atividades que ajudam a fortalecer os músculos e melhorar '
                  'o equilíbrio são importantes para a pessoa idosa. Elas '
                  'podem contribuir para diminuir o risco de quedas e '
                  'ajudar a manter a independência.',
            ),

            const _SecaoInformacao(
              titulo: 'Quanto fazer?',
              icone: Icons.calendar_month,
              texto:
                  'Quando possível e de acordo com sua condição de saúde, '
                  'a orientação geral é buscar pelo menos 150 minutos(2:30 horas) de'
                  'atividade física moderada por semana. Esse objetivo '
                  'pode ser alcançado aos poucos e dividido ao longo '
                  'dos dias.',
            ),

            const _SecaoInformacao(
              titulo: 'Respeite seus limites',
              icone: Icons.favorite,
              texto:
                  'Cada pessoa possui uma condição de saúde diferente. '
                  'Se sentir dor, tontura, falta de ar fora do habitual '
                  'ou mal-estar durante uma atividade, pare e procure '
                  'orientação da equipe de saúde quando necessário.',
              destaque: true,
            ),

            const _SecaoInformacao(
              titulo: 'Evite ficar muito tempo parado',
              icone: Icons.accessibility_new,
              texto:
                  'Além de praticar atividades físicas, procure reduzir '
                  'longos períodos sentado ou deitado durante o dia. '
                  'Quando possível, levante-se, caminhe um pouco e faça '
                  'movimentos leves ao longo da rotina.',
            ),

            const _SecaoInformacao(
              titulo: 'Mantenha a casa bem iluminada',
              icone: Icons.lightbulb,
              texto:
                  'Mantenha os ambientes bem iluminados, principalmente '
                  'corredores, escadas e o caminho entre o quarto e o '
                  'banheiro. Se precisar levantar durante a noite, tenha '
                  'uma luz disponível.',
            ),

            const _SecaoInformacao(
              titulo: 'Cuidado com tapetes e objetos no chão',
              icone: Icons.cleaning_services,
              texto:
                  'Evite tapetes soltos, fios, objetos espalhados e móveis '
                  'mal posicionados que possam dificultar a passagem. '
                  'Mantenha os caminhos dentro da casa livres para caminhar '
                  'com segurança.',
            ),

            const _SecaoInformacao(
              titulo: 'Cuidado especial no banheiro',
              icone: Icons.bathtub,
              texto:
                  'O banheiro pode apresentar risco de escorregões. '
                  'Mantenha o piso seco sempre que possível e, quando '
                  'necessário, utilize barras de apoio e outros recursos '
                  'adequados para aumentar a segurança.',
            ),

            const _SecaoInformacao(
              titulo: 'Use calçados seguros',
              icone: Icons.hiking,
              texto:
                  'Prefira calçados fechados, confortáveis, firmes e com '
                  'solado que ajude a evitar escorregões. Evite andar '
                  'com calçados frouxos ou que dificultem o equilíbrio.',
            ),

            const _SecaoInformacao(
              titulo: 'Cuidado com escadas',
              icone: Icons.stairs,
              texto:
                  'Tenha atenção ao utilizar escadas. Sempre que possível, '
                  'utilize corrimão e mantenha os degraus livres de objetos. '
                  'Evite subir ou descer rapidamente quando estiver '
                  'desequilibrado ou com pouca iluminação.',
            ),

            const _SecaoInformacao(
              titulo: 'Medicamentos também merecem atenção',
              icone: Icons.medication,
              texto:
                  'Alguns medicamentos podem aumentar o risco de tontura '
                  'ou quedas. Não interrompa ou altere medicamentos por '
                  'conta própria. Leve sua lista de medicamentos às '
                  'consultas e informe à equipe de saúde qualquer queda '
                  'ou episódio de desequilíbrio.',
            ),

            const _SecaoInformacao(
              titulo: 'Cuide da visão e da audição',
              icone: Icons.visibility,
              texto:
                  'Alterações na visão e na audição podem dificultar a '
                  'percepção de obstáculos e aumentar o risco de acidentes. '
                  'Faça avaliações de saúde regularmente e mantenha seus '
                  'óculos e aparelhos auditivos, quando utilizados, '
                  'adequados às suas necessidades.',
            ),

            const _SecaoInformacao(
              titulo: 'Se você cair',
              icone: Icons.emergency,
              texto:
                  'Depois de uma queda, não tente levantar rapidamente '
                  'se estiver com dor, tontura ou dificuldade para se '
                  'movimentar. Peça ajuda e procure atendimento quando '
                  'necessário. Mesmo uma queda aparentemente simples '
                  'merece atenção quando houver dor ou lesão.',
              destaque: true,
            ),

            const _SecaoInformacao(
              titulo: 'Conte à equipe de saúde',
              icone: Icons.record_voice_over,
              texto:
                  'Informe à equipe de saúde se você caiu ou teve episódios '
                  'de tropeço e desequilíbrio. É importante contar onde '
                  'aconteceu, como aconteceu e se houve algum sintoma '
                  'antes da queda. Essas informações ajudam a identificar '
                  'possíveis riscos.',
            ),

            const _SecaoInformacao(
              titulo: 'Mantenha-se ativo e independente',
              icone: Icons.self_improvement,
              texto:
                  'A atividade física, os cuidados com a saúde e um '
                  'ambiente seguro podem ajudar a preservar a autonomia. '
                  'O objetivo não é deixar de fazer as atividades do dia '
                  'a dia, mas torná-las mais seguras.',
            ),

            const _SecaoInformacao(
              titulo: 'Uma dica importante',
              icone: Icons.lightbulb_outline,
              texto:
                  'Movimente-se de acordo com suas possibilidades, cuide '
                  'da segurança da sua casa e converse com sua equipe de '
                  'saúde sobre qualquer queda, tontura ou dificuldade '
                  'para caminhar. Pequenos cuidados podem fazer uma grande '
                  'diferença na segurança e na independência.',
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
                  'Estas informações são educativas e não substituem '
                  'uma consulta, avaliação ou orientação individual '
                  'realizada por um profissional de saúde.',
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