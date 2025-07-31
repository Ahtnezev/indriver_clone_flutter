import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  final Function() onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry margin;

  const DefaultButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.margin = const EdgeInsets.only(bottom: 20, left: 40, right: 40),
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      // alignment: Alignment.center,
      margin: margin,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child:
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          ),
      ),
    );
  }
}
