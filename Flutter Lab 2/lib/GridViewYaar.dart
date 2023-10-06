
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// //Async and future are important keywords because we don't return data until it has been received and we don't know when it will be received
// Future <List<Users>> fetchUsers() async
// {
//   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
//   // print(response.body.toString());
//   if ((response.statusCode == 200))
//   {
//     List<dynamic> _parsedListJson = jsonDecode(response.body);
//     List<Users> _itemsList = List<Users>.from
//     (
//       _parsedListJson.map<Users>
//       (
//         (dynamic i) => Users.fromJson(i)
//       )
//     );
//     return _itemsList;
//   }
//   else
//   {
//     throw Exception('Failed to load users');
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() => runApp(const MyApp());

// class KoiBhiStatefulWidget extends StatefulWidget
// {
//   const KoiBhiStatefulWidget({super.key});

//   @override
//   State<KoiBhiStatefulWidget> createState() => _statefulWidgetKiState();
// }

// class _statefulWidgetKiState extends State<KoiBhiStatefulWidget>
// {
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold
//     (
//       appBar: AppBar
//       (
//         backgroundColor: Colors.red,
//       ),
//       body: Center
//       (
//         child: FutureBuilder<List<Users>>
//         (
//           future: fetchUsers(),
//           builder: (context, snapshot)
//           {
//             if (snapshot.hasData)
//             {
//               return ListView.builder
//               (
//                 itemCount: snapshot.data?.length,
//                 itemBuilder: (context, i)
//                 {
//                   var item = snapshot.data![i];
//                   // return Text(item.title);
//                   return Card
//                   (
//                     shape: RoundedRectangleBorder
//                     (
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     color: Colors.blue,
//                     child: ListTile
//                     (
//                       leading: const Icon
//                       (
//                         Icons.add_circle_outline_rounded,
//                         size: 50,
//                         color: Colors.white,
//                       ),
//                       title: Text
//                       (
//                         item.title,
//                         overflow: TextOverflow.visible,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle
//                         (
//                           color: Colors.white,
//                           fontSize: 20,
//                           overflow: TextOverflow.visible,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//             else if (snapshot.hasError)
//             {
//               return Text('${snapshot.error}');
//             }
//             else
//             {
//               return const CircularProgressIndicator();
//             }
//           }
//         )
//       ),
//     );
//   }

//   @override
//   void initState()
//   {
//     super.initState();
//     fetchUsers();
//   }
// }

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
    );
  }
}

Future<List<Users>> fetchUsersInGrid async
(
  final response = await (Uri.parse("https://jsonplaceholder.typicode.com/albums"));
)