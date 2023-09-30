import 'package:flutter/material.dart';

const GoogleBlue = Color.fromARGB(255, 52, 168, 83);
const GoogleRed = Color.fromARGB(255, 52, 168, 83);
const GoogleYellow = Color.fromARGB(255, 52, 168, 83);
const GoogleGreen = Color.fromARGB(255, 52, 168, 83);

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
      body: Padding
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
            ElevatedButton
            (
              style: ButtonStyle
              (
                backgroundColor: const Color.fromARGB(255, 52, 168, 83),
              ),
              onPressed: () {},
              child: TextField
              (
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}