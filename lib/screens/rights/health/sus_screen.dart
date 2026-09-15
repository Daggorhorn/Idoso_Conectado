import 'package:flutter/material.dart';

class SusScreen extends StatelessWidget {
  const SusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atendimento pelo SUS'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Semantics(
            header: true,
            child: const Text(
              'Atendimento pelo SUS',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'O Sistema Único de Saúde, conhecido como SUS, oferece atendimento '
            'gratuito para toda a população. O SUS está presente em todo o '
            'Brasil e oferece serviços de prevenção, vacinação, consultas, '
            'exames, tratamento, medicamentos, atendimento de urgência e '
            'outros cuidados de saúde.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'O SUS acompanha a pessoa em diferentes momentos da vida. '
            'Quando você precisar de atendimento, procure o serviço adequado '
            'para a situação. Em muitos casos, a Unidade Básica de Saúde (UBS) '
            'é o melhor lugar para começar.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          _SecaoInformacao(
            titulo: 'Unidade Básica de Saúde — UBS',
            icone: Icons.local_hospital,
            texto:
                'A Unidade Básica de Saúde, também conhecida como posto de '
                'saúde, é uma das principais portas de entrada do SUS.\n\n'
                'Na UBS, a pessoa pode receber acompanhamento de saúde, '
                'consultas, vacinação, orientações, acompanhamento de doenças '
                'crônicas, cuidados de enfermagem, atendimento odontológico e '
                'outros serviços.\n\n'
                'Quando necessário, a equipe da UBS pode encaminhar a pessoa '
                'para outros serviços da rede de saúde, como especialistas, '
                'exames, hospitais ou outros atendimentos.\n\n'
                'Se você não sabe onde procurar atendimento, a UBS da sua '
                'região pode ser um bom lugar para começar.',
          ),

          _SecaoInformacao(
            titulo: 'Quando procurar uma UBS',
            icone: Icons.health_and_safety,
            texto:
                'A UBS é indicada principalmente para cuidados de saúde que '
                'não precisam de atendimento de emergência.\n\n'
                'Você pode procurar a UBS para acompanhamento de pressão alta, '
                'diabetes, dores e outros problemas de saúde, renovação ou '
                'acompanhamento de tratamentos, vacinação, prevenção de doenças '
                'e orientação sobre outros serviços do SUS.\n\n'
                'Também é importante procurar a UBS regularmente para '
                'acompanhar sua saúde, mesmo quando você estiver se sentindo bem.',
          ),

          _SecaoInformacao(
            titulo: 'UPA 24 horas',
            icone: Icons.emergency,
            destaque: true,
            texto:
                'As Unidades de Pronto Atendimento, conhecidas como UPA 24h, '
                'atendem situações de urgência e emergência.\n\n'
                'A UPA funciona 24 horas por dia e pode ser procurada '
                'diretamente quando a situação precisa de atendimento rápido '
                'e não pode esperar por uma consulta comum na UBS.\n\n'
                'Depois da avaliação, a equipe pode realizar o atendimento '
                'necessário ou encaminhar a pessoa para outro serviço de '
                'saúde, quando for necessário.',
          ),

          _SecaoInformacao(
            titulo: 'SAMU 192',
            icone: Icons.phone_in_talk,
            destaque: true,
            texto:
                'O SAMU é o Serviço de Atendimento Móvel de Urgência. '
                'O número é 192 e o atendimento é gratuito.\n\n'
                'Ligue para o SAMU quando houver uma situação de urgência ou '
                'emergência que precise de atendimento imediato, especialmente '
                'quando a pessoa não puder ser transportada com segurança por '
                'meios próprios.\n\n'
                'O SAMU funciona 24 horas por dia, todos os dias.',
          ),

          _SecaoInformacao(
            titulo: 'Consultas e exames',
            icone: Icons.calendar_month,
            texto:
                'O SUS oferece consultas e exames de acordo com a necessidade '
                'da pessoa e com a organização da rede de saúde de cada '
                'município.\n\n'
                'Em muitos casos, a UBS realiza o primeiro atendimento e, '
                'quando necessário, encaminha a pessoa para um especialista '
                'ou solicita exames.\n\n'
                'Quando receber um encaminhamento ou pedido de exame, procure '
                'saber onde e quando o atendimento será realizado. Guarde '
                'seus pedidos, comprovantes e resultados para apresentar à '
                'equipe de saúde.',
          ),

          _SecaoInformacao(
            titulo: 'Vacinação',
            icone: Icons.vaccines,
            texto:
                'A vacinação é uma das principais formas de prevenção de '
                'doenças e está disponível gratuitamente pelo SUS.\n\n'
                'As vacinas indicadas dependem da idade, das condições de '
                'saúde e das orientações do Calendário Nacional de Vacinação.\n\n'
                'Procure regularmente uma unidade de saúde para verificar se '
                'suas vacinas estão atualizadas.\n\n'
                'É importante guardar o cartão ou a caderneta de vacinação. '
                'Se você perdeu esse documento, procure um serviço de '
                'vacinação do SUS para verificar seu histórico.',
          ),

