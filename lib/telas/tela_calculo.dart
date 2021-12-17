import 'package:flutter/material.dart';
import '../componentes/botao_inferior.dart';
import 'package:imccalc_flutter/constantes.dart';
import '../componentes/cria_container.dart';

class TelaCalculo extends StatelessWidget {
  const TelaCalculo({
    Key? key,
    required this.resultadoIMC,
    required this.resultadoTexto,
    required this.feedback,
  }) : super(key: key);

  final String resultadoIMC;
  final String resultadoTexto;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CALCULADORA IMC",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded( 
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomCenter,
              child: const Text(
                'Resultado',
                style: kTituloTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CriaContainer(
              cor: kCorContainerAtivo,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultadoTexto.toUpperCase(),
                    style: kResultadoTextStyle,
                  ),
                  Text(
                    resultadoIMC,
                    style: kIMCTextStyle,
                  ),
                  Text(
                    feedback,
                    textAlign: TextAlign.center,
                    style: kCorpoTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BotaoInferior(
              aoPressionar: () {
                Navigator.pop(context);
              },
              tituloBotao: "RECALCULAR")
        ],
      ),
    );
  }
}
