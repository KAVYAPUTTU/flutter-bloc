import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Socialbuttons extends StatelessWidget {
  final String label;
  final Widget iconpath;
  const Socialbuttons({super.key, required this.label, required this.iconpath});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 1)
            ),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon:iconpath ),
                Text(label)
              ],
            ),
          ) ;
  }
}