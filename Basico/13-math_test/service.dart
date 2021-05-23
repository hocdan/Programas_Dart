import 'entidades.dart';
import 'util.dart';

/* Arquivo responsável pela 'regra de negócio' da aplicação */

/**
 * Pede os dados e retorna um professor com os dados setados.
 */
Professor cadastrarProfessor() {
  String nome = lerDados("Nome do professor: ");
  String senha = lerDados("Senha: ");
  String codigo = "P-" + getRandString(5);
  return new Professor(nome, codigo, senha);
}

/**
 * Pede os dados e retorna um aluno com os dados setados.
 */
Aluno cadastrarAluno() {
  String nome = lerDados("Nome do aluno: ");
  String senha = lerDados("Senha: ");
  String codigo = "A-" + getRandString(5);
  return new Aluno(nome, codigo, senha);
}

/**
 * Pede os dados e retorna um Usuario, que pode ser um professor ou um aluno com os dados setados.
 *
 * Deixando a função de cadastrar mais genérica. Mas não precisa usar, é totalmente opcional.
 * Usar ela ou as funções acima.
 */
Usuario _cadadastrar(Privilegio privilegio) {
  String nome = lerDados("Nome do ${privilegio.nome.toLowerCase()}: ");
  String senha = lerDados("Senha: ");
  String codigo = "A-" + getRandString(5);
  bool ehUmProfessor = privilegio == Privilegio.professor;
  if (ehUmProfessor) {
    return new Professor(nome, codigo, senha);
  } else {
    return new Aluno(nome, codigo, senha);
  }
}

//se for usar a função acima, se usa desta forma aq:
// Aluno cadastrarAluno() {
//   return _cadadastrar(Privilegio.aluno) as Aluno;
// }
