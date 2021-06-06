//home.dart
import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

/*
  Planificando a Widget Tree usando o método de encapsular widgets importantes
  em classes de widgets.

  Atalho: clique com o botao esquerdo do mouse no Widget a ser "aplanado", esco-
  lha a opcao extract widget e entao dê um nome para ele, a implementacao dele
  estará no final do codigo.

  OBS: use a palavra const antes dos widgets "aplanados" para melhorar performan-
  ce, já que assim eles não serão reconstruidos toda vez que uma mudança for fei-
  ta. Ou seja, assegure-se de usar const em widgets que nao mudem com o tempo.
*/

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea (
        child: SingleChildScrollView (
          child: Padding (
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget> [
                const RowWidget(),
                Padding (padding: EdgeInsets.all(16.0)),
                  Row (
                    children: <Widget> [
                      const ColumnWidget(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget> [
        Container (
          color: Colors.yellow,
          height: 60.0,
          width: 60.0,
        ),
        Padding (padding: EdgeInsets.all(16.0),),
        Container (
          color: Colors.amber,
          height: 40.0,
          width: 40.0,
        ),
        Padding (padding: EdgeInsets.all(16.0)),
        Container (
          color: Colors.brown,
          height: 20.0,
          width: 20.0,
        ),
        Divider(),
        const RowAndStack(),
        Divider(),
        Text("Fim da linha!"),
      ],
    );
  }
}

class RowAndStack extends StatelessWidget {
  const RowAndStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row (
      children: <Widget> [
        CircleAvatar (
          backgroundColor: Colors.lightGreen,
          radius: 100.0,
          child: Stack (
            children: <Widget> [
              Container (
                color: Colors.yellow,
                height: 100.0,
                width: 100.0,
              ),
              Container (
                color: Colors.amber,
                height: 60.0,
                width: 60.0,
              ),
              Container (
                color: Colors.brown,
                height: 40.0,
                width: 40.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row (
      children: <Widget> [
        Container (
          color: Colors.yellow,
          height: 40.0,
          width: 40.0,
        ),
        Padding (padding: EdgeInsets.all(16.0),),
        Expanded (
          child: Container (
            color: Colors.amber,
            height: 40.0,
            width: 40.0,
          ),
        ),
        Container (
          color: Colors.brown,
          height: 40.0,
          width: 40.0,
        ),
      ],
    );
  }
}