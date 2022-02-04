abstract class Pessoa {
  final int? id;
  String? nome;

  Pessoa(this.nome, {this.id});

  Map<String, dynamic> toJson();
}
