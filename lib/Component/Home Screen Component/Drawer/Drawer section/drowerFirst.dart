import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class drowerFirst extends StatelessWidget {
  const drowerFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,


            ),
            child: FaIcon(FontAwesomeIcons.person),
          )
        ],
      ),

    );
  }
}
