import "dart:core";

import 'entidades.dart';
import 'service.dart';
import 'util.dart';

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
  List<Problema> provas = []; //conjunto de provas do programa
  String opcao1, opcao2, codigo, senhaA, senha, questao, resposta;
  int index;
  bool rodando = true, erro;

  //loop principal
  while (rodando) {
    // teste pra ver se tá cadastrando mais de 1 aluno ou professor
    alunos.forEach((aluno) {print(aluno.nome);});
    professores.forEach((professor) {print(professor.nome);});

    //imprimindo menu
    print("\nMATH TESTE 1.0\n");
    print("[1] Acessar área do aluno");
    print("[2] Acessar área do professor");
    print("[3] Mudar senha");
    print("[4] Ver perfil");
    print("[5] Sair");
    opcao1 = lerDadosDeMenu();
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
          opcao2 = lerDadosDeMenu();
          //realizando opcoes
          if (opcao2 == '1') {
            print("\nCriando novo aluno...\n");
            Aluno aluno = cadastrarAluno();
            alunos.add(aluno);
            print("\nAluno de código ${aluno.codigo} criado com sucesso!\n");
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
          opcao2 = lerDadosDeMenu();
          //realizando opcoes
          if (opcao2 == '1') {
            print("\nCriando novo professor...\n");
            Professor professor = cadastrarProfessor();
            professores.add(professor);
            print("\nProfessor de código ${professor.codigo} criado com sucesso!\n");
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
