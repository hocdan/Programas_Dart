import "dart:io";
import "dart:core"; //necessario para usar Lista

/*
  Métodos de lista úteis:
  -> length(), retorna o numero de elementos da lista
  -> contains(N), retorna true se o elemento N está na lista 
  -> add(N), adiciona o elemento N na lista
  -> remove(N), remove o elemento N da lista, devolve -1 se ele não existir
  -> removeAt(index), remove o elemento na posicao index da lista
  -> removeLast(), remove e retorna o ultimo elemento da lista
  -> removeRange(start, end), remove os elementos do intervalo [start, end[
  -> first(), retorna o primeiro elemento da lista
  -> isEmpty(), retorna true se a lista nao tiver elementos
  -> isNotEmpty(), retorna true se a lista tiver elementos
  -> last(), retorna o ultimo elemento da lista
  -> reversed(), retorna um objeto iteravel contendo os objetos na ordem reversa
  -> Single(), checa se a lista tem apenas um elemento e retorna ele
  -> replaceRange(start, end, N), insere uma lista N no intervalo [start, end[
  -> addAll([n1, n2, .., n]), adiciona N elementos no formato de lista
  -> insert(index, N), insere o elemento N na posicao index da lista
  -> insertAll(index, N), insere uma lista N na posicao index da lista
  OBS: o método insert e insertAll não sobrescrevem os elementos antigos, há uma
  alteração na lista para guardar tanto os elementos antigos como os novos na po-
  sição dada
*/

void main() {
  List<int> numeros = []; //precisa ser declarada com um valor inicial/vazia
  List<String> nomes = ["Fulano", "Beltrano", "Ciclano", "Astrogildo"];
  //OBS: podemos ter listas de qualquer tipo
  int num, elemento = 1;
  String nome;

  //imprimindo dados da lista
  print("Lista de numeros: $numeros");
  print("Tamanho da lista: ${numeros.length}");
  //lendo valores (não nulos!) e adicionando no vetor
  stdout.write("Insira o elemento 0 na lista: ");
  numeros.add(int.parse(stdin.readLineSync()!));
  stdout.write("Insira o elemento 1 na lista: ");
  numeros.add(int.parse(stdin.readLineSync()!));
  stdout.write("Insira o elemento 2 na lista: ");
  numeros.add(int.parse(stdin.readLineSync()!));
  //imprimindo dados da lista
  print("Lista de numeros: $numeros");
  print("Tamanho da lista: ${numeros.length}");
  //manipulando lista
  stdout.write("Informe o elemento a ser removido: ");
  num = int.parse(stdin.readLineSync()!);
  numeros.remove(num); //devolve -1 se num não estiver na lista
  //imprimindo dados da lista
  print("Lista de numeros: $numeros");
  print("Tamanho da lista: ${numeros.length}");
  print("O elemento $num está na lista? ${numeros.contains(num)}");
  print("Posição do elemento 1 na lista: ${numeros.indexOf(1)}");

  //imprimindo dados da lista de nomes
  stdout.write("Informe um nome: ");
  nome = stdin.readLineSync()!;
  nomes.add(nome); //adicionando elemento na lista de tamanho fixo (ultimo)
  print("Lista de nomes: $nomes");
  print("Tamanho da lista: ${nomes.length}");
}
