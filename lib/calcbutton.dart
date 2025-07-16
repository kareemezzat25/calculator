import 'package:flutter/material.dart';

class Calcbutton extends StatelessWidget {
  String title;
  Color colorButton;
  Color colorTitle;
  Function onclick;
  Calcbutton(
      {super.key,
      required this.title,
      required this.colorButton,
      required this.colorTitle,
      required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: colorButton,
                foregroundColor: colorTitle,
                padding: const EdgeInsets.all(22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            onPressed: () {
              onclick(title);
            },
            child: Text(title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
