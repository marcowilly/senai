import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senai/model/cep.dart';
import 'package:senai/model/pessoa.dart';
import 'package:senai/model/pessoa_fisica.dart';
import 'package:senai/widgets/text_field_ex.dart';
import 'package:http/http.dart' as http;

class PessoaFisicaScreen extends StatefulWidget {
  final void Function(Pessoa) adicionarPessoa;
  const PessoaFisicaScreen(this.adicionarPessoa, {Key? key}) : super(key: key);

  @override
  _PessoaFisicaScreenState createState() => _PessoaFisicaScreenState();
}

class _PessoaFisicaScreenState extends State<PessoaFisicaScreen> {
  PessoaFisica pessoa = PessoaFisica();

  _buscarLocalizacao() async {
    var url = Uri.parse(
        'https://viacep.com.br/ws/${pessoa.cep!.replaceAll('.', '').replaceAll('-', '')}/json/');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedJson = jsonDecode(response.body);
        setState(() {
          pessoa.objCep = Cep.fromJson(parsedJson);
        });
        widget.adicionarPessoa(pessoa);
      }
    } catch (e) {
      widget.adicionarPessoa(pessoa);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 500,
          child: TextFieldEx(
              labelText: 'CPF',
              hintText: '00000000000',
              onSubmitted: (value) => pessoa.cpf = value),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Nome',
                  hintText: pessoa.nome == null ? '' : pessoa.nome!,
                  onSubmitted: (value) => pessoa.nome = value),
            ),
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Data de nascimento',
                  hintText: pessoa.nascimento == null ? '' : pessoa.nascimento!,
                  onSubmitted: (value) => pessoa.nascimento = value),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextFieldEx(
                  labelText: 'Cep',
                  hintText: pessoa.cep == null ? '' : pessoa.cep!,
                  onSubmitted: (value) {
                    pessoa.cep = value;
                    _buscarLocalizacao();
                  }),
            ),
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Logradouro',
                  isEnable: false,
                  hintText:
                      pessoa.objCep == null ? '' : pessoa.objCep!.logradouro!,
                  onSubmitted: (_) {}),
            ),
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Numero',
                  hintText: pessoa.numero == null ? '' : pessoa.numero!,
                  onSubmitted: (value) => pessoa.numero = value),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Bairro',
                  isEnable: false,
                  hintText: pessoa.objCep == null ? '' : pessoa.objCep!.bairro!,
                  onSubmitted: (_) {}),
            ),
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Localidade',
                  isEnable: false,
                  hintText:
                      pessoa.objCep == null ? '' : pessoa.objCep!.localidade!,
                  onSubmitted: (_) {}),
            ),
            SizedBox(
              width: 300,
              child: TextFieldEx(
                  labelText: 'Estado',
                  isEnable: false,
                  hintText: pessoa.objCep == null ? '' : pessoa.objCep!.uf!,
                  onSubmitted: (_) {}),
            ),
          ],
        )
      ],
    );
  }
}
