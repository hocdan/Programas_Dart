import 'dart:html'; //library de Dart para interagir com documentos HTML

void main() {
  querySelector("#button")!.onClick.listen(sayHello);
}

//Essa funcao nao devolve valores e tem como argumento eventos que ocorrem no mouse
//assim que o usuario clicar (Dart fica responsavel por isso)
void sayHello(MouseEvent event) {
  querySelector("#answer1")!.text = (querySelector("#answer_box1") as InputElement).value;
  (querySelector("#answer_box1") as InputElement).value = "";
  querySelector("#answer2")!.text = (querySelector("#answer_box2") as InputElement).value;
  (querySelector("#answer_box2") as InputElement).value = "";
  querySelector("#answer3")!.text = (querySelector("#answer_box3") as InputElement).value;
  (querySelector("#answer_box3") as InputElement).value = "";
  querySelector("#answer4")!.text = (querySelector("#answer_box4") as InputElement).value;
  (querySelector("#answer_box4") as InputElement).value = "";
  querySelector("#answer5")!.text = (querySelector("#answer_box5") as InputElement).value;
  (querySelector("#answer_box5") as InputElement).value = "";
  querySelector("#answer6")!.text = (querySelector("#answer_box6") as InputElement).value;
  (querySelector("#answer_box6") as InputElement).value = "";
}

