import "dart:math";
import "dart:io";

void main() {
  var nome; //necessario pois o valor do input pode nao ser do tipo String
  var n1, n2; //mesmo motivo do anterior, devido ao Null Safety de Dart
  int num1, num2;

  stdout.write("Qual o seu nome? "); //um print que nao gera uma nova linha
  nome = stdin.readLineSync(); //devolve o tipo String?/pode ser String ou Null
  print("Olá, $nome!");

  stdout.write("Informe um número: ");
  n1 = stdin.readLineSync();
  stdout.write("Informe outro número: ");
  n2 = stdin.readLineSync();
  print("Resultado: $n1 + $n2 = ${double.parse(n1) + double.parse(n2)}");

  //outra maneira de ler input sabendo que nao irá receber NULL
  stdout.write("Informe um número inteiro: ");
  num1 = int.parse(stdin.readLineSync()!); //simbolo ! diz que retorno != NULL
  stdout.write("Informe outro número inteiro: ");
  num2 = int.parse(stdin.readLineSync()!);
  print("Resultado: $num1 - $num2 = ${num1 - num2}");
}