          _SecaoInformacao(
            titulo: 'Medicamentos',
            icone: Icons.medication,
            texto:
                'O SUS possui serviços de assistência farmacêutica que '
                'disponibilizam medicamentos de acordo com as regras e os '
                'programas de saúde existentes.\n\n'
                'Quando receber uma receita ou orientação sobre medicamento, '
                'pergunte à equipe de saúde onde ele pode ser retirado e quais '
                'documentos são necessários.\n\n'
                'Não interrompa um tratamento por conta própria e não use '
                'medicamentos indicados para outra pessoa.\n\n'
                'Se tiver dúvidas sobre um medicamento, converse com um '
                'profissional de saúde.',
          ),

          _SecaoInformacao(
            titulo: 'Cartão SUS',
            icone: Icons.badge,
            texto:
                'O Cartão Nacional de Saúde, conhecido como Cartão SUS, ajuda '
                'a identificar o usuário e organizar informações relacionadas '
                'ao atendimento no sistema público de saúde.\n\n'
                'É importante manter seus dados pessoais atualizados e guardar '
                'as informações do seu Cartão SUS.\n\n'
                'Quando for a uma unidade de saúde, leve, sempre que possível, '
                'um documento de identificação e seus documentos de saúde.',
          ),

          _SecaoInformacao(
            titulo: 'Meu SUS Digital',
            icone: Icons.phone_android,
            texto:
                'O Meu SUS Digital é um aplicativo oficial que permite '
                'consultar diversas informações de saúde pelo celular.\n\n'
                'Entre os recursos disponíveis estão informações sobre '
                'vacinação, atendimentos, consultas e procedimentos agendados, '
                'medicamentos e outros registros de saúde.\n\n'
                'O aplicativo também permite consultar estabelecimentos de '
                'saúde e encontrar informações sobre serviços disponíveis.\n\n'
                'Para utilizar o aplicativo, é necessário fazer o acesso '
                'utilizando uma conta Gov.br.',
          ),

          _SecaoInformacao(
            titulo: 'Seus direitos no SUS',
            icone: Icons.gavel,
            texto:
                'Toda pessoa que utiliza o SUS possui direitos durante o '
                'atendimento.\n\n'
                'Entre esses direitos estão receber atendimento humanizado, '
                'acolhedor e sem discriminação, receber informações claras '
                'sobre sua saúde e ser tratado com respeito.\n\n'
                'Você também pode fazer perguntas quando não entender uma '
                'orientação ou procedimento. Se tiver dúvidas, peça para o '
                'profissional explicar novamente de uma maneira que você '
                'consiga compreender.\n\n'
                'Conhecer seus direitos ajuda a participar melhor das decisões '
                'relacionadas ao seu cuidado.',
          ),

          _SecaoInformacao(
            titulo: 'O que levar para o atendimento',
            icone: Icons.folder_shared,
            texto:
                'Sempre que possível, leve seus documentos pessoais, Cartão '
                'SUS, cartão ou caderneta de vacinação, receitas, pedidos de '
                'exames e resultados de exames anteriores.\n\n'
                'Também é importante informar à equipe de saúde quais '
                'medicamentos você utiliza e se possui alergias ou outras '
                'informações importantes sobre sua saúde.\n\n'
                'Se você utiliza vários medicamentos, pode ser útil levar '
                'uma lista com os nomes e horários de cada um.',
          ),

          _SecaoInformacao(
            titulo: 'Quando procurar ajuda imediatamente',
            icone: Icons.warning_amber,
            destaque: true,
            texto:
                'Algumas situações precisam de atendimento imediato. '
                'Em casos de emergência, procure um serviço de urgência ou '
                'ligue para o SAMU 192.\n\n'
                'Não espere uma consulta comum quando houver uma situação '
                'grave ou quando a pessoa precisar de atendimento imediato.\n\n'
                'Em caso de dúvida sobre a gravidade de uma situação, '
                'procure orientação de um serviço de saúde.',
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
            'Mantenha seus documentos de saúde organizados. Guarde receitas, '
            'resultados de exames, cartão de vacinação e informações sobre '
            'os medicamentos que utiliza.\n\n'
            'Também é uma boa ideia anotar dúvidas antes de uma consulta. '
            'Assim, você pode conversar com o profissional de saúde e não '
            'esquecer nenhuma pergunta importante.',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'As informações desta tela têm finalidade educativa e não '
            'substituem avaliação ou orientação de profissionais de saúde.',
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