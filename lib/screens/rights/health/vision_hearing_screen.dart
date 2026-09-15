import 'package:flutter/material.dart';

class VisionHearingScreen extends StatelessWidget {
  const VisionHearingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visão e audição'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SecaoInformacao(
              titulo: 'Cuidando da visão',
              icone: Icons.visibility,
              texto:
                  'A visão pode sofrer mudanças com o passar dos anos. '
                  'Por isso, é importante cuidar dos olhos e realizar '
                  'avaliações regularmente. O diagnóstico precoce de '
                  'problemas oculares pode ajudar a evitar complicações '
                  'e preservar a visão.',
            ),

            const _SecaoInformacao(
              titulo: 'Consultas com o oftalmologista',
              icone: Icons.medical_services,
              texto:
                  'A consulta com o oftalmologista permite avaliar a saúde '
                  'dos olhos e identificar alterações que nem sempre '
                  'causam sintomas no início. Procure atendimento '
                  'principalmente quando perceber mudanças na visão.',
            ),

            const _SecaoInformacao(
              titulo: 'Catarata',
              icone: Icons.remove_red_eye,
              texto:
                  'A catarata acontece quando o cristalino, uma estrutura '
                  'transparente dentro do olho, fica opaco. Isso pode '
                  'causar visão embaçada ou dificuldade para enxergar. '
                  'A catarata é comum com o envelhecimento e, quando '
                  'necessário, pode ser tratada com cirurgia.',
            ),

            const _SecaoInformacao(
              titulo: 'Glaucoma',
              icone: Icons.visibility_outlined,
              texto:
                  'O glaucoma pode causar lesões no nervo óptico e perda '
                  'progressiva do campo de visão. Muitas vezes, a doença '
                  'não apresenta sintomas no começo. Por isso, as '
                  'avaliações oftalmológicas são importantes, especialmente '
                  'para pessoas com maior risco.',
            ),

            const _SecaoInformacao(
              titulo: 'Presbiopia ou vista cansada',
              icone: Icons.menu_book,
              texto:
                  'A presbiopia é uma alteração comum do envelhecimento '
                  'que dificulta enxergar objetos próximos. Muitas pessoas '
                  'percebem dificuldade para ler letras pequenas ou '
                  'precisam afastar o texto para conseguir enxergar melhor. '
                  'Óculos adequados podem ajudar, conforme avaliação '
                  'profissional.',
            ),

            const _SecaoInformacao(
              titulo: 'Cuidados diários com os olhos',
              icone: Icons.wb_sunny,
              texto:
                  'Evite coçar os olhos, proteja-os da exposição excessiva '
                  'ao sol e evite usar colírios por conta própria. O uso '
                  'prolongado de telas também pode causar ressecamento e '
                  'cansaço visual. Faça pausas e procure atendimento caso '
                  'apareça algum desconforto persistente.',
            ),

            const _SecaoInformacao(
              titulo: 'Sinais de alerta na visão',
              icone: Icons.warning_amber,
              texto:
                  'Procure atendimento médico se perceber visão embaçada, '
                  'alteração importante na visão, dificuldade para se '
                  'adaptar à luz, olhos muito vermelhos, lacrimejamento '
                  'persistente ou qualquer mudança que não seja habitual.',
              destaque: true,
            ),

            const _SecaoInformacao(
              titulo: 'Cuidando da audição',
              icone: Icons.hearing,
              texto:
                  'A audição é importante para a comunicação e para a '
                  'qualidade de vida. Algumas perdas auditivas aparecem '
                  'gradualmente e podem passar despercebidas no começo. '
                  'Por isso, é importante prestar atenção às mudanças '
                  'na capacidade de ouvir.',
            ),

            const _SecaoInformacao(
              titulo: 'Perda auditiva',
              icone: Icons.hearing_disabled,
              texto:
                  'A perda auditiva pode ter diferentes causas e graus. '
                  'Com o envelhecimento, algumas pessoas passam a ter '
                  'mais dificuldade para compreender conversas, '
                  'principalmente em ambientes com muito barulho.',
            ),

            const _SecaoInformacao(
              titulo: 'Sinais de perda auditiva',
              icone: Icons.record_voice_over,
              texto:
                  'Alguns sinais são pedir frequentemente para as pessoas '
                  'repetirem o que falaram, aumentar muito o volume da '
                  'televisão, ter dificuldade para conversar ao telefone '
                  'ou entender conversas em lugares barulhentos. '
                  'Também pode ocorrer isolamento ou dificuldade para '
                  'acompanhar conversas.',
            ),

            const _SecaoInformacao(
              titulo: 'Zumbido no ouvido',
              icone: Icons.volume_up,
              texto:
                  'O zumbido é a percepção de um som, como apito ou '
                  'chiado, mesmo quando não existe uma fonte sonora '
                  'externa. Ele pode estar relacionado a diferentes '
                  'condições. Se for frequente, persistente ou estiver '
                  'acompanhado de outros sintomas, procure avaliação '
                  'de um profissional de saúde.',
            ),

            const _SecaoInformacao(
              titulo: 'Proteja seus ouvidos de sons muito altos',
              icone: Icons.volume_off,
              texto:
                  'A exposição prolongada a sons muito altos pode causar '
                  'perda auditiva e zumbido. Evite permanecer por muito '
                  'tempo em ambientes com ruído intenso e tenha cuidado '
                  'com aparelhos de áudio em volume elevado. Quando '
                  'necessário, utilize proteção auditiva adequada.',
            ),

            const _SecaoInformacao(
              titulo: 'Aparelhos auditivos',
              icone: Icons.hearing,
              texto:
                  'Quando existe perda auditiva que necessita de '
                  'amplificação, o profissional de saúde pode avaliar '
                  'a necessidade de um aparelho auditivo. O SUS possui '
                  'serviços especializados que realizam avaliação, '
                  'diagnóstico, seleção, fornecimento e acompanhamento '
                  'de aparelhos auditivos em casos indicados.',
            ),

            const _SecaoInformacao(
              titulo: 'Quando procurar atendimento',
              icone: Icons.local_hospital,
              texto:
                  'Procure um serviço de saúde quando perceber perda '
                  'de visão ou audição, alterações persistentes, dor, '
                  'desconforto ou mudanças que estejam dificultando '
                  'suas atividades do dia a dia. Não espere o problema '
                  'ficar grave para buscar ajuda.',
              destaque: true,
            ),

            const _SecaoInformacao(
              titulo: 'Uma dica importante',
              icone: Icons.lightbulb_outline,
              texto:
                  'Cuidar da visão e da audição também ajuda na autonomia '
                  'e na segurança durante as atividades do dia a dia. '
                  'Se você perceber alguma mudança, converse com um '
                  'profissional de saúde e siga as orientações recebidas.',
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
                child: Text(
                  'Estas informações são educativas e não substituem '
                  'uma consulta, diagnóstico ou tratamento realizado '
                  'por um profissional de saúde.',
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