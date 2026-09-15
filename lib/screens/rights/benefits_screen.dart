import 'package:flutter/material.dart';

class BenefitsScreen extends StatelessWidget {
  const BenefitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Benefícios e assistência'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SecaoInformacao(
              titulo: 'Assistência social',
              icone: Icons.support_agent,
              texto:
                  'A assistência social oferece serviços e benefícios '
                  'para ajudar pessoas e famílias que estejam passando '
                  'por dificuldades. A pessoa idosa pode procurar a rede '
                  'de assistência social do município para conhecer os '
                  'serviços disponíveis.',
            ),
            const _SecaoInformacao(
              titulo: 'O que é o CRAS?',
              icone: Icons.location_city,
              texto:
                  'O CRAS é o Centro de Referência de Assistência Social. '
                  'Ele é um dos principais locais para receber orientação '
                  'sobre benefícios sociais, Cadastro Único e outros '
                  'serviços de assistência. Procure o CRAS mais próximo '
                  'da sua residência quando precisar de orientação.',
            ),
            const _SecaoInformacao(
              titulo: 'Cadastro Único',
              icone: Icons.assignment_ind,
              texto:
                  'O Cadastro Único, também chamado de CadÚnico, reúne '
                  'informações sobre famílias de baixa renda e é utilizado '
                  'para acesso a diversos programas sociais. O cadastro '
                  'é gratuito e pode ser realizado presencialmente em '
                  'postos de atendimento do município, como o CRAS.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Mantenha o Cadastro Único atualizado',
              icone: Icons.update,
              texto:
                  'O Cadastro Único deve ser atualizado a cada 24 meses '
                  'ou sempre que houver alguma mudança importante na família, '
                  'como alteração de endereço, renda ou composição familiar. '
                  'Manter os dados atualizados ajuda a evitar problemas '
                  'na análise e manutenção de benefícios.',
            ),
            const _SecaoInformacao(
              titulo: 'Benefício de Prestação Continuada (BPC)',
              icone: Icons.account_balance_wallet,
              texto:
                  'O BPC é um benefício assistencial que garante um salário '
                  'mínimo por mês à pessoa idosa com 65 anos ou mais que '
                  'atenda aos critérios de baixa renda. O BPC não é '
                  'aposentadoria e não exige contribuição anterior ao INSS.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Quem pode ter direito ao BPC?',
              icone: Icons.person_search,
              texto:
                  'Para o BPC destinado à pessoa idosa, é necessário ter '
                  '65 anos ou mais e atender aos critérios de renda familiar '
                  'por pessoa. Também é necessário estar inscrito no '
                  'Cadastro Único, com os dados atualizados e CPF dos '
                  'integrantes da família, além de cumprir os demais '
                  'requisitos do benefício.',
            ),
            const _SecaoInformacao(
              titulo: 'O BPC não é aposentadoria',
              icone: Icons.info_outline,
              texto:
                  'O BPC é um benefício assistencial e possui regras '
                  'diferentes da aposentadoria. A pessoa não precisa ter '
                  'contribuído para o INSS para solicitar o BPC, desde que '
                  'cumpra os critérios exigidos. O benefício também não '
                  'paga 13º salário e não gera pensão por morte.',
            ),
            const _SecaoInformacao(
              titulo: 'Como solicitar o BPC',
              icone: Icons.phone_android,
              texto:
                  'O pedido do BPC pode ser realizado pelo Meu INSS. '
                  'Também é possível procurar o CRAS para receber orientação '
                  'sobre o Cadastro Único e os critérios do benefício. '
                  'Se precisar de atendimento do INSS, também é possível '
                  'ligar para o telefone 135.',
            ),
            const _SecaoInformacao(
              titulo: 'Carteira da Pessoa Idosa',
              icone: Icons.credit_card,
              texto:
                  'A Carteira da Pessoa Idosa é um documento digital que '
                  'pode comprovar o direito à gratuidade de duas vagas '
                  'ou ao desconto mínimo de 50% nas passagens do transporte '
                  'interestadual. O benefício é destinado a pessoas com '
                  '60 anos ou mais, renda individual de até dois salários '
                  'mínimos e inscrição no Cadastro Único.',
            ),
            const _SecaoInformacao(
              titulo: 'Como conseguir a Carteira da Pessoa Idosa',
              icone: Icons.badge,
              texto:
                  'A Carteira pode ser emitida pela internet usando uma '
                  'conta gov.br. Quem precisar de ajuda pode procurar o '
                  'CRAS para receber orientação ou auxílio na emissão. '
                  'É importante manter o Cadastro Único atualizado.',
            ),
            const _SecaoInformacao(
              titulo: 'Outros programas sociais',
              icone: Icons.volunteer_activism,
              texto:
                  'O Cadastro Único também pode ser utilizado como porta '
                  'de entrada para diversos programas sociais. Alguns '
                  'programas são federais, enquanto outros são oferecidos '
                  'pelos estados e municípios. Os critérios podem variar '
                  'de acordo com cada programa.',
            ),
            const _SecaoInformacao(
              titulo: 'Quando procurar o CRAS',
              icone: Icons.help_outline,
              texto:
                  'Procure o CRAS quando tiver dúvidas sobre Cadastro Único, '
                  'benefícios sociais ou serviços de assistência. Também '
                  'procure ajuda quando houver mudança na renda, endereço '
                  'ou composição da família e você precisar atualizar '
                  'seus dados.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Cuidado com golpes',
              icone: Icons.security,
              texto:
                  'Desconfie de pessoas que prometem liberar benefícios '
                  'em troca de dinheiro ou pedem senhas, códigos ou dados '
                  'bancários sem uma justificativa oficial. Não entregue '
                  'seus documentos a desconhecidos e procure os canais '
                  'oficiais do governo quando tiver dúvidas.',
            ),
            const _SecaoInformacao(
              titulo: 'Não pague para fazer o Cadastro Único',
              icone: Icons.money_off,
              texto:
                  'O Cadastro Único é gratuito. Não é necessário pagar '
                  'para fazer ou atualizar o cadastro nos postos oficiais. '
                  'Se alguém cobrar pelo serviço, procure orientação em '
                  'um canal oficial da assistência social do seu município.',
            ),
            const _SecaoInformacao(
              titulo: 'Se um benefício for negado',
              icone: Icons.report_problem,
              texto:
                  'Se um benefício for negado, suspenso ou interrompido, '
                  'procure entender o motivo informado pelo órgão responsável. '
                  'Guarde documentos, protocolos e mensagens recebidas. '
                  'Quando necessário, procure o CRAS, o INSS ou outro '
                  'serviço responsável para receber orientação sobre '
                  'as próximas etapas.',
              destaque: true,
            ),
            const _SecaoInformacao(
              titulo: 'Tenha seus documentos organizados',
              icone: Icons.folder_shared,
              texto:
                  'Mantenha seus documentos pessoais e os documentos '
                  'relacionados aos benefícios organizados. Sempre que '
                  'possível, guarde comprovantes, protocolos e documentos '
                  'entregues ou recebidos durante um atendimento.',
            ),
            const _SecaoInformacao(
              titulo: 'Peça ajuda quando precisar',
              icone: Icons.people,
              texto:
                  'Você não precisa resolver tudo sozinho. Se tiver '
                  'dificuldade para utilizar um aplicativo, preencher '
                  'um formulário ou entender uma informação, peça ajuda '
                  'a uma pessoa de confiança ou procure atendimento '
                  'presencial em um serviço público.',
            ),
            const _SecaoInformacao(
              titulo: 'Uma dica importante',
              icone: Icons.lightbulb_outline,
              texto:
                  'Mantenha seus dados atualizados, procure os serviços '
                  'oficiais e nunca entregue senhas ou códigos de segurança '
                  'a desconhecidos. Em caso de dúvida, procure o CRAS, '
                  'o INSS ou outro órgão público responsável pelo benefício.',
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
                  'facilitar o conhecimento sobre benefícios e serviços '
                  'de assistência social. Os critérios podem variar '
                  'conforme cada programa. Para informações atualizadas, '
                  'procure sempre os canais oficiais.',
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