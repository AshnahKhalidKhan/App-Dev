import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget
{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        leading: const Icon(Icons.add),
        title: const Text("GDSC Pocket App"),
        backgroundColor: Color.fromARGB(255, 66, 133, 244),
        titleTextStyle: const TextStyle
        (
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: const Padding
      (
        padding: EdgeInsets.all(10.0),
        child: Column
        (
          children:
          [
            TextField
            (
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}