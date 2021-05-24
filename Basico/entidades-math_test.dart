import "dart:core";
import "dart:io";
import "dart:math";
import "dart:convert";

//definição da super classe Usuario, que irá derivar Aluno e Professor, somente!
abstract class Usuario {
  late String nome; //identificador do usuario
  late String codigo; //identificador unico do usuario
  late String _senha; //para proteger o uso indevido do perfil do usuário
  late String _tipo; //seu tipo/privilegio, pode ser: Aluno ou Professor
  late List testes; //pode armazenar historico de testes ou problemas matematicos

  void verInfo() {
    print("\n===================================");
    print("+ Nome do usuário: $nome");
    print("+ Senha: ${'*' * _senha.length}");
    print("+ Cargo: $_tipo");
    print("===================================\n");
  }

  void setSenha(String senhaAntiga, String senhaNova) {
    //verificando validade da operação
    if (senhaAntiga == this._senha) {
      this._senha = senhaNova;
      print("\nACESSO GARANTIDO! Senha trocada com sucesso...\n");
    } else {
      print("\nACESSO NEGADO! Operação cancelada...\n");
    }
  }

  String getNome() {
    return this.nome;
  }

  void removeTeste(int index) {
    this.testes.removeAt(index);
  }

}

//definição do objeto Aluno
class Aluno extends Usuario {
  Aluno(String nome, String codigo, String senha) {
    this.nome = nome;
    this.codigo = codigo;
    this._senha = senha;
    this._tipo = "Aluno";
    this.testes = []; //lista vazia
  }

  void addTeste(String teste) {
    this.testes.add(teste);
  }

  void getTeste(int index) {
    int i;
    if (index == -1) {
      for (i=0; i<this.testes.length; i++) {
        print(this.testes[i]);
      }
    } else {
      print(this.testes[index]);
    }
  }
}

//definição do objeto Professor
class Professor extends Usuario {
  Professor(String nome, String codigo, String senha) {
    this.nome = nome;
    this.codigo = codigo;
    this._senha = senha;
    this._tipo = "Professor";
    this.testes = []; //lista vazia
  }

  void addTeste(Teste teste) {
    this.testes.add(teste);
  }

  void getTeste(int index) {
    int i, j;
    if (index == -1) {
      //imprimindo todos os teste
      for (i=0; i<this.testes.length; i++) {
        print("\nProva $i -> [${this.testes[i].nomeTeste}]");
        for (j=0; j<this.testes[i].questoes.length; j++) {
          print("Questão $j) ${this.testes[i].questoes[j].problema}");
          print("Resposta: ${this.testes[i].questoes[j].resposta}");
        }
        print("");
      }
    }
    else {
      //imprimindo um teste especifico
      print("Prova $index -> [${this.testes[index].nomeTeste}]");
      for (j=0; j<this.testes[index].questoes.length; j++) {
        print("Questão $j) ${this.testes[index].questoes[j].problema}");
        print("Resposta: ${this.testes[index].questoes[j].resposta}");
      }
    }
  }
}

//definição do objeto Teste
class Teste {
  String nomeTeste; //nome do conteúdo do teste
  List <Questao> questoes = []; //conteúdo do teste

  Teste(this.nomeTeste, this.questoes); //construtor direto
}

//definição do objeto Problema
class Questao {
  String problema;
  String resposta;

  Questao(this.problema, this.resposta); //construtor direto
}
