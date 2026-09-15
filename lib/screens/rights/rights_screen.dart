import 'package:flutter/material.dart';

import '../../app/routes.dart';
import 'transport_screen.dart';

class RightsScreen extends StatelessWidget {
  const RightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Direitos dos Idosos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Semantics(
            header: true,
            child: const Text(
              'Conheça seus direitos',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Informações simples para ajudar você a conhecer e exercer seus direitos.',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 24),

          _CategoriaDireito(
            icone: Icons.local_hospital,
            titulo: 'Saúde',
            descricao: 'Informações sobre atendimento e cuidados de saúde.',
            onTap: () {
                Navigator.pushNamed(
              context,
              AppRoutes.health,
              );
            },
          ),

          _CategoriaDireito(
            icone: Icons.directions_bus,
            titulo: 'Transporte',
            descricao: 'Informações sobre direitos relacionados ao transporte.',
            onTap: () { 
              Navigator.push( 
                context, 
                MaterialPageRoute( 
                  builder: (context) => const TransportScreen(),
                ), 
              );
            },
          ),

          _CategoriaDireito(
            icone: Icons.account_balance_wallet,
            titulo: 'Benefícios e assistência',
            descricao: 'Informações sobre benefícios e serviços de assistência.',
          ),

          _CategoriaDireito(
            icone: Icons.shield,
            titulo: 'Proteção contra violência',
            descricao: 'Informações sobre proteção, respeito e denúncia.',
          ),

          _CategoriaDireito(
            icone: Icons.home,
            titulo: 'Moradia',
            descricao: 'Informações sobre direitos relacionados à moradia.',
          ),

          _CategoriaDireito(
            icone: Icons.family_restroom,
            titulo: 'Família e convivência',
            descricao: 'Informações sobre convivência familiar e comunitária.',
          ),
        ],
      ),
    );
  }
}

class _CategoriaDireito extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final VoidCallback? onTap;

  const _CategoriaDireito({
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