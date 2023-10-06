// Mid mein UI, API integration, widget
// Tomorrow quiz and class activity
// Codelabs is in quiz tomorrow
import 'package:flutter/material.dart';


class CodeLab1 extends StatefulWidget
{
  const CodeLab1({Key? key}) : super(key: key);

  @override
  _CodeLab1State createState() => _CodeLab1State();
}

class _CodeLab1State extends State<CodeLab1> 
{
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool showPassword = false;
  @override 
  void initState()
  { 
    super.initState(); 
    showPassword = true; 
  } 

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: SafeArea
      (
        child: ListView // We use ListView here and not Column because Column does not handle scrolling and we want that because we will open keyboard to type in this field
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
              controller: _usernameController,
              decoration: const InputDecoration
              (
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField
            (
              controller: _passwordController,
              obscureText: showPassword,
              decoration: InputDecoration
              (
                filled: true,
                labelText: 'Password',
                suffixIcon: IconButton
                ( 
                  icon: Icon
                  (
                    showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: ()
                  {
                    setState
                    (()
                      {
                        showPassword = !showPassword;
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            OverflowBar
            (
              alignment: MainAxisAlignment.center,
              overflowDirection: VerticalDirection.down,
              children:
              [
                Column
                (
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: <Widget>
                  [
                    ElevatedButton
                    (
                      onPressed: ()
                      {
                        _passwordController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('NEXT'),
                    ),
                    TextButton
                    (
                      onPressed: ()
                      {
                        _usernameController.clear();
                      },
                      child: const Text('CANCEL'),
                    ),
                  ],
                ),
              ]
            ),
          ]
        ),
      ),
    );
  }
}