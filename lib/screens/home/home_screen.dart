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
                onTap: () {},
              ),

              const SizedBox(height: 16),

              _HomeCard(
                icon: Icons.notifications,
                title: 'Lembretes',
                subtitle: 'Confira seus lembretes',
                color: Colors.orange,
                onTap: () {},
              ),

              const SizedBox(height: 16),

              _HomeCard(
                icon: Icons.people,
                title: 'Contatos',
                subtitle: 'Pessoas importantes',
                color: Colors.blue,
                onTap: () {},
              ),

              const SizedBox(height: 16),

              _HomeCard(
                icon: Icons.location_on,
                title: 'Localização',
                subtitle: 'Compartilhe sua localização',
                color: Colors.purple,
                onTap: () {},
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
    return Card(
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
    );
  }
}