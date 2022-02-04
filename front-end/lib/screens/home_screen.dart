import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senai/model/pessoa.dart';
import 'package:senai/model/pessoa_fisica.dart';
import 'package:senai/model/pessoa_juridica.dart';
import 'package:senai/widgets/lista_cadastrados.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen(this.title, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Pessoa> pessoas = [];

  @override
  initState() {
    super.initState();
    _buscarPessoas();
  }

  _buscarPessoas() async {
    var url = Uri.parse('http://localhost:8080/pessoajuridica');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> parsedJson = jsonDecode(response.body);
        pessoas = [];
        parsedJson.forEach((e) => pessoas.add(PessoaJuridica.fromJson(e)));
      }
    } catch (e) {
      print(e);
    }

    url = Uri.parse('http://localhost:8080/pessoafisica');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> parsedJson = jsonDecode(response.body);
        print(parsedJson);
        parsedJson.forEach((e) => pessoas.add(PessoaFisica.fromJson(e)));
        pessoas.sort((a, b) => a.nome!.compareTo(b.nome!));
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  onGoBack(dynamic value) {
    setState(() {
      _buscarPessoas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListaCadastrados(pessoas),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cadastro')
                .then((value) => onGoBack(value));
          },
          child: const Icon(Icons.add),
        ));
  }
}
