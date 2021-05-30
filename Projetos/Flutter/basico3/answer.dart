import "package:flutter/material.dart";

class Resposta extends StatelessWidget {
  final Function acao; //ponteiro para uma função
  final String texto;
  final double altura, largura, fonte;

  Resposta(this.texto, this.acao, this.largura, this.altura, this.fonte);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.largura,
      height: this.altura,
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