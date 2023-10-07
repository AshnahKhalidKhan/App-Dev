import 'package:flutter/material.dart';
import 'package:flutter_quiz_mock_midterm/Widgets/Photos.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget
{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp
    (
      // home: Scaffold
      // (
      //   body: Center
      //   (
      //     child: Text('Hello World!'),
      //   ),
      // ),
      home: PhotosWidget(),
    );
  }
}
