import 'package:flutter/material.dart';

class MedicationsScreen extends StatelessWidget {
  const MedicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamentos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Semantics(
            header: true,
            child: const Text(
              'Medicamentos',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'Os medicamentos podem ajudar no tratamento e controle de diversas '
            'doenças. Para que sejam utilizados com segurança, é importante '
            'seguir as orientações dos profissionais de saúde e prestar atenção '
            'aos horários, doses e cuidados indicados.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'Na pessoa idosa, o organismo pode ficar mais sensível aos efeitos '
            'dos medicamentos. Por isso, o acompanhamento da equipe de saúde '
            'é especialmente importante quando a pessoa utiliza vários '
            'medicamentos.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          _SecaoInformacao(
            titulo: 'Use somente com orientação',
            icone: Icons.medical_services,
            texto:
                'Não comece, pare ou altere um medicamento por conta própria.\n\n'
                'Siga a orientação recebida na consulta ou na unidade de saúde '
                'e tire suas dúvidas com um médico, enfermeiro ou farmacêutico.\n\n'
                'Mesmo medicamentos conhecidos podem causar efeitos diferentes '
                'em cada pessoa.',
          ),

          _SecaoInformacao(
            titulo: 'Respeite os horários',
            icone: Icons.schedule,
            texto:
                'Tente tomar os medicamentos nos horários indicados pelo '
                'profissional de saúde.\n\n'
                'Manter uma rotina pode ajudar a evitar esquecimentos. Alarmes '
                'do celular, calendários e aplicativos também podem ajudar na '
                'organização.\n\n'
                'Se esquecer uma dose, não dobre a próxima por conta própria. '
                'Procure orientação sobre o que fazer.',
          ),

          _SecaoInformacao(
            titulo: 'Não se automedique',
            icone: Icons.warning_amber,
            destaque: true,
            texto:
                'Evite tomar medicamentos por conta própria ou usar um '
                'medicamento que foi indicado para outra pessoa.\n\n'
                'Também informe à equipe de saúde sobre o uso de vitaminas, '
                'suplementos, chás, plantas medicinais e outros produtos. '
                'Alguns deles podem interferir na ação dos medicamentos.',
          ),

          _SecaoInformacao(
            titulo: 'Use a dose correta',
            icone: Icons.medication,
            texto:
                'A quantidade de medicamento indicada faz parte do tratamento.\n\n'
                'Não aumente ou diminua a dose porque os sintomas melhoraram '
                'ou pioraram, a menos que um profissional de saúde oriente '
                'essa mudança.\n\n'
                'Se estiver tendo dificuldades para seguir o tratamento, '
                'converse com a equipe de saúde.',
          ),

          _SecaoInformacao(
            titulo: 'Evite trocas e confusões',
            icone: Icons.label,
            texto:
                'Mantenha os medicamentos em suas embalagens originais. '
                'Isso facilita a identificação do nome, da dose e da validade.\n\n'
                'Se utilizar vários medicamentos, organize-os de maneira '
                'segura e separada para evitar trocas.\n\n'
                'Se tiver dificuldade para identificar algum medicamento, '
                'peça ajuda a um familiar ou profissional de saúde.',
          ),

          _SecaoInformacao(
            titulo: 'Como guardar os medicamentos',
            icone: Icons.inventory_2,
            texto:
                'Guarde os medicamentos em local seco, fresco, seguro e '
                'protegido da luz, conforme a orientação da embalagem.\n\n'
                'Evite guardar medicamentos junto com alimentos ou produtos '
                'de limpeza.\n\n'
                'Mantenha-os fora do alcance de crianças e animais.\n\n'
                'Alguns medicamentos precisam de refrigeração. Nesse caso, '
                'siga exatamente a orientação da embalagem ou do profissional '
                'de saúde. Não coloque medicamentos no congelador.',
          ),

          _SecaoInformacao(
            titulo: 'Confira a validade',
            icone: Icons.event_available,
            texto:
                'Verifique regularmente a data de validade dos medicamentos.\n\n'
                'Não utilize medicamentos vencidos.\n\n'
                'Também observe se houve mudança de cor, cheiro, aparência '
                'ou textura. Se perceber algo diferente, procure orientação '
                'de um profissional de saúde antes de utilizar o produto.',
          ),

          _SecaoInformacao(
            titulo: 'Leve sua lista de medicamentos',
            icone: Icons.list_alt,
            texto:
                'Sempre que possível, mantenha uma lista atualizada com os '
                'medicamentos que utiliza, incluindo os horários e as doses.\n\n'
                'Leve essa lista, as receitas e os medicamentos em uso para '
                'as consultas e atendimentos de saúde.\n\n'
                'Isso ajuda a equipe a conhecer melhor o tratamento e pode '
                'evitar erros ou duplicidade de medicamentos.',
          ),

          _SecaoInformacao(
            titulo: 'Medicamentos pelo SUS',
            icone: Icons.local_pharmacy,
            texto:
                'O SUS disponibiliza medicamentos para o tratamento de diversas '
                'doenças, de acordo com as políticas e listas oficiais de '
                'medicamentos.\n\n'
                'A disponibilidade e a forma de retirada podem variar de '
                'acordo com o medicamento e com a organização da rede de saúde '
                'do município ou do estado.\n\n'
                'Com a receita em mãos, procure a unidade de saúde ou a '
                'farmácia indicada pelo serviço de saúde para saber como '
                'retirar o medicamento.',
          ),

          _SecaoInformacao(
            titulo: 'Vários medicamentos ao mesmo tempo',
            icone: Icons.medication_liquid,
            texto:
                'Algumas pessoas precisam utilizar vários medicamentos ao '
                'mesmo tempo. Quando são utilizados cinco ou mais medicamentos '
                'regularmente, isso é chamado de polifarmácia.\n\n'
                'Quanto maior o número de medicamentos, maior pode ser a '
                'possibilidade de interações e efeitos indesejados.\n\n'
                'Por isso, mantenha acompanhamento regular com a equipe de '
                'saúde e informe todos os medicamentos que utiliza.',
          ),

          _SecaoInformacao(
            titulo: 'Se sentir algo diferente',
            icone: Icons.health_and_safety,
            destaque: true,
            texto:
                'Se depois de iniciar ou alterar um medicamento você perceber '
                'algum sintoma inesperado ou que esteja causando preocupação, '
                'procure orientação de um profissional de saúde.\n\n'
                'Não interrompa ou altere o tratamento por conta própria, '
                'a menos que receba orientação para isso.\n\n'
                'Em uma situação grave ou de emergência, procure atendimento '
                'imediato ou ligue para o SAMU 192.',
          ),

          _SecaoInformacao(
            titulo: 'Descarte corretamente',
            icone: Icons.delete_outline,
            destaque: true,
            texto:
                'Medicamentos vencidos ou que não serão mais utilizados não '
                'devem ser jogados no lixo comum, na pia ou no vaso sanitário.\n\n'
                'Leve esses medicamentos a um ponto de coleta adequado, como '
                'uma farmácia ou outro local que receba esse tipo de material.\n\n'
                'Se tiver dúvida sobre o local de descarte, pergunte em uma '
                'farmácia ou unidade de saúde da sua região.',
          ),

          const SizedBox(height: 10),

          Semantics(
            header: true,
            child: const Text(
              'Uma dica importante',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Nunca tenha vergonha de perguntar quando não entender uma '
            'orientação sobre um medicamento.\n\n'
            'Pergunte qual é o nome do medicamento, para que ele serve, '
            'qual é o horário, qual é a dose e por quanto tempo deve ser '
            'utilizado.\n\n'
            'Entender o próprio tratamento ajuda a utilizá-lo com mais '
            'segurança.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'As informações desta tela têm finalidade educativa e não '
            'substituem orientação ou avaliação de profissionais de saúde.',
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
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: destaque
                          ? TextDecoration.underline
                          : TextDecoration.none,
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