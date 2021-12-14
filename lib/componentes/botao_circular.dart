import 'package:flutter/material.dart';

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
