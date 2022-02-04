class Usuario {
  String? senha;
  String? nome;

  Usuario({this.nome, this.senha});

  Usuario.fromJson(Map<String, dynamic> json)
      : this(
          nome: json['nome'],
          senha: json['senha'],
        );

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'senha': senha,
    };
  }
}
