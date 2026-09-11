class Consulta {
  final int id;
  final String medico;
  final String data;
  final String horario;
  final String local;
  final String observacoes;

  // Data e hora reais da consulta.
  // É usada para calcular os lembretes.
  final DateTime dataHora;

  Consulta({
    required this.id,
    required this.medico,
    required this.data,
    required this.horario,
    required this.local,
    required this.observacoes,
    required this.dataHora,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'medico': medico,
      'data': data,
      'horario': horario,
      'local': local,
      'observacoes': observacoes,
      'dataHora': dataHora.toIso8601String(),
    };
  }

  factory Consulta.fromMap(Map<String, dynamic> map) {
    DateTime dataHora;

    // ----------------------------------------------------------
    // NOVO FORMATO
    // ----------------------------------------------------------

    final dataHoraSalva = map['dataHora'];

    if (dataHoraSalva != null &&
        dataHoraSalva.toString().isNotEmpty) {
      dataHora = DateTime.parse(
        dataHoraSalva.toString(),
      );
    } else {
      // --------------------------------------------------------
      // COMPATIBILIDADE COM CONSULTAS ANTIGAS
      // --------------------------------------------------------
      //
      // Caso exista uma consulta salva antes desta atualização,
      // tentamos reconstruir a data e o horário.
      //

      final dataTexto = map['data']?.toString() ?? '';
      final horarioTexto = map['horario']?.toString() ?? '';

      final partesData = dataTexto.split('/');

      int dia = 1;
      int mes = 1;
      int ano = 2000;

      if (partesData.length == 3) {
        dia = int.tryParse(partesData[0]) ?? 1;
        mes = int.tryParse(partesData[1]) ?? 1;
        ano = int.tryParse(partesData[2]) ?? 2000;
      }

      int hora = 0;
      int minuto = 0;

      final partesHorario = horarioTexto.split(':');

      if (partesHorario.length >= 2) {
        hora = int.tryParse(partesHorario[0]) ?? 0;

        final minutoTexto =
            partesHorario[1]
                .replaceAll(RegExp(r'[^0-9]'), '');

        minuto = int.tryParse(minutoTexto) ?? 0;
      }

      dataHora = DateTime(
        ano,
        mes,
        dia,
        hora,
        minuto,
      );
    }

    // ----------------------------------------------------------
    // ID
    // ----------------------------------------------------------

    final idSalvo = map['id'];

    int id;

    if (idSalvo != null) {
      id = int.tryParse(
            idSalvo.toString(),
          ) ??
          _gerarId(
            dataHora,
            map['medico']?.toString() ?? '',
          );
    } else {
      id = _gerarId(
        dataHora,
        map['medico']?.toString() ?? '',
      );
    }

    return Consulta(
      id: id,
      medico: map['medico']?.toString() ?? '',
      data: map['data']?.toString() ?? '',
      horario: map['horario']?.toString() ?? '',
      local: map['local']?.toString() ?? '',
      observacoes:
          map['observacoes']?.toString() ?? '',
      dataHora: dataHora,
    );
  }

  // ------------------------------------------------------------
  // GERA UM ID DETERMINÍSTICO PARA CONSULTAS ANTIGAS
  // ------------------------------------------------------------

  static int _gerarId(
    DateTime dataHora,
    String medico,
  ) {
    final texto =
        '${dataHora.toIso8601String()}_$medico';

    int hash = 0;

    for (final caractere in texto.codeUnits) {
      hash = ((hash * 31) + caractere) & 0x7fffffff;
    }

    // Mantém o ID dentro de uma faixa segura para
    // identificadores de notificações Android.
    return hash == 0 ? 1 : hash;
  }
}