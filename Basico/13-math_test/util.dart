import 'dart:convert';
import 'dart:io';

import 'dart:math';

/* Arquivo responsável por funções utilitárias */


/*
  Função que retorna uma cadeia de caracteres aleatória para servir de código
*/
String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

/*
  Função que imprime um texto informativo e espera pelo input do usuário
*/
String lerDados(String texto) {
  stdout.write(texto);
  String resposta = stdin.readLineSync().toString();
  return resposta;
}
/**
 * Faz quase exatamente o que a função 'lerDados'. No entanto, ao invés de
 * escrever o que se pede, aqui vai com a seguinte mensagem setada: "----> "
 *
 * Returns: dados que o usuário digita. Veja também: [lerDados]
 */
String lerDadosDeMenu(){
  return lerDados("----> ");
}

/*
  Função que retorna a posição de um usuario na lista, devolve -1 se não existir
*/
int existeUsuario(List usuarios, String codigo) {
  int i, index = -1;
  for (i = 0; i < usuarios.length; i++) {
    if (usuarios[i].codigo == codigo) index = i;
  }
  return index;
}