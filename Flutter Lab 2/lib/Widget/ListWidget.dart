import 'package:flutter/material.dart';

var _data =
[
  TileDataModel(subTitle: "subTitle1", title: "title"),
  TileDataModel(subTitle: "subTitle2", title: "title"),
  TileDataModel(subTitle: "subTitle3", title: "title")
];

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int i) {
            var obj = _data[i];
            return _item(obj);
          },
          // child: Card
          // (
          //   child: ListTile
          //   (
          //     leading: Icon(Icons.person),
          //     title: Text("Title ka text"),
          //     subtitle: Text("Subtitle ka text"),
          //     trailing: Wrap
          //     (
          //       children: <Widget>
          //       [
          //         Icon(Icons.notification_add),
          //         Icon(Icons.notification_add),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}

Widget _item(TileDataModel obj) {
  return Card(
    child: ListTile(
      leading: const Icon(Icons.person),
      title: Text(obj.title),
      subtitle: Text(obj.subTitle),
      trailing: const Wrap(
        children: <Widget>[
          Icon(Icons.notification_add),
          Icon(Icons.notification_add),
        ],
      ),
    ),
  );
}

class TileDataModel
{
  TileDataModel({required this.subTitle, required this.title});

  final String title;
  final String subTitle;
}
