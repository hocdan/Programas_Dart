import "dart:core";
import "dart:io";
import "dart:math";
import "dart:convert";

/*
  Programa no formato de quiz que irá testar os conhecimentos de algebra
  do usuario ao cadastrar problemas e rodar pequenos testes! 
  O usuario podera ver no final sua pontuacao e tambem armazenar seus dados
  no programa
*/

//definição da super classe Usuario, que irá derivar Aluno e Professor, somente!
abstract class Usuario {
  late String nome; //identificador do usuario
  late String codigo; //identificador unico do usuario
  late String _senha; //para proteger o uso indevido do perfil do usuário
  late String _tipo; //seu tipo/privilegio, pode ser: Aluno ou Professor
  late List
      testes; //pode armazenar historico de testes ou problemas matematicos

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
    this._tipo = "Aluno";
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
    this._tipo = "Professor";
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

//Programa principal
void main() {
  List<Aluno> alunos = []; //conjunto de alunos do programa
  List<Professor> professores = []; //conjunto de professores do programa
  List<Problema> provas = []; //conjunto de provas do programa
  String opcao1, opcao2, nome, codigo, senhaA, senha, questao, resposta, tipo;
  int index;
  bool rodando = true, erro;

  //loop principal
  while (rodando) {
    //imprimindo menu
    print("\nMATH TESTE 1.0\n");
    print("[1] Acessar área do aluno");
    print("[2] Acessar área do professor");
    print("[3] Mudar senha");
    print("[4] Ver perfil");
    print("[5] Sair");
    opcao1 = lerDados("----> ");
    //realizando opcoes do menu
    switch (opcao1) {
      case '1':
        print("\nCarregando conteúdo de Alunos...\n");
        while (true) {
          print("\nPortal do Aluno\n");
          print("[1] Cadastrar novo aluno");
          print("[2] Ver histórico de provas");
          print("[3] Realizar prova");
          print("[4] Sair");
          opcao2 = lerDados("---> ");
          //realizando opcoes
          if (opcao2 == '1') {
            print("\nCriando novo aluno...\n");
            nome = lerDados("Nome do aluno: ");
            senha = lerDados("Senha: ");
            codigo = "A-" + getRandString(5);
            Aluno aluno = new Aluno(nome, codigo, senha);
            alunos.add(aluno);
            print("\nAluno de código $codigo criado com sucesso!\n");
          } else if (opcao2 == '2') {
            print("\nEM DESENVOLVIMENTO...\n");
          } else if (opcao2 == '3') {
            print("\nEM DESENVOLVIMENTO...\n");
          } else if (opcao2 == '4') {
            print("\nSaindo da área do Aluno...\n");
            break; //encerrando loop do menu Aluno
          } else {
            print("\nOpção inválida!!!\n");
          }
        }
        break;
      case '2':
        print("\nCarregando conteúdo de Professores...\n");
        while (true) {
          print("\nPortal do Professor\n");
          print("[1] Cadastrar novo professor");
          print("[2] Ver provas formuladas");
          print("[3] Adicionar questão");
          print("[4] Sair");
          opcao2 = lerDados("---> ");
          //realizando opcoes
          if (opcao2 == '1') {
            print("\nCriando novo professor...\n");
            nome = lerDados("Nome do professor: ");
            senha = lerDados("Senha: ");
            codigo = "P-" + getRandString(5);
            Professor professor = new Professor(nome, codigo, senha);
            professores.add(professor);
            print("\nProfessor de código $codigo criado com sucesso!\n");
          } else if (opcao2 == '2') {
            print("\nEM DESENVOLVIMENTO...\n");
          } else if (opcao2 == '3') {
            print("\nEM DESENVOLVIMENTO...\n");
          } else if (opcao2 == '4') {
            print("\nSaindo da área do Professor...\n");
            break; //encerrando loop do menu Professor
          } else {
            print("\nOpção inválida!!!\n");
          }
        }
        break;
      case '3':
        codigo = lerDados("\nCódigo de usuário: ");
        if (codigo[0] == 'A') {
          //procurando usuario na lista de alunos
          index = existeUsuario(alunos, codigo);
          if (index != -1) {
            senhaA = lerDados("\nSenha antiga: ");
            senha = lerDados("\nSenha nova: ");
            alunos[index].setSenha(senhaA, senha); //tentativa de troca feita
          } else {
            print("\nO aluno [$codigo] não existe na base de dados...\n");
          }
        } else if (codigo[0] == 'P') {
          //procurando usuario na lista de professores
          index = existeUsuario(professores, codigo);
          if (index != -1) {
            senhaA = lerDados("\nSenha antiga: ");
            senha = lerDados("\nSenha nova: ");
            professores[index]
                .setSenha(senhaA, senha); //tentativa de troca feita
          } else {
            print("\nO professor [$codigo] não existe na base de dados...\n");
          }
        } else {
          print("\nTipo inválido de usuário!!!\n");
        }
        break;
      case '4':
        codigo = lerDados("\nCódigo de usuário: ");
        if (codigo[0] == 'A') {
          //procurando usuario na lista de alunos
          index = existeUsuario(alunos, codigo);
          if (index != -1) {
            alunos[index].verInfo(); //timprimindo dados do aluno
          } else {
            print("\nO aluno [$codigo] não existe na base de dados...\n");
          }
        } else if (codigo[0] == 'P') {
          //procurando usuario na lista de professores
          index = existeUsuario(professores, codigo);
          if (index != -1) {
            professores[index].verInfo(); //timprimindo dados do professor
          } else {
            print("\nO professor [$codigo] não existe na base de dados...\n");
          }
        } else {
          print("\nTipo inválido de usuário!!!\n");
        }
        break;
      case '5':
        print("\nEncerrando aplicação...\n");
        rodando = false;
        break;
      default:
        print("\nOpção inválida!!!\n");
    }
  }
}

String lerDados(String texto) {
  stdout.write(texto);
  String resposta = stdin.readLineSync().toString();
  return resposta;
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

/*
  Função que retorna uma cadeia de caracteres aleatória para servir de código
*/
String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
