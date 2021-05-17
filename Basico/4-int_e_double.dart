import "dart:math";

void main() {
  int n1 = 2, n2 = 9;
  double d1 = 3.14, d2 = 1.5;

  print("\nINTEIROS\n");
  print("Soma de $n1 e $n2: ${n1 + n2}");
  print("Subtracao de $n1 e $n2: ${n1 - n2}");
  print("Multiplicação de $n1 e $n2: ${n1 * n2}");
  print("Divisao de $n1 e $n2: ${n1 / n2}");
  print("Divisao inteira de $n1 e $n2: ${(n1 / n2).toInt()}");
  print("Resto de ${n1.toString() + " / " + n2.toString()}: ${n1 % n2}");
  print("Menor numero entre $n1 e $n2: ${min(n1, n2)}");
  print("Maior numero entre $n1 e $n2: ${max(n1, n2)}");
  print("Raiz quadrada de $n1 e $n2: ${sqrt(n1)} e ${sqrt(n2)}");
  print("O numero $n1 elevado a $n2: ${pow(n1, n2)}\n");

  print("\nDECIMAIS\n");
  print("Numeros decimais: $d1 e $d2");
  d1++;
  d2 += 1;
  print("Numeros decimais incrementados: $d1 e $d2");
  print(
      "Numeros decimais arredondados (para cima): ${d1.ceil()} e ${d2.ceil()}");
  print(
      "Numeros decimais arredondados (para baixo): ${d1.floor()} e ${d2.floor()}");
  print("Numeros decimais arredondados: ${d1.round()} e ${d2.round()}");
}
