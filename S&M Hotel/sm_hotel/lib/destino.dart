import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          title: const Text('Forma de pagamento'),
          content: const Text('Escolha como deseja pagar'),
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
              child: const Text('Pix (10% de desconto)'),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            width: 393,
            height: 250,
            child: Image.asset(widget.img, fit: BoxFit.fill),
          ),
          Text(
            widget.nome,
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            'R\$ ${widget.valord}/dia - R\$ ${widget.valorp} /pessoa',
            style: const TextStyle(color: Colors.red),
          ),
          const Text('1 Quarto, banheiro,televisão, WiFi, ar-condicionado'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quantidade de dias: $n_diarias'),
              IconButton(onPressed: dias, icon: const Icon(Icons.add)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quantidade de pessoas: $n_pessoas'),
              IconButton(onPressed: n_pessoasFunc, icon: const Icon(Icons.add)),
            ],
          ),
          Text('Valor total R\$: $total'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: calctotal, child: const Text('Calcular')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: limpar, child: const Text('Limpar')),
            ],
          ),
        ],
      ),
    );
  }
}
