import "package:flutter/material.dart";

//classe responsável por mostrar as informações do app
class Info extends StatelessWidget {
  final String texto; //não irá mudar após ser inicializado
  final double fonte;

  //construtor da classe, recebe um input externo
  Info({this.texto = "TEXTO PADRAO", this.fonte = 20});

  @override
  Widget build(BuildContext context) {
    /*
      O texto será impresso dentro de um Container, uma espécie de "baú" de 
      widgets, que contem uma child (o texto nesse caso) e outros atributos
      internos como: preenchimento, borda e margem. Altamente customizavel...
    */
    return Container(
      width: double.infinity, //faz com que o container ocupe todo o espaço da tela
      margin: EdgeInsets.all(5), //adicionando margem do texto em todas as direções
      child:
        Text(
          texto, //conteudo da questão que será impresso na tela
          textAlign: TextAlign.center, //alinhamento funciona por causa do width
          style: //várias customizações no texto da questão
            TextStyle(
              fontSize: fonte, 
              color: Colors.black,
            ),
        ),
    );
  }
}

//classe responsavel pelos botoes do app
class Botao extends StatelessWidget {
  final Function acao; //ponteiro para uma função
  final String texto;
  final double altura, largura, fonte;

  Botao( this.acao, {this.texto = "blablabla", this.largura = 100, 
          this.altura = 40, this.fonte = 15});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.largura,
      height: this.altura,
      margin: EdgeInsets.all(5), //adicionando margem do botao em todas as direções
      child: ElevatedButton(
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle (
            fontSize: this.fonte,
          )
        ), 
        onPressed: () => acao(texto),
      ),
    );
  }
}

//Função que retorna um widget responsavel pelo conteudo das abas do app
Widget abaApp(String texto) {
  double largura = 200;
  double altura = 200;
  //verificando tipo de aba passada
  if (texto == "Alarm") {
    return Container(
      width: largura,
      height: altura,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Info(texto: "Entrou em Alarm!!!"),
        ],
      ),
    );
  } else if (texto == "StopWatch") {
    return Container(
      width: largura,
      height: altura,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Info(texto: "Entrou em StopWatch!!!"),
        ],
      ),
    );
  } else if (texto == "Timer") {
    return Container(
      width: largura,
      height: altura,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Info(texto: "Entrou em Timer!!!"),
        ],
      ),
    );
  } else {
    //aba padrão do app
    return Container(
      width: largura,
      height: altura,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Info(texto: "Entrou em Padrao!!"),
        ],
      ),
    );
  }
}