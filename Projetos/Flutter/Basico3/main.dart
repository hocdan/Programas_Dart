import "package:flutter/material.dart";

import "./question.dart"; //classe Questao (procurar na mesma pasta de main.dart)
import "./answer.dart";

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
  void _respostaQuestao(String texto) {
    print("Escolhi a resposta: $texto");
    //mudando estado do app (dado interno)
    setState(() {
      if (texto == "ZERAR") {
        _numCliques = 0; //contador resetado
      } else {
        _numCliques++; //contador agora é atualizado
      }
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
            Resposta("4", _respostaQuestao, 100, 30, 20),
            //botao2 que mostra um texto e realiza uma funcao ao ser pressionado
            Resposta("5", _respostaQuestao, 100, 30, 20),
            //usando classe Questao (um widget) para mostrar um texto customizado
            Questao(_perguntas[1], 30),
            //botao3 que mostra um texto e realiza uma funcao ao ser pressionado
            Resposta("-2", _respostaQuestao, 100, 30, 20),
            //botao4 que mostra um texto e realiza uma funcao ao ser pressionado
            Resposta("0", _respostaQuestao, 100, 30, 20),
            //imprimindo texto no formato de coluna
            Questao("Número de respostas dadas: $_numCliques", 20),
            //botao5 que irá zerar o contador de respostas dadas
            Resposta("ZERAR", _respostaQuestao, 100, 30, 20),
          ],
        ),
      ),
    );
  }
}
