import "dart:core";
import "dart:io";
import "dart:math";
import "dart:convert";

import "entidades-math_test.dart"; //definições das classes
import "util.dart"; //funções úteis feitas por fora

/*
  Programa no formato de quiz que irá testar os conhecimentos de algebra
  do usuario ao cadastrar problemas e rodar pequenos testes! 
  O usuario podera ver no final sua pontuacao e tambem armazenar seus dados
  no programa
*/

//Programa principal
void main() {
  List<Aluno> alunos = []; //conjunto de alunos do programa
  List<Professor> professores = []; //conjunto de professores do programa
  List<Teste> provas = []; //conjunto de testes do programa
  String opcao1, opcao2, nome, codigo, senhaA, senha, problema, resposta;
  late int i, j, index, posicao, tam, nota, existe;
  bool rodando = true, erro, feito;

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
            //lendo dados do usuario e tentando acessar sua lista de testes
            codigo = lerDados("\nCódigo de usuário: ");
            //procurando usuario na lista de alunos
            index = existeUsuario(alunos, codigo);
            if (index != -1) {
              erro = false;
              try {
                posicao = int.parse(lerDados("\nIndex da prova (-1 para ver todos): "));
              } on FormatException {
                erro = true;
              }
              if (!erro && posicao >= -1 && posicao < alunos[index].testes.length) {
                print("\n# Histórico de testes #\n");
                print("Aluno: ${alunos[index].nome}\n");
                alunos[index].getTeste(posicao); //imprimindo histórico
                print("\n#         Fim         #\n");
              } else {
                print("\nOpção inválida!!!\n");
              }
            } else {
              print("\nO aluno [$codigo] não existe na base de dados...\n");
            }
          } else if (opcao2 == '3') {
            //lendo dados do usuario e tentando acessar sua lista de testes
            codigo = lerDados("\nCódigo de usuário: ");
            //procurando usuario na lista de alunos
            index = existeUsuario(alunos, codigo);
            if (index != -1) {
              nome = lerDados("\nConteúdo da prova: ");
              //verificando se o aluno já não fez a prova
              feito = fezProva(alunos[index].testes, nome);
              if (!feito) {
                posicao = existeProva(provas, nome);
                if (posicao != -1) {
                  //realizando prova, caso exista
                  nota = realizarProva(provas[posicao]); //devolve nota do aluno
                  print("\nProva concluída! Nota final: $nota\n");
                  alunos[index].testes.add("Prova [$nome] feita! Nota = $nota\n");
                } else {
                  print("\nA prova [$nome] não existe na base de dados...\n");
                }
              } else {
                print("\nA prova [$nome] já foi respondida!\n");
              }
            } else {
              print("\nO aluno [$codigo] não existe na base de dados...\n");
            }
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
          print("[3] Adicionar prova");
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
            //lendo dados do usuario e tentando acessar sua lista de testes
            codigo = lerDados("\nCódigo de usuário: ");
            //procurando usuario na lista de professores
            index = existeUsuario(professores, codigo);
            if (index != -1) {
              erro = false;
              try {
                posicao = int.parse(lerDados("\nIndex da prova (-1 para ver todos): "));
              } on FormatException {
                erro = true;
              }
              if (!erro && posicao >= -1 && posicao < professores[index].testes.length) {
                print("\n# Histórico de provas #\n");
                print("Professor: ${professores[index].nome}\n");
                professores[index].getTeste(posicao); //imprimindo histórico
                print("\n#         Fim         #\n");
              } else {
                print("\nOpção inválida!!!\n");
              }
            } else {
              print("\nO professor [$codigo] não existe na base de dados...\n");
            }
          } else if (opcao2 == '3') {
            //lendo dados do usuario e tentando acessar sua lista de testes
            codigo = lerDados("\nCódigo de usuário: ");
            //procurando usuario na lista de professores
            index = existeUsuario(professores, codigo);
            if (index != -1) {
              //verificando o número de questoes que o professor deseja criar
              erro = false;
              try {
                tam = int.parse(lerDados("Número de questões: "));
              } on FormatException {
                erro = true;
              }
              if (!erro && tam >= 1) {
                nome = lerDados("\nNome do teste: ");
                existe = existeProva(professores[index].testes, nome);
                if (existe == -1) {
                  //criando lista de questões para a prova
                  List <Questao> questoes = [];
                  for (i=0; i<tam; i++) {
                    //armazenando conteúdo da questão
                    problema = lerDados("Enunciado da questão $i: ");
                    resposta = lerDados("Resposta da questão $i: ");
                    //adicionando questão à lista de questões
                    Questao questao = new Questao(problema, resposta);
                    questoes.add(questao);
                  }
                  //salvando prova na lista de provas do sistema e do professor
                  Teste teste = new Teste(nome, questoes);
                  professores[index].testes.add(teste);
                  provas.add(teste);
                  print("\nProva de [$nome] cadastrada com sucesso!\n");
                } else {
                  print("\nProva de [$nome] já casdastrada!!!\n");
                }
              } else {
                print("\nOpção inválida!!!\n");
              }
            } else {
              print("\nO professor [$codigo] não existe na base de dados...\n");
            }
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
  Função que retorna a posicao de uma prova na lista, devolve -1 se não existir
*/
int existeProva(List provas, String nome) {
  int i, index = -1;
  for (i=0; i<provas.length; i++) {
    if (provas[i].nomeTeste == nome) index = i;
  }
  return index;
}

/*
  Função que faz com que um Aluno responda um Teste, devolve a nota do Aluno
*/
int realizarProva(Teste prova) {
  String resposta;
  int i, nota = 0;
  //percorrendo conteúdo da prova e esperando pelas respostas do aluno
  print("\nPROVA [${prova.nomeTeste}]\n");
  for (i=0; i<prova.questoes.length; i++) {
    resposta = lerDados("$i) ${prova.questoes[i].problema} ");
    if (resposta == prova.questoes[i].resposta) nota++; //acerto igual a 1 ponto
  }
  return nota;
}

/*
  Função que verifica se um Aluno fez um Teste, devolve true ou false
*/
bool fezProva(List provas, String nome) {
  bool feito = false;
  int i;
  for (i=0; i<provas.length; i++) {
    if (provas[i].contains(nome)) feito = true;
  }
  return feito;
}
