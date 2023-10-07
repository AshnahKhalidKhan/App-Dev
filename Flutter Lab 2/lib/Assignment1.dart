// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:http/http.dart' as http;

// //Async and future are important keywords because we don't return data until it has been received and we don't know when it will be received
// // Future <List<Comments>> fetchComments() async
// // {
// //   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
// //   // print(response.body.toString());
// //   if ((response.statusCode == 200))
// //   {
// //     List<dynamic> _parsedListJson = jsonDecode(response.body);
// //     List<Comments> _itemsList = List<Comments>.from
// //     (
// //       _parsedListJson.map<Comments>
// //       (
// //         (dynamic i) => Comments.fromJson(i)
// //       )
// //     );
// //     return _itemsList;
// //   }
// //   else
// //   {
// //     throw Exception('Failed to load Comments');
// //   }
// // }

// // //Json Model Class
// // class Comments
// // {
// //   final int userId;
// //   final int id;
// //   final String title;

// //   const Comments
// //   (
// //     {
// //       required this.userId,
// //       required this.id,
// //       required this.title
// //     }
// //   );

// //   //Whatever API reposonse you get,
// //   factory Comments.fromJson(Map<String, dynamic> json)
// //   {
// //     return Comments
// //     (
// //       userId: json['userId'],
// //       id: json['id'],
// //       title: json['title']
// //     );
// //   }
// // }

// // void main() => runApp(const MyApp());

// // class KoiBhiStatefulWidget extends StatefulWidget
// // {
// //   const KoiBhiStatefulWidget({super.key});

// //   @override
// //   State<KoiBhiStatefulWidget> createState() => _statefulWidgetKiState();
// // }

// // class _statefulWidgetKiState extends State<KoiBhiStatefulWidget>
// // {
// //   @override
// //   Widget build(BuildContext context)
// //   {
// //     return Scaffold
// //     (
// //       appBar: AppBar
// //       (
// //         backgroundColor: Colors.red,
// //       ),
// //       body: Center
// //       (
// //         child: FutureBuilder<List<Comments>>
// //         (
// //           future: fetchComments(),
// //           builder: (context, snapshot)
// //           {
// //             if (snapshot.hasData)
// //             {
// //               return ListView.builder
// //               (
// //                 itemCount: snapshot.data?.length,
// //                 itemBuilder: (context, i)
// //                 {
// //                   var item = snapshot.data![i];
// //                   // return Text(item.title);
// //                   return Card
// //                   (
// //                     shape: RoundedRectangleBorder
// //                     (
// //                       borderRadius: BorderRadius.circular(8.0),
// //                     ),
// //                     color: Colors.blue,
// //                     child: ListTile
// //                     (
// //                       leading: const Icon
// //                       (
// //                         Icons.add_circle_outline_rounded,
// //                         size: 50,
// //                         color: Colors.white,
// //                       ),
// //                       title: Text
// //                       (
// //                         item.title,
// //                         overflow: TextOverflow.visible,
// //                         textAlign: TextAlign.center,
// //                         style: const TextStyle
// //                         (
// //                           color: Colors.white,
// //                           fontSize: 20,
// //                           overflow: TextOverflow.visible,
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               );
// //             }
// //             else if (snapshot.hasError)
// //             {
// //               return Text('${snapshot.error}');
// //             }
// //             else
// //             {
// //               return const CircularProgressIndicator();
// //             }
// //           }
// //         )
// //       ),
// //     );
// //   }

// //   @override
// //   void initState()
// //   {
// //     super.initState();
// //     fetchComments();
// //   }
// // }

// class Comments
// {
//   // "postId": 1,
//   //       "id": 1,
//   //       "name": "id labore ex et quam laborum",
//   //       "email": "Eliseo@gardner.biz",
//   //       "body":
//   final int postId;
//   final int id;
//   final String name;
//   final String email;
//   final String body;

//   const Comments
//   {
//     {
//       required this.postId,
//       required this.id,
//       required this.name,
//       required this.email,
//       required this.body
//     }

//     factory Comments.fromJson(Map<String, dynamic> json)
//     {
//       return Comments
//       (
//         postId: json['postId'],
//         id: json['id'],
//         name: json['name'],
//         email: json['email'],
//         body: json['body']
//       );
//     }
//   }
// }

// void main() => runApp(const MyApp());

// class Assignment1KiStatefulWidget extends StatefulWidget
// {
//   const Assignment1KiStatefulWidget({super.key});

//   @override
//   State<Assignment1KiStatefulWidget> createState() => _Assignment1KiStatefulWidgetState();
// }

// class _Assignment1KiStatefulWidgetState extends State<Assignment1KiStatefulWidget>
// {
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold
//     (
//       appBar: AppBar
//       (
//         backgroundColor: Colors.blue,
//       ),
//       body: Center
//       (
//         child: FutureBuilder<List<Comments>>
//         (
//           future: fetchComments(),
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
//                         item.body,
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
// }

// //Async and future are important keywords because we don't return data until it has been received and we don't know when it will be received
// Future <List<Comments>> fetchComments() async
// {
//   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
//   if ((response.statusCode == 200))
//   {
//     List<dynamic> _parsedListJson = jsonDecode(response.body);
//     List<Comments> _itemsList = List<Comments>.from
//     (
//       _parsedListJson.map<Comments>
//       (
//         (dynamic i) => Comments.fromJson(i)
//       )
//     );
//     return _itemsList;
//   }
//   else
//   {
//     throw Exception('Failed to load Comments');
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
// import 'dart:convert';
import 'package:http/http.dart' as http;

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

class Assignment1 extends StatefulWidget
{
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.blue,
        title: const Text("Assignment 1"),
      ),
    );
  }
}

Future<List<Comments>> fetchComments() async
{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com//comments'));
  if (response.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(response.body);
    List<Comments> _itemsList = List<Comments>.from
    (
      _parsedList.map<Comments>((dynamic i) => Comments.fromJson(i))
    );
    return _itemsList;
  }
  else
  {
    throw Exception('API nahin connect hui');
  }
}