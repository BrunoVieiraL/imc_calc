import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'genero_cartao.dart';
import 'cria_container.dart';
import 'constantes.dart';

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
  double altura = 160;
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
                      setState(() {
                        sexoSelecionado = Genero.masculino;
                      });
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
                      setState(() {
                        sexoSelecionado = Genero.feminino;
                      });
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
                    value: altura,
                    onChanged: (novoValor) {
                      setState(() {
                        altura = novoValor;
                      });
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
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            BotaoCircular(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  peso++;
                                });
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
                                setState(() {
                                  idade--;
                                });
                              },
                            ),
                            BotaoCircular(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  idade++;
                                });
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'telaCalculo',
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(bottom: 20),
              color: kCorBottomBar,
              width: double.infinity,
              height: kAlturaBottomBar,
              child: GestureDetector(
                child: const Text(
                  "Calcular",
                  style: kBotaoTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BotaoCircular extends StatelessWidget {
  const BotaoCircular(
      {Key key, @required this.icone, @required this.aoPressionar})
      : super(key: key);
  final IconData icone;
  final Function aoPressionar;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: const Color(0xFF7E7E7E),
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      elevation: 6,
      onPressed: aoPressionar,
      child: Icon(icone),
    );
  }
}
