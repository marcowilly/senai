import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senai/model/pessoa.dart';
import 'package:senai/screens/pessoa_fisica_screen.dart';
import 'package:senai/screens/pessoa_juridica_screen.dart';
import 'package:http/http.dart' as http;

class CadastroScreen extends StatefulWidget {
  final String title;
  const CadastroScreen(this.title, {Key? key}) : super(key: key);

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  bool isPessoaJuridica = true;
  late Pessoa? pessoa;

  _cadastrarPJ() async {
    if (pessoa != null) {
      var url = Uri.parse('http://localhost:8080/pessoajuridica');
      var toJson = jsonEncode(pessoa);
      try {
        var response = await http.post(url,
            body: toJson,
            headers: {'Content-type': 'application/json; charset=UTF-8'});

        if (response.statusCode == 201) {
          print('Inserido com sucesso!');
        }
      } catch (e) {
        print(e);
      }
      Navigator.pop(context);
    }
  }

  _cadastrarPF() async {
    if (pessoa != null) {
      var url = Uri.parse('http://localhost:8080/pessoafisica');
      var toJson = jsonEncode(pessoa);
      print(toJson);
      try {
        var response = await http.post(url,
            body: toJson,
            headers: {'Content-type': 'application/json; charset=UTF-8'});

        if (response.statusCode == 201) {
          print('Inserido com sucesso!');
        }
      } catch (e) {
        print(e);
      }
      Navigator.pop(context);
    }
  }

  _addPessoa(Pessoa p) {
    pessoa = p;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  isPessoaJuridica ? _cadastrarPJ() : _cadastrarPF();
                },
                icon: Icon(Icons.check))
          ],
        ),
        body: Center(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: isPessoaJuridica,
                    onChanged: (value) {
                      setState(() {
                        isPessoaJuridica = value;
                      });
                    }),
                Text(isPessoaJuridica
                    ? 'Cadastrando pessoa juridica'
                    : 'Cadastrando pessoa fisica'),
              ],
            ),
            isPessoaJuridica
                ? PessoaJuridicaScreen(_addPessoa)
                : PessoaFisicaScreen(_addPessoa),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            isPessoaJuridica ? _cadastrarPJ() : _cadastrarPF();
          },
          child: Icon(Icons.check),
        ));
  }
}
