class Cep {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;

  Cep(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf});

  Cep.fromJson(Map<String, dynamic> json)
      : this(
          cep: json['cep'],
          logradouro: json['logradouro'],
          complemento: json['complemento'],
          bairro: json['bairro'],
          localidade: json['localidade'],
          uf: json['uf'],
        );

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }
}
