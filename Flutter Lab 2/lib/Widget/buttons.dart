import 'package:flutter/material.dart';

class TypeButtons extends StatelessWidget {
  final String text;
  final Function onPressed;

  TypeButtons({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox
    (
      width: MediaQuery.sizeOf(context).width,
      child:
        ElevatedButton
        (
          onPressed: () {},
          child: Text(text),
        )
    )
    ;
  }
}
