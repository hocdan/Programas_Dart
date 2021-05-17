void main() {
  String nome = "Daniel";
  int idade = 21;
  double peso = 69.7;
  bool maiorDeIdade;

  print("Olá, $nome!");
  print("Uau! $idade anos é muito tempo...");
  print("Seu peso atual é de $peso kg.");

  if (idade >= 18)
    maiorDeIdade = true;
  else
    maiorDeIdade = false;

  print("Maior de idade? $maiorDeIdade");
}
