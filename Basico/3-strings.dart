void main() {
  String palavra1 = 'Eureka', palavra2 = ', baby!', letra = 'c';

  print("Tamanho da palavra $palavra1: ${palavra1.length}");
  print("A primeira letra da palavra é: ${palavra1[0]}");
  print("Versao maiscula: ${palavra1.toUpperCase()}");
  print("Versao minuscula: ${palavra1.toLowerCase()}");
  print("Existe a letra $letra em $palavra1? ${palavra1.contains(letra)}");
  print("Index da letra $letra em $palavra1: ${palavra1.indexOf(letra)}");
  print("Concatenando duas palavras: ${palavra1 + palavra2}");
}
