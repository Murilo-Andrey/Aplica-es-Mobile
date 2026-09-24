import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'theme.dart';

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
      backgroundColor: AppColors.navy,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Criar conta', style: GoogleFonts.fraunces(color: Colors.white)),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  TextField(controller: nome, decoration: const InputDecoration(labelText: 'Nome')),
                  const SizedBox(height: 14),
                  TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
                  const SizedBox(height: 14),
                  TextField(
                    controller: senha,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Senha'),
                  ),
                  const SizedBox(height: 14),
                  if (mensagem.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(mensagem, style: const TextStyle(color: AppColors.teal)),
                    ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: cadastrar, child: const Text('Cadastrar')),
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
