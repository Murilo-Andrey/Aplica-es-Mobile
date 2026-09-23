import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrinho_provider.dart';

class Checkout extends StatelessWidget {
  Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var carrinho = context.watch<CarrinhoProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              child: Image.asset(carrinho.img, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(carrinho.nome, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Diárias'), Text('${carrinho.diarias}')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Acompanhantes'), Text('${carrinho.pessoas}')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Forma de pagamento'), Text(carrinho.formaPagamento)],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('R\$ ${carrinho.total}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Confirmar reserva'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
