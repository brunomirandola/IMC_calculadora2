// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'classes/pessoa.dart';
import 'calculadora_imc.dart';

void main() => runApp(CalculadoraIMCApp());

class CalculadoraIMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora de IMC",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: CalculadoraIMCScreen(),
    );
  }
}

class CalculadoraIMCScreen extends StatefulWidget {
  @override
  _CalculadoraIMCScreenState createState() => _CalculadoraIMCScreenState();
}

class _CalculadoraIMCScreenState extends State<CalculadoraIMCScreen> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  String resultado = "";
  String classificacao = "";

  void calcularIMC() {
    double peso =
        double.tryParse(pesoController.text.replaceAll(",", ".")) ?? 0.0;
    double altura =
        double.tryParse(alturaController.text.replaceAll(",", ".")) ?? 0.0;
    String nome = nomeController.text;

    Pessoa pessoa =
        Pessoa(nome, peso, altura / 100); // Conversão de altura para metros
    CalculadoraIMC calculadora = CalculadoraIMC();
    double imc = calculadora.calcularIMC(pessoa.getPeso(), pessoa.getAltura());

    String imcClassificacao = calculadora.classificacaoIMC(imc);

    setState(() {
      resultado =
          "Olá, ${pessoa.getNome()}!\nSeu IMC é ${imc.toStringAsFixed(2)}";
      classificacao = "Classificação: $imcClassificacao";
    });
  }

  void clearFields() {
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      nomeController.text = "";
      resultado = "";
      classificacao = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desafio Aprimoramento calculadora de IMC"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
            const Text(
              "Digite seu nome",
            ),
            TextField(controller: nomeController, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            const Text(
              "Digite seu peso: ",
            ),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "Digite sua altura: ",
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: calcularIMC,
                  child: const Text("Calcular IMC"),
                ),
                ElevatedButton(
                  onPressed: clearFields,
                  child: const Text("Limpar"),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Text(
              resultado,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              classificacao,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        )),
      ),
    );
  }
}
