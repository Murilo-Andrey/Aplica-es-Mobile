import 'package:flutter/material.dart';
import 'theme.dart';
import 'destino.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('S&M Hotel')),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Text(
              'Escolha seu próximo destino',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Destino(
            "Angra dos Reis",
            "https://picsum.photos/seed/angra-praia/900/700",
            384,
            70,
          ),
          Destino(
            "Jericoacoara",
            "https://picsum.photos/seed/jeri-dunas/900/700",
            571,
            75,
          ),
          Destino(
            "Arraial do Cabo",
            "https://picsum.photos/seed/arraial-mar/900/700",
            534,
            65,
          ),
          Destino(
            "Florianópolis",
            "https://picsum.photos/seed/flori-ilha/900/700",
            348,
            85,
          ),
          Destino(
            "Madri",
            "https://picsum.photos/seed/madri-cidade/900/700",
            401,
            85,
          ),
          Destino(
            "Paris",
            "https://picsum.photos/seed/paris-torre/900/700",
            546,
            95,
          ),
          Destino(
            "Orlando",
            "https://picsum.photos/seed/orlando-parque/900/700",
            616,
            105,
          ),
          Destino(
            "LasVegas",
            "https://picsum.photos/seed/vegas-luzes/900/700",
            504,
            110,
          ),
          Destino(
            "Roma",
            "https://picsum.photos/seed/roma-coliseu/900/700",
            478,
            85,
          ),
          Destino(
            "Chile",
            "https://picsum.photos/seed/chile-andes/900/700",
            446,
            95,
          ),
        ],
      ),
    );
  }
}
