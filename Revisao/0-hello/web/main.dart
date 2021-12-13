import 'dart:html'; //library de Dart para interagir com documentos HTML

void main() {
  querySelector("#button")!.onClick.listen(sayHello);
  /*
    A instrucao acima faz com que o programa Dart busque no arquivo HTML desse
    projeto por um elemento botao e entao diz que quando houber um clique nele,
    a funcao sayHello sera chamada.
  */
}

//Essa funcao nao devolve valores e tem como argumento eventos que ocorrem no mouse
//assim que o usuario clicar (Dart fica responsavel por isso)
void sayHello(MouseEvent event) {
  querySelector("#name")!.text = (querySelector("#name_box") as InputElement).value;
  (querySelector("#name_box") as InputElement).value = "";
  /*
    A primeira instrucao faz com que o programa Dart busque no arquivo HTML desse
    projeto por um elemento com o ID de "name" para entao acessar sua propriedade
    text. Propriedade esta que esta sendo setada pelo elemento no arquivo HTML com 
    ID de "name_box", que funciona recebendo inputs do usuario. Esse input eh acessado 
    com o .value.
    A segunda instrucao "reseta" o valor do elemento de ID "name_box" para uma string
    vazia, para que nao haja interferencias nas proximas utilizacoes do usuario.
  */
}

