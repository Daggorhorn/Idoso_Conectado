import 'package:flutter/material.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transporte'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SecaoInformacao(
              titulo: 'Transporte público gratuito',
              icone: Icons.directions_bus,
              texto:
                  'Pessoas com 65 anos ou mais têm direito à gratuidade '
                  'nos transportes coletivos públicos urbanos e semiurbanos, '
                  'conforme a legislação federal. Para utilizar esse direito, '
                  'é necessário apresentar um documento pessoal que comprove '
                  'a idade. Entre 60 e 65 anos, as regras de gratuidade podem '
                  'depender da legislação do município ou estado.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Assentos preferenciais',
              icone: Icons.event_seat,
              texto:
                  'Os veículos de transporte coletivo devem reservar assentos '
                  'para pessoas idosas. Esses lugares são identificados como '
                  'preferenciais. Quando necessário, a pessoa idosa pode pedir '
                  'respeito ao seu direito de prioridade e segurança durante '
                  'a viagem.',
            ),
            const _SecaoInformacao(
              titulo: 'Transporte em Fortaleza',
              icone: Icons.location_city,
              texto:
                  'Em Fortaleza, pessoas com 65 anos ou mais podem utilizar '
                  'gratuitamente o transporte coletivo. O embarque gratuito '
                  'também pode ser realizado mediante apresentação de documento '
                  'oficial com foto, como RG ou CNH. Existe também o Cartão '
                  'do Idoso, disponibilizado gratuitamente para facilitar '
                  'o acesso ao transporte.',
            ),
            const _SecaoInformacao(
              titulo: 'Como solicitar o Cartão do Idoso',
              icone: Icons.badge,
              texto:
                  'Em Fortaleza, o Cartão do Idoso pode ser solicitado nos '
                  'pontos de atendimento destinados a esse serviço. Para a '
                  'solicitação, podem ser necessários documentos como RG, '
                  'CPF e comprovante de residência. Caso tenha dúvida sobre '
                  'o local ou os documentos atualizados, procure a Etufor '
                  'ou um posto oficial de atendimento.',
            ),
            const _SecaoInformacao(
              titulo: 'Vagas de estacionamento',
              icone: Icons.local_parking,
              texto:
                  'A legislação garante a reserva de vagas de estacionamento '
                  'para pessoas idosas em estacionamentos públicos e privados '
                  'de uso coletivo. Essas vagas devem estar devidamente '
                  'sinalizadas e localizadas de forma a facilitar o acesso '
                  'da pessoa idosa.',
            ),
            const _SecaoInformacao(
              titulo: 'Credencial de estacionamento',
              icone: Icons.directions_car,
              texto:
                  'Para utilizar as vagas reservadas para pessoas idosas, '
                  'é necessário utilizar a credencial correspondente. '
                  'A credencial deve ser apresentada de forma visível no '
                  'veículo, conforme as regras de trânsito. Ela é válida '
                  'em todo o território nacional.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Não use a vaga sem a credencial',
              icone: Icons.warning_amber,
              texto:
                  'A vaga reservada para pessoa idosa não deve ser utilizada '
                  'sem a credencial exigida. Também não é permitido utilizar '
                  'a credencial de uma pessoa com deficiência para ocupar '
                  'uma vaga destinada exclusivamente à pessoa idosa, ou '
                  'o contrário.',
            ),
            const _SecaoInformacao(
              titulo: 'Transporte interestadual',
              icone: Icons.directions_bus_filled,
              texto:
                  'No transporte coletivo interestadual, pessoas idosas com '
                  '60 anos ou mais e renda individual igual ou inferior a '
                  'dois salários mínimos podem ter direito a duas vagas '
                  'gratuitas por veículo. Quando essas vagas já estiverem '
                  'ocupadas, existe direito a desconto de pelo menos 50% '
                  'no valor da passagem, desde que os requisitos sejam '
                  'atendidos.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Carteira da Pessoa Idosa',
              icone: Icons.credit_card,
              texto:
                  'A Carteira da Pessoa Idosa é um documento digital que '
                  'pode comprovar o direito à gratuidade ou ao desconto '
                  'no transporte interestadual. Ela é destinada a pessoas '
                  'com 60 anos ou mais, renda individual de até dois salários '
                  'mínimos e inscrição no Cadastro Único, conforme os '
                  'requisitos do benefício.',
            ),
            const _SecaoInformacao(
              titulo: 'Antes de uma viagem',
              icone: Icons.luggage,
              texto:
                  'Antes de viajar, confirme o horário, o local de embarque '
                  'e os documentos necessários. Se utilizar algum benefício '
                  'de gratuidade ou desconto, procure a empresa responsável '
                  'com antecedência para confirmar os procedimentos e a '
                  'disponibilidade.',
            ),
            const _SecaoInformacao(
              titulo: 'Durante a viagem',
              icone: Icons.airline_seat_recline_normal,
              texto:
                  'Procure viajar com segurança e sem pressa. Mantenha seus '
                  'documentos e pertences pessoais em local seguro. Se '
                  'precisar de ajuda para embarcar, desembarcar ou guardar '
                  'bagagens, peça auxílio ao responsável pelo transporte.',
            ),
            const _SecaoInformacao(
              titulo: 'Se tiver dificuldade para caminhar',
              icone: Icons.accessibility_new,
              texto:
                  'Se você utiliza bengala, andador ou outro recurso de '
                  'apoio, informe quando precisar de ajuda. Utilize os '
                  'recursos de acessibilidade disponíveis e evite correr '
                  'ou atravessar locais movimentados com pressa.',
            ),
            const _SecaoInformacao(
              titulo: 'Se um direito não for respeitado',
              icone: Icons.report_problem,
              texto:
                  'Se você tiver dificuldade para utilizar um benefício '
                  'ou se sentir desrespeitado, procure primeiro o responsável '
                  'pelo serviço e peça orientação. Anote informações importantes '
                  'como local, horário, linha, empresa ou identificação do '
                  'atendimento. Se necessário, procure os órgãos responsáveis '
                  'pela fiscalização e defesa dos seus direitos.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Prioridade também significa respeito',
              icone: Icons.favorite,
              texto:
                  'Os direitos de transporte existem para ajudar a pessoa '
                  'idosa a circular com segurança, autonomia e dignidade. '
                  'Respeitar assentos preferenciais, filas e vagas reservadas '
                  'é uma responsabilidade de todos.',
            ),
            const _SecaoInformacao(
              titulo: 'Uma dica importante',
              icone: Icons.lightbulb_outline,
              texto:
                  'Tenha sempre um documento de identificação com você. '
                  'Antes de uma viagem, confirme as regras do benefício que '
                  'pretende utilizar. Em caso de dúvida, procure um serviço '
                  'oficial de transporte ou atendimento público.',
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
                  'facilitar o conhecimento sobre os direitos da pessoa idosa. '
                  'As regras podem variar conforme o tipo de transporte e '
                  'a legislação local. Em caso de dúvida, procure um órgão '
                  'ou serviço oficial.',
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