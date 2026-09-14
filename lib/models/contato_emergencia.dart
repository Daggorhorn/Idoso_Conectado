class ContatoEmergencia {
  final String nome;
  final String telefone;

  ContatoEmergencia({
    required this.nome,
    required this.telefone,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'telefone': telefone,
    };
  }

  factory ContatoEmergencia.fromMap(Map<String, dynamic> map) {
    return ContatoEmergencia(
      nome: map['nome'] ?? '',
      telefone: map['telefone'] ?? '',
    );
  }
}