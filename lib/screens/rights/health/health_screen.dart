import 'package:flutter/material.dart';
import 'mental_health/mental_health_screen.dart';
import 'sus_screen.dart';
import 'medications_screen.dart';
import 'vision_hearing_screen.dart';
import 'healthy_eating_screen.dart';
import 'physical_activity_screen.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saúde'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Semantics(
            header: true,
            child: const Text(
              'Saúde e bem-estar',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Informações simples para ajudar você a cuidar da sua saúde e conhecer seus direitos.',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 24),

          _TemaSaude(
            icone: Icons.local_hospital,
            titulo: 'Atendimento pelo SUS',
            descricao: 'Informações sobre atendimento e serviços de saúde.',
            onTap: () { 
              Navigator.push( 
                context, 
                MaterialPageRoute( 
                  builder: (context) => const SusScreen(),
                ), 
              ); 
            },
          ),

          _TemaSaude(
            icone: Icons.psychology,
            titulo: 'Saúde mental',
            descricao: 'Informações sobre bem-estar emocional e quando procurar ajuda.',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MentalHealthScreen(),
                  ),
              );
            },
          ),

          _TemaSaude(
            icone: Icons.medication,
            titulo: 'Medicamentos',
            descricao: 'Informações sobre medicamentos e cuidados durante o tratamento.',
            onTap: () { 
              Navigator.push( 
                context, 
                MaterialPageRoute( 
                  builder: (context) => const MedicationsScreen(),
                ), 
              ); 
            },
          ),

          _TemaSaude(
            icone: Icons.visibility,
            titulo: 'Visão e audição',
            descricao: 'Cuidados importantes com a visão e a audição.',
            onTap: () { 
              Navigator.push( 
                context, 
                MaterialPageRoute( 
                  builder: (context) => const VisionHearingScreen(),
                ), 
              ); 
            },
          ),

          _TemaSaude(
            icone: Icons.restaurant,
            titulo: 'Alimentação saudável',
            descricao: 'Informações sobre alimentação e envelhecimento saudável.',
            onTap: () { 
              Navigator.push( 
                context, 
                MaterialPageRoute( 
                  builder: (context) => const HealthyEatingScreen(),
                ), 
              ); 
            },
          ),

          _TemaSaude(
            icone: Icons.directions_walk,
            titulo: 'Atividade física e prevenção de quedas',
            descricao: 'Cuidados para manter a mobilidade e evitar acidentes.',
            onTap: () { 
              Navigator.push( 
                context, 
                MaterialPageRoute( 
                  builder: (context) => const PhysicalActivityScreen(),
                ), 
              ); 
            },
          ),
        ],
      ),
    );
  }
}

class _TemaSaude extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final VoidCallback? onTap;

  const _TemaSaude({
    required this.icone,
    required this.titulo,
    required this.descricao,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '$titulo. $descricao',
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  icone,
                  size: 42,
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        descricao,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right,
                  size: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}