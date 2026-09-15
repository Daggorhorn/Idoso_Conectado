import 'package:flutter/material.dart';

import '../../app/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Idoso Conectado'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            iconSize: 30,
            tooltip: 'Meu perfil',
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.profile,
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Olá! 👋',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 8),

              Text(
                'Como podemos ajudar você hoje?',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 30),

              _HomeCard(
                icon: Icons.emergency,
                title: 'Emergência',
                subtitle: 'Precisa de ajuda?',
                color: Colors.red,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.emergency,
                  );
                },
              ),


              const SizedBox(height: 16),

              _HomeCard(
                icon: Icons.medication,
                title: 'Medicamentos',
                subtitle: 'Veja seus medicamentos',
                color: Colors.green,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.medications,
                  );
                },
              ),

              const SizedBox(height: 16),

              _HomeCard(
                icon: Icons.calendar_month,
                title: 'Agenda de consultas',
                subtitle: 'Organize suas consultas',
                color: Colors.orange,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.consultations,
                  );
                },
              ),

              const SizedBox(height: 16),

              _HomeCard(
                icon: Icons.menu_book,
                title: 'Direitos dos Idosos',
                subtitle: 'Conheça seus direitos de forma simples.',
                color: Colors.blue,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.rights,
                  );
                },
              ),
            ],
          ),
          ),
        ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  const _HomeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
  return Semantics(
    button: true,
    label: '$title. $subtitle',
    child: Card(
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                icon,
                size: 48,
                color: color,
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    ),
  );
  }
}