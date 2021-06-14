import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

/*
  Utilizando widgets basicos para montar o "esqueleto" da maioria dos apps.

  Customizando o app com widgets de barra, icones, rolamento e disposicao de
  outros widgets...
*/

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold (
      appBar: AppBar (
        title: Text("Title"),
        leading: IconButton (
          icon: Icon(Icons.menu),
          onPressed: () => {},
        ),
        actions: <Widget> [
          IconButton (
            icon: Icon(Icons.more_vert),
            onPressed: () => {},
          ),
        ],
        flexibleSpace: SafeArea (
          child: Icon (
            Icons.camera,
            size: 55.0,
            color: Colors.white70,
          ),
        ),
        bottom: PreferredSize (
          child: const MenuPopUpDeItens(),
          preferredSize: Size.fromHeight(50.0),
        ),
      ),
      body: Padding (
        padding: EdgeInsets.all(16.0),
        child: SafeArea (
          child: SingleChildScrollView (
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget> [
                const ContainerWithBoxDecorationWidget(),
                Divider(),
                const ColumnWidget(),
                Divider(),
                const RowWidget(),
                Divider(),
                const MatrizDeWidgets(),
                Divider(),
                const MenuPopUpDeItens(),
                Divider(),
                const ButtonsWidget(),
                Divider(),
                const ButtonsBarWidget(),
              ]
            ),
          ),
        ),
      ),
      ///*
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.lightGreen.shade100,
      ),
      //*/
      /*
      //variacao do botao floating
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.play_arrow),
        label: Text('Play'),
      ),
      */
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4.0,
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(
              padding: EdgeInsets.all(32.0),
            ),
          ],
        ),
      ),
    );
    return scaffold;
  }
}

class ButtonsBarWidget extends StatelessWidget {
  const ButtonsBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.white70,
      child: ButtonBar (
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          IconButton (
            onPressed: () => {},
            icon: Icon(Icons.ac_unit),
            hoverColor: Colors.blueAccent,
          ),
          IconButton (
            onPressed: () => {},
            icon: Icon(Icons.account_tree_sharp),
            hoverColor: Colors.lightGreen,
          ),
          IconButton (
            onPressed: () => {},
            icon: Icon(Icons.map),
            hoverColor: Colors.amberAccent,
          ),
          IconButton (
            onPressed: () => {},
            icon: Icon(Icons.dark_mode),
            hoverColor: Colors.black87,
          ),
        ],
      ),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget> [
        Row (
          children: <Widget> [
            Padding(padding: EdgeInsets.all(16.0),),
            TextButton (
              onPressed: () => {},
              child: Text("Flag"),
            ),
            Padding(padding: EdgeInsets.all(40.0),),
            IconButton (
              onPressed: () => {},
              icon: Icon(Icons.flag),
            ),
          ],
        ),
        Divider(),
        Row (
          children: <Widget> [
            Padding(padding: EdgeInsets.all(16.0),),
            TextButton (
              onPressed: () => {},
              child: Text("Save"),
            ),
            Padding(padding: EdgeInsets.all(40.0),),
            TextButton (
              onPressed: () => {},
              child: Icon(Icons.save),
            ),
          ],
        ),
        Divider(),
        Row (
          children: <Widget> [
            Padding(padding: EdgeInsets.all(16.0),),
            TextButton (
              onPressed: () => {},
              child: Text("Add"),
            ),
            Padding(padding: EdgeInsets.all(40.0),),
            TextButton (
              onPressed: () => {},
              child: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}

class MenuPopUpDeItens extends StatelessWidget {
  const MenuPopUpDeItens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      child: PopupMenuButton<TodoMenuItem>(
        icon: Icon(Icons.view_list),
        onSelected: ((valueSelected) {
        print('valueSelected: ${valueSelected.title}');
        }),
        itemBuilder: (BuildContext context) {
          return foodMenuList.map(
            (TodoMenuItem todoMenuItem) {
              return PopupMenuItem<TodoMenuItem>(
                value: todoMenuItem,
                child: Row(
                  children: <Widget>[
                    Icon(todoMenuItem.icon.icon),
                    Padding(padding: EdgeInsets.all(8.0),),
                    Text(todoMenuItem.title),
                  ],
                ),
              );
            }
          ).toList();
        },
      ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget> [
        Text("Coluna 1"),
        Text("Coluna 2"),
        Text("Coluna 3"),
        Text("Coluna 4"),
      ],
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget> [
        Text("Linha 1"),
        Text("Linha 2"),
        Text("Linha 3"),
      ],
    );
  }
}

class MatrizDeWidgets extends StatelessWidget {
  const MatrizDeWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //fileira 1
        Row (
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            Text('1'),
            Padding(padding: EdgeInsets.all(16.0),),
            Text('2'),
            Padding(padding: EdgeInsets.all(16.0),),
            Text('3'),
          ],
        ),
        //fileira 2
        Row (
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            Text('4'),
            Padding(padding: EdgeInsets.all(16.0),),
            Text('5'),
            Padding(padding: EdgeInsets.all(16.0),),
            Text('6'),
          ],
        ),
        //fileira 3
        Row (
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            Text('7'),
            Padding(padding: EdgeInsets.all(16.0),),
            Text('8'),
            Padding(padding: EdgeInsets.all(16.0),),
            Text('9'),
          ],
        ),
      ],
    );
  }
}
class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget> [
        Container (
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(10.0),
            ),
            gradient: LinearGradient (
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlueAccent,
                Colors.lightGreen.shade500,
              ],
            ), ///*
            boxShadow: [
              BoxShadow (
                color: Colors.white,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ], //*/
          ),
          child: Center (
            child: RichText (
              text: TextSpan (
                text: "Flutter World!",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.deepPurple,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepPurpleAccent,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' for',
                  ),
                  TextSpan(
                    text: ' Mobile',
                    style: TextStyle(
                    color: Colors.deepOrange,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TodoMenuItem {
  final String title;
  final Icon icon;

  TodoMenuItem (this.title, this.icon);
}

List<TodoMenuItem> foodMenuList = [
  TodoMenuItem("Pedir comida", Icon(Icons.fastfood)),
  TodoMenuItem("Adicionar alarme", Icon(Icons.add_alarm)),
  TodoMenuItem("Agendar voo", Icon(Icons.flight)),
  TodoMenuItem("Escutar musica", Icon(Icons.audiotrack)),
];