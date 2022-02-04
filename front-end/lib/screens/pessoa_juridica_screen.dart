import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senai/model/cep.dart';
import 'package:senai/model/pessoa.dart';
import 'package:senai/model/pessoa_juridica.dart';
import 'package:senai/widgets/text_field_ex.dart';
import 'package:http/http.dart' as http;

class PessoaJuridicaScreen extends StatefulWidget {
  final void Function(Pessoa) adicionarPessoa;
  const PessoaJuridicaScreen(this.adicionarPessoa, {Key? key})
      : super(key: key);

  @override
  _PessoaJuridicaScreenState createState() => _PessoaJuridicaScreenState();
}

class _PessoaJuridicaScreenState extends State<PessoaJuridicaScreen> {
  PessoaJuridica pessoa = PessoaJuridica();

  _buscarEmpresa(String cnpj) {
    cnpj = cnpj.replaceAll('.', '').replaceAll('-', '').replaceAll('/', '');
    if (cnpj.length != 14) {
      return;
    }

    _buscarReceita(cnpj);
  }

  _buscarReceita(String cnpj) async {
    var url = Uri.parse('https://www.receitaws.com.br/v1/cnpj/$cnpj');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedJson = jsonDecode(response.body);
        setState(() {
          pessoa = PessoaJuridica.fromJson(parsedJson);
        });
        _buscarLocalizacao(pessoa.cep!);
      }
    } catch (e) {
      print(e);
    }
  }

  _buscarLocalizacao(String cep) async {
    var url = Uri.parse(
        'https://viacep.com.br/ws/${cep.replaceAll('.', '').replaceAll('-', '')}/json/');

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
              labelText: 'CNPJ',
              hintText: '00000000000000',
              onSubmitted: _buscarEmpresa),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Razão social',
                  isEnable: false,
                  hintText: pessoa.nome == null ? '' : pessoa.nome!,
                  onSubmitted: (_) {}),
            ),
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Nome Fantasia',
                  isEnable: false,
                  hintText: pessoa.fantasia == null ? '' : pessoa.fantasia!,
                  onSubmitted: (_) {}),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Data abertura',
                  isEnable: false,
                  hintText: pessoa.abertura == null ? '' : pessoa.abertura!,
                  onSubmitted: (_) {}),
            ),
            SizedBox(
              width: 500,
              child: TextFieldEx(
                  labelText: 'Tipo',
                  isEnable: false,
                  hintText: pessoa.tipo == null ? '' : pessoa.tipo!,
                  onSubmitted: (_) {}),
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
                  isEnable: false,
                  hintText: pessoa.cep == null ? '' : pessoa.cep!,
                  onSubmitted: (_) {}),
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
                  isEnable: false,
                  hintText: pessoa.numero == null ? '' : pessoa.numero!,
                  onSubmitted: (_) {}),
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
