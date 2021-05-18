import "dart:core";
import "dart:io";

void main() {
  String nome;
  int idade;
  double n1, n2;

  nome = lerDados("Qual o seu nome? ");
  idade = int.parse(lerDados("Quantos anos você tem? "));

  saudacao(nome, idade);
  print("Olha esse quadrado feio:\n");
  drawSquare();
  print("\nEra só isso mesmo ;)");

  n1 = double.parse(lerDados("\nEscolha um número: "));
  n2 = double.parse(lerDados("Escolha outro número: "));
  print("Sabia que $n1 + $n2 = ${somar(n1, n2)}?");
}

void drawSquare() {
  print("*******");
  print("*     *");
  print("*     *");
  print("*******");
}

void saudacao(String nome, int idade) {
  print("\nOlá, $nome! $idade é muito tempo...");
}

double somar(double n1, double n2) {
  return n1 + n2;
}

String lerDados(String texto) {
  stdout.write(texto);
  String resposta = stdin.readLineSync().toString();
  return resposta;
}
