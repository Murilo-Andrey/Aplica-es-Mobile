import 'package:flutter/material.dart';
import 'destino.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S&M Hotel'),
      ),
      body: ListView(
        children: [
          Destino("Angra dos Reis", "images/angra.jpg", 384, 70),
          Destino("Jericoacoara", "images/jeri.jpg", 571, 75),
          Destino("Arraial do Cabo", "images/arraial.jpg", 534, 65),
          Destino("Florianópolis", "images/flori.jpg", 348, 85),
          Destino("Madri", "images/madri.jpg", 401, 85),
          Destino("Paris", "images/paris.jpg", 546, 95),
          Destino("Orlando", "images/orlando.jpg", 616, 105),
          Destino("LasVegas", "images/lasvegas.jpg", 504, 110),
          Destino("Roma", "images/roma.jpg", 478, 85),
          Destino("Chile", "images/chile.jpg", 446, 95),
        ],
      ),
    );
  }
}
