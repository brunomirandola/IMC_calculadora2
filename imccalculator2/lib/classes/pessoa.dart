// ignore: file_names
class Pessoa {
  String _nome;
  double _peso;
  double _altura;

  Pessoa(this._nome, this._altura, this._peso);

  String getNome() {
    return _nome;
  }

  void setNome(String nome) => _nome = nome;
  double getPeso() {
    return _peso;
  }

  void setPeso(double peso) => _peso = peso;
  double getAltura() {
    return _altura;
  }

  void setAltura(double altura) => _altura = altura;
}
