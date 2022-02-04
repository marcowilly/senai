import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senai/model/usuario.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  final String title;
  final void Function() _logar;
  const LoginScreen(this.title, this._logar, {Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  _logar() async {
    Usuario usuario =
        Usuario(nome: _usuarioController.text, senha: _senhaController.text);
    Usuario? bUser = null;
    var url = Uri.parse('http://localhost:8080/usuario');
    var toJson = jsonEncode(usuario);
    try {
      var response = await http.post(url,
          body: toJson,
          headers: {'Content-type': 'application/json; charset=UTF-8'});

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedJson = jsonDecode(response.body);

        bUser = Usuario.fromJson(parsedJson);
      }
    } catch (e) {
      print(e);
    }
    if (usuario.nome == bUser!.nome) {
      if (usuario.senha == bUser.senha) {
        widget._logar();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Container(
          color: Colors.lightGreenAccent,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                  width: 400,
                  height: 400,
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const Expanded(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 45,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        onChanged: (newValue) =>
                            _usuarioController.text = newValue,
                        decoration: const InputDecoration(labelText: 'Usuario'),
                      ),
                      TextField(
                        onChanged: (newValue) =>
                            _senhaController.text = newValue,
                        decoration: const InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: TextButton(
                          child: const Text('Logar'),
                          onPressed: () => _logar(),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
