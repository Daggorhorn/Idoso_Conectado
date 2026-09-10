import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../models/medicamento.dart';
import '../../services/notification_service.dart';
import '../../services/storage_service.dart';

class MedicationsScreen extends StatefulWidget {
  const MedicationsScreen({super.key});

  @override
  State<MedicationsScreen> createState() => _MedicationsScreenState();
}

class _MedicationsScreenState extends State<MedicationsScreen> {
  final StorageService _storageService = StorageService();
  final NotificationService _notificationService = NotificationService();

  List<Medicamento> _medicamentos = [];
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    _carregarMedicamentos();
  }

  Future<void> _carregarMedicamentos() async {
    final medicamentos = await _storageService.carregarMedicamentos();

    if (!mounted) return;

    setState(() {
      _medicamentos = medicamentos;
      _carregando = false;
    });
  }

  int _gerarIdNotificacao(Medicamento medicamento) {
    final texto =
        '${medicamento.nome}|'
        '${medicamento.dosagem}|'
        '${medicamento.horario}|'
        '${medicamento.frequencia}';

    int hash = 0x811c9dc5;

    for (final caractere in texto.codeUnits) {
      hash ^= caractere;
      hash = (hash * 0x01000193) & 0x7fffffff;
    }

    return hash;
  }

  Future<void> _adicionarMedicamento() async {
    final medicamento = await Navigator.pushNamed(
      context,
      AppRoutes.addMedication,
    );

    if (medicamento != null && medicamento is Medicamento) {
      setState(() {
        _medicamentos.add(medicamento);
      });

      await _storageService.salvarMedicamentos(_medicamentos);
    }
  }

  Future<void> _editarMedicamento(int index) async {
    final medicamentoAtual = _medicamentos[index];

    final medicamentoEditado = await Navigator.pushNamed(
      context,
      AppRoutes.addMedication,
      arguments: medicamentoAtual,
    );

    if (medicamentoEditado != null && medicamentoEditado is Medicamento) {
      setState(() {
        _medicamentos[index] = medicamentoEditado;
      });

      await _storageService.salvarMedicamentos(_medicamentos);
    }
  }

  Future<void> _removerMedicamento(int index) async {
    final medicamento = _medicamentos[index];

    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir medicamento'),
          content: Text(
            'Deseja realmente excluir o medicamento '
            '"${medicamento.nome}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );

    if (confirmar != true) {
      return;
    }

    final idNotificacao = _gerarIdNotificacao(medicamento);

    await _notificationService.cancelar(idNotificacao);

    if (!mounted) return;

    setState(() {
      _medicamentos.removeAt(index);
    });

    await _storageService.salvarMedicamentos(_medicamentos);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Medicamento "${medicamento.nome}" excluído.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamentos'),
      ),
      body: SafeArea(
        child: _carregando
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _medicamentos.isEmpty
                ? _buildListaVazia()
                : ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Text(
                        'Meus medicamentos',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Confira os medicamentos cadastrados.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 24),
                      ...List.generate(
                        _medicamentos.length,
                        (index) => _buildMedicamentoCard(
                          _medicamentos[index],
                          index,
                        ),
                      ),
                    ],
                  ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _adicionarMedicamento,
        icon: const Icon(Icons.add),
        label: const Text('Adicionar'),
      ),
    );
  }

  Widget _buildListaVazia() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medication_outlined,
              size: 90,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Nenhum medicamento cadastrado',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(
              'Toque em "Adicionar" para cadastrar um medicamento.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicamentoCard(
    Medicamento medicamento,
    int index,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              child: const Icon(
                Icons.medication,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicamento.nome,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Dosagem: ${medicamento.dosagem}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Horário: ${medicamento.horario}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Frequência: ${medicamento.frequencia}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () => _editarMedicamento(index),
                  tooltip: 'Editar medicamento',
                  icon: const Icon(Icons.edit_outlined),
                ),
                IconButton(
                  onPressed: () => _removerMedicamento(index),
                  tooltip: 'Excluir medicamento',
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}