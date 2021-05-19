import "dart:core";
import "dart:io";

/*
  Programa que simula um gerenciamento de livros em uma estante
  utilizando os conceitos de POO ( Programação Orientada à Objetos)
  aprendidos. 
*/

class Livro {
  //atributos da classe Livro
  late String titulo;
  late String genero;
  late int numPag;
  late double preco;
  late bool lido;
  //construtor da classe Livro
  Livro(String titulo, String genero, int numPag, double preco, bool lido) {
    this.titulo = titulo;
    this.genero = genero;
    this.numPag = numPag;
    this.preco = preco;
    this.lido = lido;
  }
  //métodos da classe Livro
  void imprimirInformacoes() {
    print("\n=================================");
    print("Título: $titulo");
    print("Gênero: $genero");
    print("Número de páginas: $numPag");
    print("Valor do livro: R\$ $preco");
    print("\nJá foi lido? $lido");
    print("=================================\n");
  }

  void setTitulo() {
    this.titulo = lerDados("Novo título: ");
    print("\nInformação alterada com sucesso!");
  }

  void setGenero() {
    this.genero = lerDados("Novo gênero: ");
    print("\nInformação alterada com sucesso!");
  }

  void setNumPag() {
    this.numPag = int.parse(lerDados("Novo número de páginas: "));
    print("\nInformação alterada com sucesso!");
  }

  void setPreco() {
    this.preco = double.parse(lerDados("Novo preço: R\$"));
    print("\nInformação alterada com sucesso!");
  }

  void setLido() {
    String alteracao = lerDados("O livro foi lido (Y/N)? ").toUpperCase();
    if (alteracao == 'Y') {
      this.lido = true;
      print("\nInformação alterada com sucesso!");
    } else if (alteracao == 'N') {
      this.lido = false;
      print("\nInformação alterada com sucesso!");
    } else
      print("\nEntrada inválida!");
  }
}

void main() {
  List<Livro> estante = []; //inicializando estante com zero livros
  String opcao, titulo;
  int i;
  bool rodando = true, status;

  //loop principal do programa
  while (rodando) {
    //imprimindo menu
    print("\nGERENCIADOR DE LIVROS 1.0\n");
    print("[1] Cadastrar livro");
    print("[2] Remover livro");
    print("[3] Ver estante");
    print("[4] Ver um livro especifico");
    print("[5] Sair");
    opcao = lerDados("----> ");
    //verificando opcao selecionada e realizando ações
    switch (opcao) {
      case '1':
        print("\nCriando novo livro...");
        Livro novoLivro = Livro("", "", 0, 0.0, false); //setando padrao
        novoLivro.setTitulo();
        novoLivro.setGenero();
        novoLivro.setNumPag();
        novoLivro.setPreco();
        novoLivro.setLido();
        //verificando se o livro já existe na estante...
        status = false;
        if (estante.length > 0) {
          for (i = 0; i < estante.length; i++) {
            if (novoLivro.titulo == estante[i].titulo) {
              print("\nErro ao cadastrar novo livro! Já existe...");
              status = true;
              break; //encerrando busca
            }
          }
        }
        if (!status) {
          estante.add(novoLivro);
          print("\nLivro cadastrado com sucesso!");
        }
        break;
      case '2':
        titulo = lerDados("Informe o título do livro a ser removido: ");
        status = false;
        if (estante.length > 0) {
          for (i = 0; i < estante.length; i++) {
            if (titulo == estante[i].titulo) {
              estante.removeAt(i);
              print("\nLivro removido da estante com sucesso!");
              status = true;
            }
          }
        }
        if (!status) print("\nErro ao remover livro! Título inexistente...");
        break;
      case '3':
        print("\nSua estante de livros:\n");
        for (i = 0; i < estante.length; i++) {
          estante[i].imprimirInformacoes();
        }
        break;
      case '4':
        titulo = lerDados("Informe o título do livro procurado: ");
        status = false;
        if (estante.length > 0) {
          for (i = 0; i < estante.length; i++) {
            if (titulo == estante[i].titulo) {
              estante[i].imprimirInformacoes();
              status = true;
            }
          }
        }
        if (!status) print("\nErro ao procurar livro! Título inexistente...");
        break;
      case '5':
        print("\nEncerrando programa...\n");
        rodando = false;
        break;
      default:
        print("\nSinto muito...opção inválida!!!\n");
    }
  }
}

String lerDados(String texto) {
  stdout.write(texto);
  String resposta = stdin.readLineSync().toString();
  return resposta;
}
