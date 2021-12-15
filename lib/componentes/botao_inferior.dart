import 'package:flutter/material.dart';
import '../constantes.dart';

class BotaoInferior extends StatelessWidget {
  const BotaoInferior(
      {Key? key, required this.aoPressionar, required this.tituloBotao})
      : super(key: key);
  final Function aoPressionar;
  final String tituloBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar as void Function()?,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20),
        color: kCorBottomBar,
        width: double.infinity,
        height: kAlturaBottomBar,
        child: GestureDetector(
          child: Text(
            tituloBotao,
            style: kBotaoTextStyle,
          ),
        ),
      ),
    );
  }
}