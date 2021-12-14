import 'package:flutter/material.dart';

class CriaContainer extends StatelessWidget {
  const CriaContainer({Key key, @required this.cor, this.filhoCartao, this.aoPressionar})
      : super(key: key);

  final Widget filhoCartao;
  final Color cor;
  final Function aoPressionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        child: filhoCartao,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cor,
        ),
      ),
    );
  }
}