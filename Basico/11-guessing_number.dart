import "dart:io";
import "dart:math";

/*
  Programa que simula o jogo de adivinhar o número N em um intervalo
  dado pelo próprio jogador, após acertar o jogador deve ter a chance
  de jogar novamente.
*/

void main() {
  Random random = new Random(); //necessario para usar aleatoriedade
  //variaveis do jogo
  String continuar;
  int palpite, resposta, min, max, tentativas;
  bool ok;

  //loop principal
  while (true) {
    //mostrando menu e configurando variaveis do jogo
    print("\nADIVINHE O NUMERO! 1.0\n");
    try {
      min = int.parse(lerDados("Intervalo minimo (padrao=1):"));
    } on FormatException {
      print("Erro ao fornecer intervalo mínimo...setando para 1");
      min = 1; //valor padrao do intervalo mínimo
    }
    try {
      max = int.parse(lerDados("Intervalo máximo (padrao=100):"));
    } on FormatException {
      print("Erro ao fornecer intervalo máximo...setando para 100");
      max = 100; //valor padrao do intervalo máximo
    }
    resposta =
        random.nextInt(max - min) + min; //intervalo [min, max] de aleatorios
    tentativas = 0;
    palpite = resposta + 1; //inicializando palpite diferente da resposta
    //loop para realizar palpites até acertar
    while (palpite != resposta) {
      try {
        palpite = int.parse(lerDados("\nChute um número entre $min e $max: "));
        ok = true;
      } on FormatException {
        print("\nErro ao fornecer palpite...ignorando resposta");
        ok = false;
      }
      if (ok) {
        tentativas++;
        if (palpite > resposta && palpite <= max)
          max = palpite;
        else if (palpite < resposta && palpite >= min) min = palpite;
      }
    }
    print(
        "\nAcertou! O número era $resposta!\nForam feitas $tentativas tentativas.");
    continuar = lerDados("\nContinuar jogando(N-sair)? ").toUpperCase();
    if (continuar == 'N') break;
  }
  print("\nObrigado por jogar, fechando programa...");
}

String lerDados(String texto) {
  stdout.write(texto);
  String resposta = stdin.readLineSync().toString();
  return resposta;
}
