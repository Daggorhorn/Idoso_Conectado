import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/consulta.dart';
import '../../services/notification_service.dart';
import '../../services/storage_service.dart';

class ConsultationsScreen extends StatefulWidget {
  const ConsultationsScreen({super.key});

  @override
  State<ConsultationsScreen> createState() =>
      _ConsultationsScreenState();
}

class _ConsultationsScreenState
    extends State<ConsultationsScreen> {
  final List<Consulta> _consultas = [];

  final StorageService _storageService =
      StorageService();

  final NotificationService _notificationService =
      NotificationService();

  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _carregarConsultas();
  }

  Future<void> _carregarConsultas() async {
    final consultas =
        await _storageService.carregarConsultas();

    if (!mounted) return;

    setState(() {
      _consultas
        ..clear()
        ..addAll(consultas);
    });
  }

  int _gerarIdConsulta() {
    int id;

    do {
      // Faixa reservada para IDs das consultas.
      // Mantém o valor dentro de uma faixa segura
      // para as notificações Android.
      id =
          1500000000 +
          _random.nextInt(499999998);
    } while (
        _consultas.any(
      (consulta) => consulta.id == id,
    ));

    return id;
  }

  Future<void> _adicionarConsulta() async {
    final consulta =
        await _mostrarFormularioConsulta();

    if (consulta == null) return;

    setState(() {
      _consultas.add(consulta);
    });

    await _storageService
        .salvarConsultas(_consultas);

    // Agenda os lembretes da consulta.
    await _notificationService.agendarConsulta(
      id: consulta.id,
      medico: consulta.medico,
      dataHora: consulta.dataHora,
      local: consulta.local,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Consulta salva e lembretes agendados.',
        ),
      ),
    );
  }

  Future<Consulta?> _mostrarFormularioConsulta() async {
    final medicoController =
        TextEditingController();

    final localController =
        TextEditingController();

    final observacoesController =
        TextEditingController();

    DateTime? dataSelecionada;
    TimeOfDay? horarioSelecionado;

    return showDialog<Consulta>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (
            context,
            setDialogState,
          ) {
            return AlertDialog(
              title: Semantics (
              header: true,
              child: const Text(
                'Nova consulta',
              ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min,
                  children: [
                    Semantics(
                      textField: true,
                      label: 'Médico ou profissional',
                    child: TextField(
                      controller:
                        medicoController,
                      textCapitalization:
                        TextCapitalization.words,
                      decoration:
                        const InputDecoration(
                      labelText:
                          'Médico ou profissional',
                      prefixIcon:
                        Icon(
                          Icons.person_outline,
                        ),
                      ),
                    ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                  Semantics(
                    button: true,
                    label: dataSelecionada == null
                        ? 'Selecionar data da consulta'
                        : 'Data da consulta: ${dataSelecionada!.day.toString().padLeft(2, '0')}/${dataSelecionada!.month.toString().padLeft(2, '0')}/${dataSelecionada!.year}',
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.zero,
                      leading:
                          const Icon(
                        Icons
                            .calendar_today,
                      ),
                      title: Text(
                        dataSelecionada ==
                                null
                            ? 'Selecionar data'
                            : '${dataSelecionada!.day.toString().padLeft(2, '0')}/'
                              '${dataSelecionada!.month.toString().padLeft(2, '0')}/'
                              '${dataSelecionada!.year}',
                      ),
                      onTap: () async {
                        final data =
                            await showDatePicker(
                          context:
                              context,
                          initialDate:
                              DateTime.now(),
                          firstDate:
                              DateTime.now(),
                          lastDate:
                              DateTime(2100),
                        );

                        if (data !=
                            null) {
                          setDialogState(
                            () {
                              dataSelecionada =
                                  data;
                            },
                          );
                        }
                      },
                    ),
                  ),
                    Semantics(
                      button: true,
                      label: horarioSelecionado == null
                          ? 'Selecionar horário da consulta'
                        : 'Horário da consulta: ${horarioSelecionado!.format(context)}',
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.zero,
                      leading:
                          const Icon(
                        Icons.access_time,
                          ),
                      title: Text(
                      horarioSelecionado ==
                           null
                          ? 'Selecionar horário'
                          : horarioSelecionado!
                          .format(
                        context,
                        ),
                    ),
                    onTap: () async {
                      final horario =
                        await showTimePicker(
                      context:
                        context,
                      initialTime:
                        TimeOfDay.now(),
                      );

                      if (horario !=
                      null) {
                    setDialogState(
                    () {
                    horarioSelecionado =
                        horario;
                        },
                    );
                    }
                  },
                ),
              ),

                  Semantics(
                    textField: true,
                    label: 'Local da consulta',  
                    child: TextField(
                      controller:
                          localController,
                      textCapitalization:
                          TextCapitalization.words,
                      decoration:
                          const InputDecoration(
                        labelText: 'Local',
                        prefixIcon:
                            Icon(
                          Icons
                              .location_on_outlined,
                        ),
                      ),
                    ),
                  ),
                    
                  const SizedBox(
                    height: 16,
                  ),

                  Semantics(
                    textField: true,
                    label: 'Observações da consulta',
                    child:TextField(
                      controller:
                          observacoesController,
                      textCapitalization:
                          TextCapitalization.sentences,
                      maxLines: 2,
                      decoration:
                          const InputDecoration(
                        labelText:
                            'Observações',
                        prefixIcon:
                            Icon(
                          Icons.notes_outlined,
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
              actions: [
              Semantics(
                button: true,
                label: 'Cancelar nova consulta',
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child:
                      const Text(
                    'Cancelar',
                  ),
                ),
              ),

              Semantics(
                button: true,
                label: 'Salvar nova consulta',
                child: FilledButton(
                  onPressed: () {
                    if (medicoController
                            .text
                            .trim()
                            .isEmpty ||
                        dataSelecionada ==
                            null ||
                        horarioSelecionado ==
                            null) {
                      ScaffoldMessenger
                              .of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Preencha o profissional, a data e o horário.',
                          ),
                        ),
                      );
                      return;
                    }

                    final dataHora =
                        DateTime(
                      dataSelecionada!
                          .year,
                      dataSelecionada!
                          .month,
                      dataSelecionada!
                          .day,
                      horarioSelecionado!
                          .hour,
                      horarioSelecionado!
                          .minute,
                    );

                    final id =
                        _gerarIdConsulta();

                    Navigator.pop(
                      context,
                      Consulta(
                        id: id,
                        medico:
                            medicoController
                                .text
                                .trim(),
                        data:
                            '${dataSelecionada!.day.toString().padLeft(2, '0')}/'
                            '${dataSelecionada!.month.toString().padLeft(2, '0')}/'
                            '${dataSelecionada!.year}',
                        horario:
                            horarioSelecionado!
                                .format(
                          context,
                        ),
                        local:
                            localController
                                .text
                                .trim(),
                        observacoes:
                            observacoesController
                                .text
                                .trim(),
                        dataHora:
                            dataHora,
                      ),
                    );
                  },
                  child:
                      const Text(
                    'Salvar',
                  ),
                ),
              ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _removerConsulta(
    int index,
  ) async {
    final confirmar =
        await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Excluir consulta?',
          ),
          content: const Text(
            'Essa consulta será removida da agenda.',
          ),
          actions: [
            Semantics(
              button: true,
              label: 'Cancelar exclusão da consulta',
              child:TextButton(
                onPressed: () =>
                  Navigator.pop(
                context,
                false,
              ),
              child:
                  const Text(
                'Cancelar',
              ),
            ),
            ),
            Semantics(
              button: true,
              label: 'Confirmar exclusão da consulta',
              child: FilledButton(
                  onPressed: () =>
                      Navigator.pop(
                    context,
                    true,
                  ),
                  child:
                      const Text(
                    'Excluir',
                   ),
                ),
            ),
          ],
        );
      },
    );

    if (confirmar != true) return;

    final consulta =
        _consultas[index];

    await _notificationService
        .cancelarConsulta(
      consulta.id,
    );

    setState(() {
      _consultas.removeAt(index);
    });

    await _storageService
        .salvarConsultas(_consultas);

    if (!mounted) return;

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'Consulta removida da agenda.',
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agenda de consultas',
        ),
      ),
      body: SafeArea(
        child: _consultas.isEmpty
            ? _buildListaVazia()
            : ListView(
                padding:
                    const EdgeInsets.all(
                  20,
                ),
                children: [
                  Text(
                    'Minhas consultas',
                    style:
                        Theme.of(
                      context,
                    )
                            .textTheme
                            .headlineMedium,
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    'Organize suas consultas e compromissos.',
                    style:
                        Theme.of(
                      context,
                    )
                            .textTheme
                            .bodyLarge,
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  ...List.generate(
                    _consultas.length,
                    (index) =>
                        _buildConsultaCard(
                      _consultas[index],
                      index,
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: Semantics(
          button: true,
          label: 'Adicionar nova consulta',
          child: FloatingActionButton.extended(
             onPressed: _adicionarConsulta,
              icon: const Icon(
                Icons.add,
              ),
              label: const Text(
                'Adicionar',
              ),
          ),
      ),
    );
  }

  Widget _buildListaVazia() {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.all(
          32,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              Icons
                  .calendar_month_outlined,
              size: 90,
              color: Theme.of(
                context,
              )
                  .colorScheme
                  .primary,
            ),

            const SizedBox(
              height: 24,
            ),

            Text(
              'Nenhuma consulta cadastrada',
              textAlign:
                  TextAlign.center,
              style:
                  Theme.of(
                context,
              )
                          .textTheme
                          .titleLarge,
            ),

            const SizedBox(
              height: 12,
            ),

            Text(
              'Toque em "Adicionar" para cadastrar uma consulta.',
              textAlign:
                  TextAlign.center,
              style:
                  Theme.of(
                context,
              )
                          .textTheme
                          .bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsultaCard(
    Consulta consulta,
    int index,
  ) {
    return Card(
      margin:
          const EdgeInsets.only(
        bottom: 16,
      ),
      child: Padding(
        padding:
            const EdgeInsets.all(
          20,
        ),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              child:
                  const Icon(
                Icons
                    .calendar_month,
                size: 30,
              ),
            ),

            const SizedBox(
              width: 16,
            ),

            Expanded(
              child: Semantics(
                container: true,
                label: [
                'Consulta com ${consulta.medico}',
                'Data: ${consulta.data}',
                'Horário: ${consulta.horario}',
                if (consulta.local.isNotEmpty)
                  'Local: ${consulta.local}',
                if (consulta.observacoes.isNotEmpty)
                  'Observações: ${consulta.observacoes}',
                ].join('. '),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    consulta.medico,
                    style:
                        Theme.of(
                      context,
                    )
                            .textTheme
                            .titleLarge,
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    'Data: ${consulta.data}',
                    style:
                        Theme.of(
                      context,
                    )
                            .textTheme
                            .bodyLarge,
                  ),

                  Text(
                    'Horário: ${consulta.horario}',
                    style:
                        Theme.of(
                      context,
                    )
                            .textTheme
                            .bodyLarge,
                  ),

                  if (consulta
                      .local
                      .isNotEmpty)
                    Text(
                      'Local: ${consulta.local}',
                      style:
                          Theme.of(
                        context,
                      )
                              .textTheme
                              .bodyLarge,
                    ),

                  if (consulta
                      .observacoes
                      .isNotEmpty) ...[
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Observações: ${consulta.observacoes}',
                      style:
                          Theme.of(
                        context,
                      )
                              .textTheme
                              .bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
            ),
      
      Semantics(
        button: true,
        label: 'Excluir consulta de ${consulta.medico}',
        child: IconButton(
          onPressed: () =>
              _removerConsulta(
            index,
          ),
          tooltip: 'Excluir consulta',
          icon: const Icon(
            Icons.delete_outline,
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}