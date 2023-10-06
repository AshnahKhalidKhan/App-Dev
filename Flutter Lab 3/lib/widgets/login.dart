import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool _pwd = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SHRINE'),
          leading: IconButton(
              onPressed: () {
                print('menu button');
              },
              icon: const Icon(
                Icons.menu,
                semanticLabel: 'menu',
              )),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print('Search button');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
              onPressed: () {
                print('Filter button');
              },
            ),
          ],
        ),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/636600.png'),
                const SizedBox(
                  height: 16.0,
                ),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(
              height: 120.0,
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: "Username",
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              obscureText: _pwd,
              controller: _passwordController,
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_pwd ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          _pwd = !_pwd;
                        },
                      );
                    },
                  )),
              enableSuggestions: false,
            ),
            const SizedBox(height: 12.0),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                  },
                ),
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    _passwordController.clear();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        )));
  }
}
