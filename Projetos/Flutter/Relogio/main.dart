import "package:flutter/material.dart";

import "./util.dart";

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
  String _estado = ""; //contador do numero de cliques dados no app

  //metodos da classe App
  void _botaoCheck(String texto) {
    print("Escolhi a resposta: $texto");
    //mudando estado do app (dado interno)
    setState(() {
      this._estado = texto;
    });
  }

  @override //alterando metodo da super classe com o meu próprio
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( //uma espécie de tela do app para fazer alterações
        appBar: AppBar( //barra do app que pode realizar varias coisas
          title: Text("CLOCK 1.0",),
        ),
        body: Column(  //corpo da tela do app (em formato de colunas/ up e down)
          children: [
            //menu de opções
            Row(
              children: <Widget>[
                Botao(_botaoCheck, texto: "Alarm", largura: 80),
                Botao(_botaoCheck, texto: "StopWatch"),
                Botao(_botaoCheck, texto: "Timer", largura: 80),
                Botao(_botaoCheck, texto: "ZERAR", largura: 80),
              ],
            ),
            //mostrando aba de acordo com o estado do app
            abaApp(_estado),
            Info(texto: "Estado atual: $_estado"),
          ],
        ),
      ),
    );
  }
}