class CalculadoraIMC {
  double calcularIMC(double altura, double peso) {
    if (altura <= 0 || peso <= 0) {
      throw ArgumentError(
          "O peso e altura devem ser valores maiores que zero.");
    }

    double imc = peso / (altura * altura);
    return imc;
  }

  String classificacaoIMC(double imc) {
    if (imc < 16) {
      return "MAGREZA GRAVE";
    } else if (imc >= 16 && imc < 17) {
      return "MAGREZA MODERADA";
    } else if (imc >= 17 && imc < 18.5) {
      return "MAGREZA LEVE";
    } else if (imc >= 18.5 && imc < 25) {
      return "SAUDÁVEL";
    } else if (imc >= 25 && imc < 30) {
      return "SOBREPESO";
    } else if (imc >= 30 && imc < 35) {
      return "OBESIDADE GRAU I";
    } else if (imc >= 35 && imc < 40) {
      return "OBESIDADE GRAU II - SEVERA";
    } else {
      return "OBESIDADE GRAU III - MÓRBIDA";
    }
  }
}
