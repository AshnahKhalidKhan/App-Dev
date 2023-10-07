import 'package:flutter/material.dart';
import 'package:flutter_quiz_mock_midterm/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Photos
{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photos
  (
    {
      required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl
    }
  );

  factory Photos.fromJson(Map<String, dynamic> json)
  {
    return Photos
    (
      albumId: json['albumId'], 
      id: json['id'], 
      title: json['title'], 
      url: json['url'], 
      thumbnailUrl: json['thumbnailUrl']
    );
  }
}

void main() => runApp(const MainApp());

class PhotosWidget extends StatefulWidget
{
  const PhotosWidget({super.key});

  @override
  State<PhotosWidget> createState() => _PhotosWidgetState();
}

class _PhotosWidgetState extends State<PhotosWidget>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.purple,
        title: Text('Quizzzzzzzzzzzzzzzzzz'),
      ),
      body: SafeArea
      (
        child: FutureBuilder
        (
          future: fetchPhotos(),
          builder: (context, snapashot)
          {
            if (snapashot.hasData)
            {
              return _buildingPhotosInList(snapashot.data!);
              // return _buildingPhotosInGrid(snapashot.data!);
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

Future<List<Photos>> fetchPhotos() async
{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if (response.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(response.body);
    List<Photos> _itemsList = List<Photos>.from
    (
      _parsedList.map<Photos>((dynamic i) => Photos.fromJson(i))
    );
    return _itemsList;
  }
  else
  {
    throw Exception('Nahin chal raha yaaarrrrrrrr');
  }
}

ListView _buildingPhotosInList(List<Photos> photos)
{
  return ListView.builder
  (
    itemCount: photos.length,
    itemBuilder: (context, i)
    {
      return ListTile
      (
        leading: CircleAvatar
        (
          backgroundColor: Colors.black, 
          child: Image.network
          (
            photos[i].url
          )
        ),
        title: Text(photos[i].title),
        onTap: ()
        {
          // print('Heyyyyy');
          // print('Heyyyyy');
          showModalBottomSheet<void>
          (
            context: context,
            builder: (BuildContext context)
            {
              return SizedBox
              (
                width: double.maxFinite,
                child: Wrap
                (
                  children:
                  [
                    Padding
                    (
                      padding: EdgeInsets.all(20.0),
                      child: Column
                      (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text(photos[i].title),
                        ]
                      )
                    )
                  ]
                )
              );
            }
          );
        },
      );
    }
  );
}

GridView _buildingPhotosInGrid(List<Photos> photos)
{
  return GridView.builder
  (
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
    (
      crossAxisCount: 2
    ),
    itemBuilder: (context, i)
    {
      return GridTile
      (
        child: GestureDetector
        (
          child: Wrap
          (
            children: <Widget>
            [
              Column
              (
                children:
                [
                  Image.network(photos[i].url),
                  Text(photos[i].title),
                ]
              ),
            ]
          ),
          onTap: ()
          {
            // print('Heyyyyy');
            showModalBottomSheet<void>
            (
              context: context,
              builder: (BuildContext context)
              {
                return SizedBox
                (
                  width: double.maxFinite,
                  child: Wrap
                  (
                    children:
                    [
                      Padding
                      (
                        padding: EdgeInsets.all(20.0),
                        child: Column
                        (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>
                          [
                            Text(photos[i].title),
                          ]
                        )
                      )
                    ]
                  )
                );
              }
            );
          },
        ),
      );
    },
  );
}