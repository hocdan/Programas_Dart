import "package:flutter/material.dart";

//classe responsável pelas questões do app
class Questao extends StatelessWidget {
  final String texto; //não irá mudar após ser inicializado
  final double fonte;

  Questao(this.texto, this.fonte); //construtor da classe, recebe um input externo

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