import "package:flutter/material.dart";

void main() {
  //rodando o app, iniciando arvore de Widgets e desenhando na tela
  runApp(MyApp());
  /*
    A main tambem pode ser feita assim (por ter apenas 1 expressao):

    void main() => runApp(MyApp());
  */
} 

class MyApp extends StatelessWidget {
  //atributos da classe App
  var perguntas = ["2 + 2?", "2 - 2?"];

  //metodos da classe App
  void resposta1Questao1() {
    print("Escolhi a resposta: 4");
  }

  @override //alterando metodo da super classe com o meu próprio
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( //uma espécie de tela do app para fazer alterações
        appBar: AppBar( //barra do app que pode realizar varias coisas
          title: Text("Meu primeiro app"),
        ),
        body: Column(  //corpo da tela do app (em formato de colunas/ up e down)
          children: <Widget>[
            //imprimindo texto1 no formato de coluna
            Text(perguntas[0]),
            //botao1 que mostra um texto e realiza uma funcao ao ser pressionado
            ElevatedButton(
              child: Text("4"), 
              onPressed: resposta1Questao1,
            ),
            //botao2 que mostra um texto e realiza uma funcao ao ser pressionado
            ElevatedButton(
              child: Text("5"), 
              onPressed: () => print("Escolhi a resposta: 5"), //função sem nome
            ),
            //imprimindo texto2 no formato de coluna
            Text(perguntas[1]),
            //botao3 que mostra um texto e realiza uma funcao ao ser pressionado
            ElevatedButton(
              child: Text("-2"), 
              onPressed: ()  {
                print("Escolhi a resposta: -2");
                print("Que loucura de resposta...");
              }, //função sem nome (com varias expressoes dentro)
            ),
            //botao4 que mostra um texto e realiza uma funcao ao ser pressionado
            ElevatedButton(
              child: Text("0"), 
              onPressed: () => print("Escolhi a resposta: 0"), //função sem nome
            ),
          ],
        ),
      ),
    );
  }
}
