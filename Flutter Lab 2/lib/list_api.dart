import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

//Json Model Class
// Future<List<Users>> fetchAlbum() async
// {
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
// }

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
    );
  }
}