import "dart:core";
import "dart:io";
import "dart:math";
import "dart:convert";

/*
  Função que imprime um texto informativo e espera pelo input do usuário
*/
String lerDados(String texto) {
  stdout.write(texto);
  String resposta = stdin.readLineSync().toString();
  return resposta;
}

/*
  Função que retorna uma cadeia de caracteres aleatória para servir de código
*/
String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
