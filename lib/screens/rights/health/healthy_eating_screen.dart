import 'package:flutter/material.dart';

class HealthyEatingScreen extends StatelessWidget {
  const HealthyEatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alimentação saudável'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SecaoInformacao(
              titulo: 'Alimentação saudável',
              icone: Icons.restaurant,
              texto:
                  'Uma alimentação adequada e saudável ajuda a manter a '
                  'energia, a força e a qualidade de vida. Para a pessoa '
                  'idosa, é importante ter uma alimentação variada, saborosa '
                  'e adequada aos seus hábitos e à sua realidade.',
            ),

            const _SecaoInformacao(
              titulo: 'Prefira alimentos naturais',
              icone: Icons.eco,
              texto:
                  'Dê preferência a alimentos in natura ou minimamente '
                  'processados, como frutas, verduras, legumes, feijão, '
                  'arroz, ovos, carnes e outros alimentos frescos. Sempre '
                  'que possível, prefira alimentos da estação e da sua '
                  'região.',
            ),

            const _SecaoInformacao(
              titulo: 'Frutas, verduras e legumes',
              icone: Icons.local_florist,
              texto:
                  'Procure incluir frutas, verduras e legumes nas refeições. '
                  'Eles ajudam a fornecer vitaminas, minerais e fibras '
                  'importantes para o funcionamento do organismo. Variar '
                  'as cores dos alimentos também ajuda a diversificar '
                  'a alimentação.',
            ),

            const _SecaoInformacao(
              titulo: 'Arroz e feijão',
              icone: Icons.rice_bowl,
              texto:
                  'A combinação de arroz com feijão faz parte da alimentação '
                  'tradicional brasileira e pode fazer parte de uma '
                  'alimentação saudável. Outros cereais, raízes, tubérculos '
                  'e leguminosas também podem fazer parte das refeições.',
            ),

            const _SecaoInformacao(
              titulo: 'Proteínas',
              icone: Icons.egg_alt,
              texto:
                  'Alimentos como ovos, carnes, peixes, leite e derivados '
                  'e feijão fornecem proteínas. Uma alimentação variada '
                  'ajuda a fornecer os nutrientes necessários para o '
                  'organismo. Em caso de necessidade específica, procure '
                  'orientação de um profissional de saúde.',
            ),

            const _SecaoInformacao(
              titulo: 'Beba água regularmente',
              icone: Icons.water_drop,
              texto:
                  'Beba água regularmente ao longo do dia, de preferência '
                  'também nos intervalos das refeições. A pessoa idosa '
                  'pode sentir menos sede mesmo quando precisa de líquidos. '
                  'Por isso, é importante não esperar sentir muita sede '
                  'para beber água.',
            ),

            const _SecaoInformacao(
              titulo: 'Quando existe restrição de líquidos',
              icone: Icons.local_drink,
              texto:
                  'Algumas pessoas precisam limitar a quantidade de líquidos '
                  'por orientação médica. Nesses casos, a quantidade de '
                  'água e outros líquidos deve seguir a orientação do '
                  'profissional responsável pelo acompanhamento.',
              destaque: true,
            ),

            const _SecaoInformacao(
              titulo: 'Fibras e funcionamento do intestino',
              icone: Icons.grass,
              texto:
                  'Frutas, verduras, legumes, feijão e cereais integrais '
                  'podem fornecer fibras. Uma alimentação com boas fontes '
                  'de fibras, junto com ingestão adequada de líquidos quando '
                  'não houver restrição, pode ajudar no funcionamento '
                  'regular do intestino.',
            ),

            const _SecaoInformacao(
              titulo: 'Cuidado com o excesso de sal e açúcar',
              icone: Icons.no_food,
              texto:
                  'Evite o excesso de sal, açúcar, óleo e gorduras. Para '
                  'dar mais sabor aos alimentos, experimente temperos '
                  'naturais como alho, cebola, cheiro-verde, orégano, '
                  'gengibre e outras ervas e especiarias.',
            ),

            const _SecaoInformacao(
              titulo: 'Evite ultraprocessados',
              icone: Icons.fastfood,
              texto:
                  'Evite ou reduza o consumo de alimentos ultraprocessados, '
                  'como refrigerantes, salgadinhos, biscoitos recheados, '
                  'macarrão instantâneo e outros produtos com muitos '
                  'ingredientes e aditivos. Prefira alimentos frescos '
                  'ou minimamente processados.',
            ),

            const _SecaoInformacao(
              titulo: 'Observe os rótulos',
              icone: Icons.label_outline,
              texto:
                  'Ao comprar alimentos embalados, observe a lista de '
                  'ingredientes e as informações nutricionais. Compare '
                  'produtos e, quando possível, escolha opções com menor '
                  'quantidade de açúcar, sódio e gorduras.',
            ),

            const _SecaoInformacao(
              titulo: 'Coma devagar e, se possível, acompanhado',
              icone: Icons.people,
              texto:
                  'Comer com calma ajuda a aproveitar melhor a refeição. '
                  'Sempre que possível, fazer as refeições acompanhado '
                  'de familiares, amigos ou outras pessoas pode tornar '
                  'esse momento mais agradável e favorecer o convívio '
                  'social e o apetite.',
            ),

            const _SecaoInformacao(
              titulo: 'Cuidados com a higiene dos alimentos',
              icone: Icons.clean_hands,
              texto:
                  'Lave as mãos com água e sabão antes de preparar os '
                  'alimentos e antes de comer. Mantenha os alimentos '
                  'armazenados corretamente e tenha atenção à validade '
                  'e às condições de conservação dos produtos.',
            ),

            const _SecaoInformacao(
              titulo: 'Cuide também da saúde da boca',
              icone: Icons.sentiment_satisfied_alt,
              texto:
                  'Uma boa saúde bucal ajuda a mastigar e aproveitar melhor '
                  'os alimentos. Mantenha os cuidados de higiene da boca '
                  'e procure atendimento odontológico quando tiver dor, '
                  'dificuldade para mastigar ou outros problemas.',
            ),

            const _SecaoInformacao(
              titulo: 'Falta de apetite',
              icone: Icons.sentiment_dissatisfied,
              texto:
                  'Se a falta de apetite for frequente ou estiver causando '
                  'perda de peso, fraqueza ou dificuldade para se alimentar, '
                  'procure um profissional de saúde. Mudanças persistentes '
                  'na alimentação merecem atenção.',
              destaque: true,
            ),

            const _SecaoInformacao(
              titulo: 'Alimentação e medicamentos',
              icone: Icons.medication,
              texto:
                  'Alguns medicamentos podem influenciar o apetite, a '
                  'digestão ou a forma como o organismo utiliza determinados '
                  'nutrientes. Não altere a alimentação ou suspenda um '
                  'medicamento por conta própria. Converse com o profissional '
                  'que acompanha o seu tratamento quando tiver dúvidas.',
            ),

            const _SecaoInformacao(
              titulo: 'Uma dica importante',
              icone: Icons.lightbulb_outline,
              texto:
                  'Não é necessário buscar uma alimentação complicada. '
                  'Pequenas escolhas do dia a dia podem fazer diferença: '
                  'mais alimentos frescos, variedade no prato, água ao '
                  'longo do dia e menos produtos ultraprocessados, excesso '
                  'de sal e açúcar.',
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
                  'uma consulta, diagnóstico ou orientação individual '
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