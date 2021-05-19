import "dart:core";
import "dart:io";

void main() {
  String opcao;
  double num1, num2;

  //loop principal da calculadora
  while (true) {
    print("\nCALCULADORA 1.0\n");
    //inicializando operandos e operação
    num1 = double.parse(lerDados("Número 1: "));
    opcao = lerDados("Operação (+,-,*,/,^): ");
    num2 = double.parse(lerDados("Número 2: "));
    //realizando operacao (se válida) com os números fornecidos
    switch (opcao) {
      case '+':
        print("Resultado: ${num1 + num2}");
        break;
      case '-':
        print("Resultado: ${num1 - num2}");
        break;
      case '*':
        print("Resultado: ${num1 * num2}");
        break;
      case '/':
        print("Resultado: ${num1 / num2}");
        break;
      case '^':
        print("Resultado: ${elevar(num1, num2)}");
        break;
      default:
        print("\nOperação inválida!!!");
    }
    //verificando se o usuário não gostaria de continuar calculando...
    opcao = lerDados("Deseja continuar calculando (Y/N)? ").toUpperCase();
    if (opcao == 'N') {
      print("\nEncerrando programa...");
      break; //encerrando programa
    } else if (opcao != 'Y') print("\nOpção inválida!");
  }
}

String lerDados(String texto) {
  stdout.write(texto);
  String resposta = stdin.readLineSync().toString();
  return resposta;
}

double elevar(double base, double expoente) {
  double resultado = base;
  int i;
  for (i = 1; i < expoente; i++) {
    resultado *= base;
  }
  return resultado;
}
