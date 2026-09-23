import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cadastro extends StatefulWidget {
  Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  String mensagem = '';

  Future<void> cadastrar() async {
    var url = Uri.parse('http://localhost:3000/cadastro-usuario');
    var resposta = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nome': nome.text,
        'email': email.text,
        'senha': senha.text,
      }),
    );

    if (resposta.statusCode == 201) {
      setState(() {
        mensagem = 'Cadastro realizado com sucesso';
      });
      Navigator.pop(context);
    } else {
      setState(() {
        mensagem = 'Erro ao cadastrar';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: nome, decoration: const InputDecoration(labelText: 'Nome')),
            TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: senha, obscureText: true, decoration: const InputDecoration(labelText: 'Senha')),
            const SizedBox(height: 20),
            Text(mensagem),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: cadastrar, child: const Text('Cadastrar')),
          ],
        ),
      ),
    );
  }
}
