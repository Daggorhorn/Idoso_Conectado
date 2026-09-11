import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/consulta.dart';
import '../models/medicamento.dart';

class StorageService {
  static const String _medicamentosKey = 'medicamentos';
  static const String _consultasKey = 'consultas';

  Future<void> salvarMedicamentos(
    List<Medicamento> medicamentos,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final lista = medicamentos
        .map((medicamento) => medicamento.toMap())
        .toList();

    final dados = jsonEncode(lista);

    await prefs.setString(_medicamentosKey, dados);
  }

  Future<List<Medicamento>> carregarMedicamentos() async {
    final prefs = await SharedPreferences.getInstance();

    final dados = prefs.getString(_medicamentosKey);

    if (dados == null || dados.isEmpty) {
      return [];
    }

    final lista = jsonDecode(dados) as List;

    return lista
        .map(
          (item) => Medicamento.fromMap(
            Map<String, dynamic>.from(item as Map),
          ),
        )
        .toList();
  }

  Future<void> salvarConsultas(
    List<Consulta> consultas,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final lista = consultas
        .map((consulta) => consulta.toMap())
        .toList();

    final dados = jsonEncode(lista);

    await prefs.setString(_consultasKey, dados);
  }

  Future<List<Consulta>> carregarConsultas() async {
    final prefs = await SharedPreferences.getInstance();

    final dados = prefs.getString(_consultasKey);

    if (dados == null || dados.isEmpty) {
      return [];
    }

    final lista = jsonDecode(dados) as List;

    return lista
        .map(
          (item) => Consulta.fromMap(
            Map<String, dynamic>.from(item as Map),
          ),
        )
        .toList();
  }
}