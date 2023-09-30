
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:http/http.dart' as http;

//Async and future are important keywords because we don't return data until it has been received and we don't know when it will be received
Future <List<Users>> fetchUsers() async
{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  // print(response.body.toString());
  if ((response.statusCode == 200))
  {
    List<dynamic> _parsedListJson = jsonDecode(response.body);
    List<Users> _itemsList = List<Users>.from
    (
      _parsedListJson.map<Users>
      (
        (dynamic i) => Users.fromJson(i)
      )
    );
    return _itemsList;
  }
  else
  {
    throw Exception('Failed to load users');
  }
}

//Json Model Class
class Users
{
  final int userId;
  final int id;
  final String title;

  const Users
  (
    {
      required this.userId,
      required this.id,
      required this.title
    }
  );

  //Whatever API reposonse you get, 
  factory Users.fromJson(Map<String, dynamic> json)
  {
    return Users
    (
      userId: json['userId'],
      id: json['id'],
      title: json['title']
    );
  }
}

void main() => runApp(const MyApp());

class KoiBhiStatefulWidget extends StatefulWidget
{
  const KoiBhiStatefulWidget({super.key});

  @override
  State<KoiBhiStatefulWidget> createState() => _statefulWidgetKiState();
}

class _statefulWidgetKiState extends State<KoiBhiStatefulWidget>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.red,
      ),
      body: Center
      (
        child: FutureBuilder<List<Users>>
        (
          future: futureUsers,
          builder: (context, snapshot)
          {
            if (snapshot.hasData)
            {
              return ListView.builder(itemBuilder: itemBuilder);
            }
            else if (snapshot.hasError)
            {

            }
          }
        )
      ),
    );
  }

  @override
  void initState()
  {
    super.initState();
    fetchUsers();
  }
}