import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);
}

void main() {
  try {
    stdout.write("Digite o nome: ");
    String nome = stdin.readLineSync()!;

    stdout.write("Digite o peso (em kg): ");
    double peso = double.parse(stdin.readLineSync()!);

    stdout.write("Digite a altura (em metros): ");
    double altura = double.parse(stdin.readLineSync()!);

    Pessoa pessoa = Pessoa(nome, peso, altura);
    double imc = calcularIMC(pessoa);
    String categoria = categorizarIMC(imc);

    print("O IMC de ${pessoa.nome} é: ${imc.toStringAsFixed(1)}");
    print("Categoria: $categoria");
  } catch (e) {
    print("Erro: $e");
  }
}

String categorizarIMC(double imc) {
  if (imc < 16) {
    return "Magreza grave";
  } else if (imc >= 16 && imc < 17) {
    return "Magreza moderada";
  } else if (imc >= 17 && imc < 18.5) {
    return "Magreza leve";
  } else if (imc >= 18.5 && imc < 25) {
    return "Saudável";
  } else if (imc >= 25 && imc < 30) {
    return "Sobrepeso";
  } else if (imc >= 30 && imc < 35) {
    return "Obesidade Grau I";
  } else if (imc >= 35 && imc < 40) {
    return "Obesidade Grau II";
  } else {
    return "Obesidade Grau III";
  }
}

double calcularIMC(Pessoa pessoa) {
  if (pessoa.altura <= 0 || pessoa.peso <= 0) {
    throw Exception("Altura e peso devem ser valores positivos.");
  }

  double imc = pessoa.peso / (pessoa.altura * pessoa.altura);
  return imc;
}
