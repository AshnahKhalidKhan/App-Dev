import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Comments
{
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comments
  (
    {
      required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body
    }
  );

  factory Comments.fromJson(Map<String, dynamic> json)
  {
    return Comments
    (
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body']
    );
  }
}

void main() => runApp(const MyApp());

class Assignment1UsingGridInFunction extends StatefulWidget
{
  const Assignment1UsingGridInFunction({super.key});

  @override
  State<Assignment1UsingGridInFunction> createState() => _Assignment1UsingGridInFunctionState();
}

class _Assignment1UsingGridInFunctionState extends State<Assignment1UsingGridInFunction>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.blue,
        title: const Text("Assignment 1 With Grid In Function"),
      ),
      body: Center
      (
        child: FutureBuilder
        (
          future: fetchComments(),
          builder: (context, snapashot)
          {
            if (snapashot.hasData)
            {
              return _buildingGridUsingComments(snapashot.data!);
            }
            else if (snapashot.hasError)
            {
              return Text('$snapashot.error');
            }
            else
            {
              return CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }
}

Future<List<Comments>> fetchComments() async
{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  if (response.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(response.body);
    List<Comments> _itemsList = List<Comments>.from
    (
      _parsedList.map<Comments>((dynamic i) => Comments.fromJson(i))
    );
    // print(_itemsList.toString());
    return _itemsList;
  }
  else
  {
    throw Exception('API nahin connect hui');
  }
}


GridView _buildingGridUsingComments(List<Comments> comment)
{
  return GridView.builder
  (
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemCount: comment.length,
    itemBuilder: (context, int i)
    {
      return GridTile
      (
        child: Card
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>
            [
              Container
              (
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: const BoxDecoration
                (
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Text
                (
                  comment[i].id.toString()
                ),
              ),
              Text
              (
                comment[i].name,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
  );
}