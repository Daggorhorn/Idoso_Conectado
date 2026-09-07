class Medicamento {
  final String nome;
  final String dosagem;
  final String horario;
  final String frequencia;

  const Medicamento({
    required this.nome,
    required this.dosagem,
    required this.horario,
    required this.frequencia,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'dosagem': dosagem,
      'horario': horario,
      'frequencia': frequencia,
    };
  }

  factory Medicamento.fromMap(Map<String, dynamic> map) {
    return Medicamento(
      nome: map['nome'] as String,
      dosagem: map['dosagem'] as String,
      horario: map['horario'] as String,
      frequencia: map['frequencia'] as String,
    );
  }
}