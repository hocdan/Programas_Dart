import "dart:io";
import "dart:core";
import "dart:math";

/*
  Programa que calcula o valor de PI atraves da iteracao na sequencia de
  Leibniz:

  (1/1)-(1/3)+(1/5)-(1/7)+(1/9)-(1/11)+(1/13)+... = PI/4

  OBS: quanto maior o numero de iteracoes melhor será a precisão no valor 
  de PI. Tente encontrar o meio termo em precisão e tempo de execução.
*/

void main() {
  Stopwatch relogio = new Stopwatch(); //usado para medir tempo de execucao
  String resposta;
  late int N;
  bool erro, rodando = true;
  //loop principal
  while (rodando) {
    //imprimindo menu
    print("\nPI CALCULATOR 1.0\n");
    print("[1] Calcular Pi");
    print("[2] Sair");
    resposta = lerDados("---> ");
    //executando opcoes do menu
    switch (resposta) {
      case '1':
        //recolhendo informacoes para calcular Pi (int : N >= 1)
        erro = false;
        try {
          N = int.parse(lerDados("\nNúmero de iterações: "));
        } on FormatException {
          erro = true;
        }
        if (!erro && N >= 1) {
          //calculando e mostrando valor de Pi
          print("\nCalculando...");
          relogio.start(); //iniciando medicao
          print("Valor de  Pi = ${calcularPi(N)} realizando $N interacoes!");
          relogio.stop(); //finalizando medicao
          print("\nTempo de execução: ${relogio.elapsed.inSeconds} segundos");
          relogio.reset(); //reiniciando relogio para uso posterior
        } else {
          print("\nSinto muito! Entrada inválida...");
        }
        break;
      case '2':
        print("\nEncerrando programa...");
        rodando = false;
        break;
      default:
        print("\nOpção inválida!!!");
    }
  }
}

String lerDados(String texto) {
  stdout.write(texto);
  String resposta = stdin.readLineSync().toString();
  return resposta;
}

double calcularPi(int N) {
  double pi = 1.0;
  int i, denominador = 3;
  //loop de iteracao da sequencia de Leibniz
  for (i = 0; i < N; i++) {
    //comportamento de alternancia do sinal
    if (i % 2 == 0)
      pi -= 1 / denominador;
    else
      pi += 1 / denominador;
    denominador += 2; //atualizando denominador
  }
  return (pi * 4);
}
