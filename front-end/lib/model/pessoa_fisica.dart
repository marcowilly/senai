import 'package:senai/model/cep.dart';
import 'package:senai/model/pessoa.dart';

class PessoaFisica extends Pessoa {
  String? cpf;
  String? nascimento;
  String? cep;
  String? numero;
  Cep? objCep;

  PessoaFisica({this.cpf, String? nome, this.nascimento, int? id})
      : super(nome, id: id);

  PessoaFisica.fromJson(Map<String, dynamic> json)
      : this(
          cpf: json['cpf'],
          nome: json['nome'],
          nascimento: json['nascimento'],
        );

  @override
  Map<String, dynamic> toJson() {
    return {
      'pessoa': 'fisica',
      'cpf': cpf,
      'nome': nome,
      'nascimento': nascimento,
      "cep": cep,
      "numero": numero,
      "logradouro": objCep?.logradouro,
      "complemento": objCep?.complemento,
      "bairro": objCep?.bairro,
      "localidade": objCep?.localidade,
      "uf": objCep?.uf
    };
  }
}
