import 'package:flutter/material.dart';

const greenButtonColor = Color.fromARGB(255, 22, 219, 108);
const greenButtonColorOnHover = Color.fromARGB(255, 14, 91, 47);

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
        padding: const EdgeInsets.all(10.0),
        child: Column
        (
          children:
          [
            SizedBox
            (
              width: MediaQuery.sizeOf(context).width / 1.5,
              // height: MediaQuery.sizeOf(context).height / 8,
              child: RichText
              (
                text: TextSpan
                (
                  text: "Numrah\n— a numeric keypad for Namrah baji",
                  style: DefaultTextStyle.of(context).style,
                ),
              ),
            ),
            Expanded
            (
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
          ]
        )
      ),
    );
  }
}

Widget _keypadThreeRowButtons(int n1, int n2, int n3)
{
  return Padding
  (
    padding: const EdgeInsets.all(8.0),
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
            elevation: 8,
            hoverColor: greenButtonColorOnHover,
            backgroundColor: greenButtonColor,
            child: Text(n1.toString()),
          ),
        ),
        SizedBox
        (
          width: 100,
          height: 100,
          child: FloatingActionButton
          (
            onPressed: () {},
            elevation: 8,
            hoverColor: greenButtonColorOnHover,
            backgroundColor: greenButtonColor,
            child: Text(n2.toString()),
          ),
        ),
        SizedBox
        (
          width: 100,
          height: 100,
          child: FloatingActionButton
          (
            onPressed: () {},
            elevation: 8,
            hoverColor: greenButtonColorOnHover,
            backgroundColor: greenButtonColor,
            child: Text(n3.toString()),
          ),
        ), 
      ],
    ),
  );
}