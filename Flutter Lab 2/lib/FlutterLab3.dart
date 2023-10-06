// Mid mein UI, API integration, widget
// Tomorrow quiz and class activity
// Codelabs is in quiz tomorrow


import 'package:flutter/material.dart';

class CodeLab1 extends StatelessWidget
{
  const CodeLab1({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: SafeArea
      (
        child: ListView
        (
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>
          [
            const SizedBox(height: 80.0),
            Column
            (
              children: <Widget>
              [
                Image.asset
                (
                  'android/assets/unnamed.png',
                  width: 50.0,
                  height: 50.0,
                ),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ]
            ),
            const SizedBox(height: 120.0),
            TextField
            (
              decoration: const InputDecoration
              (
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField
            (
              decoration: const InputDecoration
              (
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
          ]
        ),
      ),
    );
  }
}