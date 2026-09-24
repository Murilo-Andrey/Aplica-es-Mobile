import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'carrinho_provider.dart';
import 'checkout.dart';

class Destino extends StatefulWidget {
  final String nome;
  final String img;
  final int valord;
  final int valorp;

  Destino(this.nome, this.img, this.valord, this.valorp, {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int n_diarias = 0;
  int n_pessoas = 0;
  int total = 0;

  void dias() {
    setState(() {
      n_diarias++;
    });
  }

  void n_pessoasFunc() {
    setState(() {
      n_pessoas++;
    });
  }

  void calctotal() {
    setState(() {
      total = (n_diarias * widget.valord) + (n_pessoas * widget.valorp);
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Forma de pagamento'),
          content: const Text('Escolha como deseja pagar essa reserva'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                confirmarPagamento('Cartão', total);
              },
              child: const Text('Cartão'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                int totalPix = (total * 0.9).round();
                confirmarPagamento('Pix', totalPix);
              },
              child: const Text('Pix (10% off)'),
            ),
          ],
        );
      },
    );
  }

  void confirmarPagamento(String forma, int valor) {
    Provider.of<CarrinhoProvider>(context, listen: false)
        .setCarrinho(widget.nome, widget.img, n_diarias, n_pessoas, valor, forma);

    Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout()));
  }

  void limpar() {
    setState(() {
      n_diarias = 0;
      n_pessoas = 0;
      total = 0;
    });
  }

  Widget contador(String label, int valor, VoidCallback onAdd) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gold.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: AppColors.ink)),
                Text(
                  '$valor',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.navy),
                ),
              ],
            ),
            InkWell(
              onTap: onAdd,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(color: AppColors.teal, shape: BoxShape.circle),
                child: const Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                widget.img,
                width: double.infinity,
                height: 190,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 14,
                right: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'R\$ ${widget.valord}/dia',
                    style: const TextStyle(color: AppColors.navy, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.nome, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 4),
                Text(
                  'R\$ ${widget.valorp} por pessoa · quarto com wifi e ar-condicionado',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    contador('Diárias', n_diarias, dias),
                    const SizedBox(width: 12),
                    contador('Pessoas', n_pessoas, n_pessoasFunc),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.cream,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Total: R\$ $total',
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.navy),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed: calctotal, child: const Text('Reservar')),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: limpar,
                      child: const Text('Limpar', style: TextStyle(color: AppColors.ink)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
