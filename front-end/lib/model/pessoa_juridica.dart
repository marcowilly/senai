import 'package:senai/model/cep.dart';
import 'package:senai/model/pessoa.dart';

class PessoaJuridica extends Pessoa {
  String? cnpj;
  String? fantasia;
  String? abertura;
  String? tipo;
  String? cep;
  String? numero;
  Cep? objCep;

  PessoaJuridica(
      {this.cnpj,
      String? nome,
      this.fantasia,
      this.abertura,
      this.tipo,
      this.cep,
      this.numero,
      int? id})
      : super(nome, id: id);

  PessoaJuridica.fromJson(Map<String, dynamic> json)
      : this(
          cnpj: json['cnpj'],
          nome: json['nome'],
          fantasia: json['fantasia'],
          abertura: json['abertura'],
          tipo: json['tipo'],
          cep: json['cep'],
          numero: json['numero'],
        );

  @override
  Map<String, dynamic> toJson() {
    return {
      'pessoa': 'juridica',
      'cnpj': cnpj,
      'nome': nome,
      'fantasia': fantasia,
      'dataAbertura': abertura,
      'tipo': tipo,
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
