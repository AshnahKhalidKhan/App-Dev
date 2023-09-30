import 'package:flutter/material.dart';

const greenButtonColor = Color.fromARGB(255, 22, 219, 108);
const greenButtonColorOnHover = Color.fromARGB(255, 14, 91, 47);
const blackTextColor = Color.fromARGB(255, 62, 58, 58);

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
            Padding
            (
              padding: const EdgeInsets.only(top: 20.0, bottom: 40),
              child: SizedBox
              (
                width: MediaQuery.sizeOf(context).width,
                // height: MediaQuery.sizeOf(context).height / 8,
                child: RichText
                (
                  textAlign: TextAlign.center,
                  text: const TextSpan
                  (
                    text: "\"Num-rah\"",
                    style: TextStyle
                    (
                      fontSize: 40,
                      color: greenButtonColor,
                    ),
                    children:
                    [
                      TextSpan
                      (
                        text: "\n— a numeric keypad for Namrah baji",
                        style: TextStyle
                        (
                          fontSize: 20,
                          color: greenButtonColorOnHover,
                        ),
                      ),
                    ],
                  ),
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
            SizedBox
            (
              width: 100,
              height: 100,
              child: FloatingActionButton
              (
                onPressed: ()
                {
                  print("0\n");
                },
                elevation: 8,
                hoverColor: greenButtonColorOnHover,
                backgroundColor: greenButtonColor,
                child: RichText
                (
                  textAlign: TextAlign.center,
                  text: const TextSpan
                  (
                    text: "0",
                    style: TextStyle
                    (
                      fontSize: 50,
                      color: greenButtonColorOnHover,
                    ),
                  ),
                ),
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
            onPressed: ()
            {
              print(n1.toString() + "\n");
            },
            elevation: 8,
            hoverColor: greenButtonColorOnHover,
            backgroundColor: greenButtonColor,
            child: RichText
            (
              textAlign: TextAlign.center,
              text: TextSpan
              (
                text: n1.toString(),
                style: const TextStyle
                (
                  fontSize: 50,
                  color: greenButtonColorOnHover,
                ),
              ),
            ),
          ),
        ), 
        SizedBox
        (
          width: 100,
          height: 100,
          child: FloatingActionButton
          (
            onPressed: ()
            {
              print(n2.toString() + "\n");
            },
            elevation: 8,
            hoverColor: greenButtonColorOnHover,
            backgroundColor: greenButtonColor,
            child: RichText
            (
              textAlign: TextAlign.center,
              text: TextSpan
              (
                text: n2.toString(),
                style: const TextStyle
                (
                  fontSize: 50,
                  color: greenButtonColorOnHover,
                ),
              ),
            ),
          ),
        ),
        SizedBox
        (
          width: 100,
          height: 100,
          child: FloatingActionButton
          (
            onPressed: ()
            {
              print(n3.toString() + "\n");
            },
            elevation: 8,
            hoverColor: Colors.black,
            backgroundColor: greenButtonColor,
            child: RichText
            (
              textAlign: TextAlign.center,
              text: TextSpan
              (
                text: n3.toString(),
                style: const TextStyle
                (
                  fontSize: 50,
                  color: greenButtonColorOnHover,
                ),
              ),
            ),
          ),
        ),  
      ],
    ),
  );
}