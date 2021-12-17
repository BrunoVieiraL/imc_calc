class CalculadoraIMC {
  CalculadoraIMC({required this.peso, required this.altura, required this.imc});

  final int peso;
  final int altura;
  final double imc;

  String obterResultado() {
    if (imc >= 25) {
      return 'Acima do Peso';
    } else if (imc > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String informarFeedback() {
    if (imc >= 25) {
      return 'Você deve se cuidar melhor, mude a alimentação e faça exercícios';
    } else if (imc > 18.5) {
      return 'Exelente! Continue se cuidando';
    } else {
      return 'Tente aumentar sua alimentação';
    }
  }
}
