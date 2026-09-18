import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../important_places/important_places_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Idoso Conectado'),
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

              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 0.90,
                children: [
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

                  _HomeCard(
                    icon: Icons.calendar_month,
                    title: 'Consultas',
                    subtitle: 'Organize suas consultas',
                    color: Colors.orange,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.consultations,
                      );
                    },
                  ),

                  _HomeCard(
                    icon: Icons.location_on,
                    title: 'Locais importantes',
                    subtitle:
                        'Encontre locais e serviços que podem ajudar você.',
                    color: Colors.teal,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ImportantPlacesScreen(),
                        ),
                      );
                    },
                  ),

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

              const SizedBox(height: 20),
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
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 56,
                  color: color,
                ),

                const SizedBox(height: 16),

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  softWrap: false,
                  style: Theme.of(context).textTheme.titleLarge,
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