import 'package:flutter/material.dart';

class Gradientbutton extends StatelessWidget {
  final String buttontext;
  final VoidCallback ontap;
  const Gradientbutton({super.key, required this.buttontext, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 40,
            width: 250,
            child: ElevatedButton(onPressed:ontap, child:Text(buttontext)))
        ;
  }
}