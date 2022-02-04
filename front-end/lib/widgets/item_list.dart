import 'package:flutter/material.dart';
import 'package:senai/model/pessoa.dart';

class ItemList extends StatelessWidget {
  final Pessoa pessoa;

  const ItemList({
    Key? key,
    required this.pessoa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPessoaJuridica = pessoa.toJson()['pessoa'] == 'juridica';
    print(isPessoaJuridica);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor:
              isPessoaJuridica ? Colors.blue : Colors.lightGreenAccent,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: FittedBox(
              child: Text(isPessoaJuridica ? 'PJ' : 'PF'),
            ),
          ),
        ),
        title: Text(
          isPessoaJuridica ? pessoa.toJson()['cnpj'] : pessoa.toJson()['cpf'],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          isPessoaJuridica ? pessoa.toJson()['nome'] : pessoa.toJson()['nome'],
        ),
      ),
    );
  }
}
