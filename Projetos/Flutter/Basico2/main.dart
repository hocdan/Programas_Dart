import "package:flutter/material.dart";

import "./question.dart"; //classe Questao (procurar na mesma pasta de main.dart)

void main () => runApp(MyApp());

//classe do app agora pode mudar seu estado interno sem depende do externo
class MyApp extends StatefulWidget {
  //linkando o estado interno do app (dados do app que persistem ao dar rebuild)
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

/*
  A classe está como protected bem como seus atributos e métodos, para assegu-
  rar que o estado do app seja SOMENTE modificado pelo arquivo main.dart, pre-
  vinindo assim comportamentos imprevisíveis na aplicação final.
*/
class _MyAppState extends State<MyApp> {
  //atributos da classe App
  var _perguntas = ["2 + 2?", "2 - 2?"];
  int _numCliques = 0; //contador do numero de cliques dados no app

  //metodos da classe App
  void _resposta1Questao1() {
    print("Escolhi a resposta: 4");
    //mudando estado do app (dado interno)
    setState(() {
      _numCliques++; //contador agora é atualizado
    });
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
            //usando classe Questao (um widget) para mostrar um texto customizado
            Questao(_perguntas[0], 20),
            //botao1 que mostra um texto e realiza uma funcao ao ser pressionado
            ElevatedButton(
              child: Text("4"), 
              onPressed: _resposta1Questao1,
            ),
            //botao2 que mostra um texto e realiza uma funcao ao ser pressionado
            ElevatedButton(
              child: Text("5"), 
              onPressed: () {
                print("Escolhi a resposta: 5");
                setState(() {
                  _numCliques++; //contador agora é atualizado
                });
              }, //função sem nome
            ),
            //usando classe Questao (um widget) para mostrar um texto customizado
            Questao(_perguntas[1], 30),
            //botao3 que mostra um texto e realiza uma funcao ao ser pressionado
            ElevatedButton(
              child: Text("-2"), 
              onPressed: ()  {
                print("Escolhi a resposta: -2");
                print("Que loucura de resposta...");
                setState(() {
                  _numCliques++; //contador agora é atualizado
                });
              }, //função sem nome (com varias expressoes dentro)
            ),
            //botao4 que mostra um texto e realiza uma funcao ao ser pressionado
            ElevatedButton(
              child: Text("0"), 
              onPressed: () {
                print("Escolhi a resposta: 0");
                setState(() {
                  _numCliques++; //contador agora é atualizado
                });
              }, //função sem nome
            ),
            //imprimindo texto no formato de coluna
            Text("Número de respostas dadas: $_numCliques"),
            //botao5 que irá zerar o contador de respostas dadas
            ElevatedButton(
              child: Text("ZERAR"), 
              onPressed: () {
                print("Resetando número de respostas fornecidas");
                setState(() {
                  _numCliques = 0; //contador agora é atualizado
                });
              }, //função sem nome
            ),
          ],
        ),
      ),
    );
  }
}
