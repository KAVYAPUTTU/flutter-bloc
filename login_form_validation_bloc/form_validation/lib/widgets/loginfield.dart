import 'package:flutter/material.dart';

class Loginfield extends StatelessWidget {
   final TextEditingController controller;
   final String hinttext;
  const Loginfield({super.key, required this.controller, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
              width: 250,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText:hinttext,
                  border:OutlineInputBorder()
                ),  
              ),
            );
  }
}