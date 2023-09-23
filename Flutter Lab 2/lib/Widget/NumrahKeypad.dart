import 'package:flutter/material.dart';

class NumrahKeypad extends StatelessWidget
{
  const NumrahKeypad({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Color.fromARGB(255, 22, 219, 108),
        title: const Text("NUM-RAH"),
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(2.0),
        child: ListView.builder
        (
          itemCount: 3,
          itemBuilder: (BuildContext context, int i)
          {
            return _keypadThreeRowButtons((2*i + (i + 1)), (2*i + (i + 2)), (2*i + (i + 3)));
            // 1 2 3 i = 0
            // 4 5 6 i = 1
            // 7 8 9 i = 2
          },
        ),
      ),
    );
  }
}

Widget _keypadThreeRowButtons(int n1, int n2, int n3)
{
  return Padding
  (
    padding:EdgeInsets.all(20.0),
    child: Row
    (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
      [
        SizedBox
        (
          width: 100,
          height: 100,
          child: FloatingActionButton
          (
            onPressed: () {},
            child: Text(n1.toString()),
            elevation: 8,
            hoverColor: Color.fromARGB(255, 14, 91, 47),
            backgroundColor: Color.fromARGB(255, 22, 219, 108),
          ),
        ),
        SizedBox
        (
          width: 100,
          height: 100,
          child: FloatingActionButton
          (
            onPressed: () {},
            child: Text(n2.toString()),
            elevation: 8,
            hoverColor: Color.fromARGB(255, 14, 91, 47),
            backgroundColor: Color.fromARGB(255, 22, 219, 108),
          ),
        ),
        SizedBox
        (
          width: 100,
          height: 100,
          child: FloatingActionButton
          (
            onPressed: () {},
            child: Text(n3.toString()),
            elevation: 8,
            hoverColor: Color.fromARGB(255, 14, 91, 47),
            backgroundColor: Color.fromARGB(255, 22, 219, 108),
          ),
        ), 
      ],
    ),
  );
}