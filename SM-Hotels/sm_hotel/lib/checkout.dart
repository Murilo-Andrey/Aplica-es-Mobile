import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'carrinho_provider.dart';

class Checkout extends StatelessWidget {
  Checkout({super.key});

  Widget linha(String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.ink)),
          Text(valor, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.navy)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var carrinho = context.watch<CarrinhoProvider>();

    return Scaffold(
      backgroundColor: AppColors.navy,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Sua reserva'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    child: Image.network(
                      carrinho.img,
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(carrinho.nome, style: Theme.of(context).textTheme.headlineMedium),
                        const SizedBox(height: 18),
                        linha('Diárias', '${carrinho.diarias}'),
                        linha('Acompanhantes', '${carrinho.pessoas}'),
                        linha('Pagamento', carrinho.formaPagamento),
                        const SizedBox(height: 18),
                        dashedDivider(),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.navy),
                            ),
                            Text(
                              'R\$ ${carrinho.total}',
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.coral),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
