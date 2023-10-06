
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

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

class YeAikStatefulWidgetHai extends StatefulWidget
{
  const YeAikStatefulWidgetHai({super.key});

  @override
  State<YeAikStatefulWidgetHai> createState() => _YeAikStatefulWidgetHaiState();
}

class _YeAikStatefulWidgetHaiState extends State<YeAikStatefulWidgetHai>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Aik Aakhri Koshish"),
        backgroundColor: Colors.grey,
        leading: const Icon(Icons.menu_book_rounded),
      ),
      body: SafeArea
      (
        child: FutureBuilder<List<Users>>
        (
          future: fetchUsers(),
          builder: (context, snapshot)
          {
            if (snapshot.hasData)
            {
              return GridView.builder
              (
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i)
                {
                  return GridTile
                  (
                    child: Card
                    (
                      child: Column
                      (
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>
                        [
                          Text(snapshot.data![i].userId.toString(), textAlign: TextAlign.center),
                          Text(snapshot.data![i].id.toString(), textAlign: TextAlign.center),
                          Text(snapshot.data![i].title, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  );
                }
              );
            }
            else if (snapshot.hasError)
            {
              return Text('${snapshot.error}');
            }
            else
            {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Future<List<Users>> fetchUsers() async
{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(response.body);
    List<Users> _itemsList = List<Users>.from
    (
      _parsedList.map<Users>
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

GridView fetchUsersInGrid(List<Users> data)
{
  return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2));
}