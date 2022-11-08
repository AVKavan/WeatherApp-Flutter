import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String value;
  final String textType;
  final IconData icon;

  ReusableCard(
      {required this.value, required this.textType, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$value',
          style: TextStyle(
            fontSize: 20,
            fontFamily: "PoppinsLight",
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '$textType',
          style: TextStyle(
            fontSize: 20,
            fontFamily: "PoppinsLight",
          ),
        ),
        Icon(icon)
      ],
    );
  }
}
