import "dart:core";
import "dart:io";

void main() {
  int n1, n2;

  n1 = int.parse(lerDados("Insira um inteiro: "));
  n2 = int.parse(lerDados("Insira outro inteiro: "));
  //checando condições e imprimindo informações dos números
  isEven(n1);
  isEven(n2);

  if (n1 == n2) {
    print("$n1 igual a $n2");
  } else if (n1 > n2) {
    print("$n1 maior que $n2");
  } else {
    print("$n2 maior que $n1");
  }
}

String lerDados(String texto) {
  stdout.write(texto);
  String resposta = stdin.readLineSync().toString();
  return resposta;
}

void isEven(int num) {
  if (num % 2 == 0)
    print("O número $num é par!");
  else
    print("O número $num é ímpar!");
}
