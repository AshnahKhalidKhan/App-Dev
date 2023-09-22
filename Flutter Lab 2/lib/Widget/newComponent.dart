import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NewWidgetName extends StatelessWidget {
  const NewWidgetName({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Padding
      (
        padding: EdgeInsets.all(8.0),
        child: Column(
          children:
          [
            SizedBox
            (
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton
              (
                onPressed: () {},
                child: const Text("buttton ka text")
              ),
            ),
            SizedBox
            (
              width: MediaQuery.sizeOf(context).width,
              child: FilledButton
              (
                onPressed: ()
                {
                  print("FilledButtonButton is running");
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: const Text("Filled Button only"),
              ),
            ),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                SizedBox
                (
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  child: FilledButton.tonal
                  (
                    onPressed: () {},
                    child: const Text('Filled Button Tonal'),
                  ),
                ),
                SizedBox
                (
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  child: FilledButton.icon
                  (
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text("Filled Button Icon"),
                  ),
                ),
              ]
            ),
            TextButton
            (
              onPressed: () {},
              child: const Text("Text"),
            ),
            // Text
            // (
            //   String: Text.("Text ka string"),
            //   child: GestureDetector
            //   (
            //     onTap: ()
            //     {
            //       print("Print on the console");
            //     }
            //   ),
            // ),
          ]
        ),
      )
    );
  }
}
