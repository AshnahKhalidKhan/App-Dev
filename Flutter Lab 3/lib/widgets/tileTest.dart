import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Ignore this

Future<List<TileData>> fetchTileData() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));

  if (response.statusCode == 200) {
    List<dynamic> _parsedListJson = jsonDecode(response.body);
    List<TileData> _itemList = List<TileData>.from(
        _parsedListJson.map<TileData>((dynamic i) => TileData.fromJson(i)));
    // print(_itemList);
    return _itemList;
  } else {
    throw Exception('Failed to load album');
  }
}

class tilet extends StatefulWidget {
  const tilet({super.key});

  @override
  State<tilet> createState() => _tilesState();
}

class _tilesState extends State<tilet> {
  final List<TileData> tileDataList = List<TileData>.generate(
    20,
    (index) => TileData(
      image: 'assets/636600.png',
      title: 'Title $index',
      subtitle: 'Subtitle $index',
    ),
  );

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
      body: Center(
        child: FutureBuilder<List<TileData>>(
          future: fetchTileData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot);
              return GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16.0),
                  childAspectRatio: 8.0 / 9.0,
                  children: _hello(snapshot.data!));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

List<Card> _buildGridCards(int count) {
  List<Card> cards = List.generate(
    count,
    (int index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset('assets/636600.png'),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Title'),
                  SizedBox(height: 8.0),
                  Text('Secondary Text'),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
  return cards;
}

class TileData {
  final String image;
  final String title;
  final String subtitle;

  TileData({required this.image, required this.title, required this.subtitle});
  factory TileData.fromJson(Map<String, dynamic> json) {
    return TileData(
        title: json['title'], subtitle: "Hello", image: 'assets/636600.png');
  }
}

List<GridTile> _hello(List<TileData> itemList) {
  return itemList.map((tileData) {
    return GridTile(
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset(tileData.image),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(tileData.title),
                    SizedBox(height: 8.0),
                    Text(tileData.subtitle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }).toList();
}
