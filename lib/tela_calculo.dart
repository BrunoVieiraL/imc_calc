import 'package:flutter/material.dart';
import 'package:imccalc_flutter/constantes.dart';
import 'package:imccalc_flutter/cria_container.dart';
import 'tela_principal.dart';

class TelaCalculo extends StatelessWidget {
  const TelaCalculo({Key key}) : super(key: key);

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
                children: const [
                  Text(
                    'data',
                    style: kResultadoTextStyle,
                  ),
                  Text(
                    'data',
                    style: kIMCTextStyle,
                  ),
                  Text(
                    'data',
                    textAlign: TextAlign.center,
                    style: kCorpoTextStyle,
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
