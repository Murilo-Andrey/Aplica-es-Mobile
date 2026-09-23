import 'package:flutter/material.dart';

class CarrinhoProvider extends ChangeNotifier {
  String nome = '';
  String img = '';
  int diarias = 0;
  int pessoas = 0;
  int total = 0;
  String formaPagamento = '';

  void setCarrinho(String nome, String img, int diarias, int pessoas, int total, String formaPagamento) {
    this.nome = nome;
    this.img = img;
    this.diarias = diarias;
    this.pessoas = pessoas;
    this.total = total;
    this.formaPagamento = formaPagamento;
    notifyListeners();
  }
}
