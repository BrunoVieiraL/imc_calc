import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imccalc_flutter/telas/tela_calculo.dart';
import '../componentes/genero_cartao.dart';
import '../componentes/cria_container.dart';
import '../constantes.dart';
import '../componentes/botao_inferior.dart';
import '../componentes/botao_circular.dart';
import '../calculadora_imc.dart';

enum Genero {
  masculino,
  feminino,
}

//double imc = peso/(altura*altura);
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Genero sexoSelecionado;
  int altura = 160;
  int peso = 60;
  int idade = 25;

  void imcCalculo() {
    if (sexoSelecionado == Genero.masculino) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CALCULADORA IMC',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CriaContainer(
                    aoPressionar: () {
                      setState(
                        () {
                          sexoSelecionado = Genero.masculino;
                        },
                      );
                    },
                    cor: sexoSelecionado == Genero.masculino
                        ? kCorContainerAtivo
                        : kCorContainerInativo,
                    filhoCartao: const GeneroCartao(
                        genero: "Masculino",
                        iconeGenero: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: CriaContainer(
                    aoPressionar: () {
                      setState(
                        () {
                          sexoSelecionado = Genero.feminino;
                        },
                      );
                    },
                    cor: sexoSelecionado == Genero.feminino
                        ? kCorContainerAtivo
                        : kCorContainerInativo,
                    filhoCartao: const GeneroCartao(
                        genero: "Feminino",
                        iconeGenero: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CriaContainer(
              cor: kCorContainerAtivo,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ALTURA",
                    style: kDescricaoTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.round().toString(),
                        style: kNumeroStyle,
                      ),
                      const Text(
                        "cm",
                        style: kDescricaoTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    activeColor: const Color(0xFFFF5822),
                    inactiveColor: const Color(0xFF8D8E98),
                    value: altura.toDouble(),
                    onChanged: (novoValor) {
                      setState(
                        () {
                          altura = novoValor.round();
                        },
                      );
                    },
                    min: 0,
                    max: 230,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CriaContainer(
                    cor: kCorContainerAtivo,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'PESO',
                          style: kDescricaoTextStyle,
                        ),
                        Text(
                          peso.toString(),
                          style: kNumeroStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BotaoCircular(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(
                                  () {
                                    peso--;
                                  },
                                );
                              },
                            ),
                            BotaoCircular(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(
                                  () {
                                    peso++;
                                  },
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CriaContainer(
                    cor: kCorContainerAtivo,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'IDADE',
                          style: kDescricaoTextStyle,
                        ),
                        Text(
                          idade.toString(),
                          style: kNumeroStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BotaoCircular(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(
                                  () {
                                    idade--;
                                  },
                                );
                              },
                            ),
                            BotaoCircular(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(
                                  () {
                                    idade++;
                                  },
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            tituloBotao: 'CALCULAR',
            aoPressionar: () {
              CalculadoraIMC calc = CalculadoraIMC(
                altura: altura,
                peso: peso,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaCalculo(
                    feedback: calc.informarFeedback(),
                    resultadoIMC: calc.calcularIMC(),
                    resultadoTexto: calc.obterResultado(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
