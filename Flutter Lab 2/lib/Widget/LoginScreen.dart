import 'package:flutter/material.dart';

const GoogleBlue = Color.fromARGB(255, 66, 133, 244);
const GoogleRed = Color.fromARGB(255, 234, 67, 53);
const GoogleYellow = Color.fromARGB(255, 251, 188, 5);
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
        backgroundColor: GoogleBlue,
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
            ElevatedButton
            (
              style: ElevatedButton.styleFrom
              (
                backgroundColor: GoogleYellow,
                foregroundColor: GoogleRed,
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