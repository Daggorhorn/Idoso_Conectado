import 'package:flutter/material.dart';

import '../../models/medicamento.dart';
import '../../services/notification_service.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  Medicamento? _medicamentoEmEdicao;
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _dosagemController = TextEditingController();
  final _horarioController = TextEditingController();

  String _frequencia = 'Todos os dias';

  final NotificationService _notificationService =
      NotificationService();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final medicamento = ModalRoute.of(context)?.settings.arguments;

      if (medicamento is Medicamento) {
        setState(() {
          _medicamentoEmEdicao = medicamento;
          _nomeController.text = medicamento.nome;
          _dosagemController.text = medicamento.dosagem;
          _horarioController.text = medicamento.horario;
          _frequencia = medicamento.frequencia;
        });
      }
    });
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _dosagemController.dispose();
    _horarioController.dispose();
    super.dispose();
  }

  // Converte o horário escolhido pelo TimePicker para HH:mm.
  String _formatarHorario(TimeOfDay horario) {
    final hora = horario.hour.toString().padLeft(2, '0');
    final minuto = horario.minute.toString().padLeft(2, '0');

    return '$hora:$minuto';
  }

  int _gerarIdNotificacao(Medicamento medicamento) {
    final texto =
        '${medicamento.nome}|'
        '${medicamento.dosagem}|'
        '${medicamento.horario}|'
        '${medicamento.frequencia}';

    int hash = 2166136261;

    for (final caractere in texto.codeUnits) {
      hash ^= caractere;
      hash = (hash * 16777619) & 0x7fffffff;
    }

    return hash == 0 ? 1 : hash;
  }

  Future<void> _agendarNotificacao(
    Medicamento medicamento,
  ) async {
    if (!_notificationService.inicializado) {
      await _notificationService.inicializar();
    }

    final id = _gerarIdNotificacao(medicamento);

    if (medicamento.frequencia == 'Todos os dias') {
      await _notificationService.agendarMedicamentoDiario(
        id: id,
        nomeMedicamento: medicamento.nome,
        horario: medicamento.horario,
      );
    } else {
      await _notificationService.agendarMedicamento(
        id: id,
        nomeMedicamento: medicamento.nome,
        horario: medicamento.horario,
      );
    }
  }

  Future<void> _salvarMedicamento() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final medicamento = Medicamento(
      nome: _nomeController.text.trim(),
      dosagem: _dosagemController.text.trim(),
      horario: _horarioController.text.trim(),
      frequencia: _frequencia,
    );

    // Se estiver editando, cancela a notificação anterior.
    if (_medicamentoEmEdicao != null) {
      final idAntigo =
          _gerarIdNotificacao(_medicamentoEmEdicao!);

      await _notificationService.cancelar(idAntigo);
    }

    // Cria o novo lembrete.
    await _agendarNotificacao(medicamento);

    if (!mounted) {
      return;
    }

    Navigator.pop(context, medicamento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _medicamentoEmEdicao == null
              ? 'Adicionar Medicamento'
              : 'Editar Medicamento',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.medication_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 20),

                Text(
                  _medicamentoEmEdicao == null
                      ? 'Novo medicamento'
                      : 'Editar medicamento',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium,
                ),

                const SizedBox(height: 30),

                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do medicamento',
                    hintText: 'Ex.: Losartana',
                    prefixIcon: Icon(Icons.medication),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Informe o nome do medicamento';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _dosagemController,
                  decoration: const InputDecoration(
                    labelText: 'Dosagem',
                    hintText: 'Ex.: 50 mg',
                    prefixIcon: Icon(Icons.scale),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Informe a dosagem';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _horarioController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Horário',
                    hintText: 'Selecione o horário',
                    prefixIcon: Icon(Icons.access_time),
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    final horario = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (horario != null) {
                      setState(() {
                        _horarioController.text =
                            _formatarHorario(horario);
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Informe o horário';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  initialValue: _frequencia,
                  decoration: const InputDecoration(
                    labelText: 'Frequência',
                    prefixIcon: Icon(Icons.repeat),
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Todos os dias',
                      child: Text('Todos os dias'),
                    ),
                    DropdownMenuItem(
                      value: 'Dias úteis',
                      child: Text('Dias úteis'),
                    ),
                    DropdownMenuItem(
                      value: 'Uma vez',
                      child: Text('Uma vez'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _frequencia = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 35),

                SizedBox(
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: _salvarMedicamento,
                    icon: const Icon(
                      Icons.save,
                      size: 28,
                    ),
                    label: Text(
                      _medicamentoEmEdicao == null
                          ? 'SALVAR MEDICAMENTO'
                          : 'ATUALIZAR MEDICAMENTO',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}