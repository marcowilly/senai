import 'package:flutter/material.dart';
import 'package:senai/model/pessoa.dart';

import 'item_list.dart';

class ListaCadastrados extends StatefulWidget {
  final List<Pessoa> pessoas;
  const ListaCadastrados(this.pessoas, {Key? key}) : super(key: key);

  @override
  _ListaCadastradosState createState() => _ListaCadastradosState();
}

class _ListaCadastradosState extends State<ListaCadastrados> {
  @override
  Widget build(BuildContext context) {
    return widget.pessoas.isEmpty
        ? Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Nenhuma pessoa cadastrada!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: widget.pessoas.length,
            itemBuilder: (ctx, index) {
              final pessoa = widget.pessoas[index];
              return ItemList(pessoa: pessoa);
            });
  }
}
