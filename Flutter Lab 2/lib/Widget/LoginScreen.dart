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
        title: const Text("GDSC Pocket App"),
        backgroundColor: Color.fromARGB(255, 66, 133, 244),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}