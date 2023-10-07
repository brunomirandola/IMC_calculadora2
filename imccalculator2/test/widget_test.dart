// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:imccalculator2/calculadora_imc.dart';

void main() {
  test('Teste para calculo do imc', () {
    // Crie uma instância da calculadora IMC
    CalculadoraIMC calculadora = CalculadoraIMC();
    // Calcule o IMC com precisão de duas casas decimais
    double expectedIMC = 25.86;
    double calcularIMC = calculadora.calcularIMC(73, 168 / 100);
    // Arredonde os valores para duas casas decimais
    expectedIMC = double.parse(expectedIMC.toStringAsFixed(2));
    calcularIMC = double.parse(calcularIMC.toStringAsFixed(2));
    // Teste se os valores arredondados são iguais
    expect(CalculadoraIMC, expectedIMC);
  });

  test('Teste de classificação do imc', () {
    // Crie uma instância da calculadora IMC
    CalculadoraIMC calculadora = CalculadoraIMC();

    // Teste a classificação do IMC com diferentes valores
    expect(calculadora.classificacaoIMC(15.0), 'Magreza grave');
    expect(calculadora.classificacaoIMC(16.5), 'Magreza moderada');
    expect(calculadora.classificacaoIMC(18.0), 'Magreza leve');
    expect(calculadora.classificacaoIMC(22.0), 'Saudável');
    expect(calculadora.classificacaoIMC(27.5), 'Sobrepeso');
    expect(calculadora.classificacaoIMC(31.0), 'Obesidade - GRAU I');
    expect(calculadora.classificacaoIMC(37.5), 'Obesidade - GRAU II (Severa)');
    expect(
        calculadora.classificacaoIMC(42.0), 'Obesidade - GRAU III (Mórbida)');
  });
}
