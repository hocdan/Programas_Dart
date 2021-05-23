/* Arquivo responsável pelas entidades da aplicação */

// adicionando enum ao invés de strings, pra ter mais 'controle'
enum Privilegio{
  professor,
  aluno
}

/*
Serve pra dar um 'get' personalizado no enum. Não é realmente necessário.
Se não quiser usar, usa o if padrão mesmo, tipo -> if Privilegio.professor return 'Professor'*/
extension PrivilegioExtensao on Privilegio {
  String get nome {
    switch (this) {
      case Privilegio.professor:
        return 'Professor';
      case Privilegio.aluno:
        return 'Aluno';
      default:
        return '';
    }
  }
}

//definição da super classe Usuario, que irá derivar Aluno e Professor, somente!
abstract class Usuario {
  late String nome; //identificador do usuario
  late String codigo; //identificador unico do usuario
  late String _senha; //para proteger o uso indevido do perfil do usuário
  late Privilegio _tipo; //seu tipo/privilegio, pode ser: Aluno ou Professor
  late List
  testes; //pode armazenar historico de testes ou problemas matematicos

  void verInfo() {
    print("\n===================================");
    print("+ Nome do usuário: $nome");
    print("+ Senha: ${'*' * _senha.length}");
    print("+ Cargo: ${_tipo.nome}"); // usaria if aqui caso não queira usar a extensão
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

  List getTeste(int index) {
    if (index == -1)
      return this.testes; //retornando todos os testes
    else
      return this.testes[index].toList(); //retornando um teste especifico
  }
}

//definição do objeto Aluno
class Aluno extends Usuario {
  Aluno(String nome, String codigo, String senha) {
    this.nome = nome;
    this.codigo = codigo;
    this._senha = senha;
    this._tipo = Privilegio.aluno;
    this.testes = []; //lista vazia
  }

  void addTeste(String teste) {
    this.testes.add(teste);
  }
}

//definição do objeto Professor
class Professor extends Usuario {
  Professor(String nome, String codigo, String senha) {
    this.nome = nome;
    this.codigo = codigo;
    this._senha = senha;
    this._tipo = Privilegio.professor;
    this.testes = []; //lista vazia
  }

  void addTeste(Problema teste) {
    this.testes.add(teste);
  }
}

//definição do objeto Problema
class Problema {
  String _questao;
  String _resposta;

  Problema(this._questao, this._resposta); //construtor direto
}
