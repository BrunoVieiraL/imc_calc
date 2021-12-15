import 'package:flutter/material.dart';
import 'package:imccalc_flutter/constantes.dart';

class GeneroCartao extends StatelessWidget {
  const GeneroCartao({
    Key? key,
    required this.genero,
    required this.iconeGenero,
  }) : super(key: key);

  final String genero;
  final IconData iconeGenero;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconeGenero,
          size: 95.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(genero, style: kDescricaoTextStyle,),
        
      ],
    );
  }
}