import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main.dart';

class Maybelline
{
  int? id;
  String? brand;
  String? name;
  String? price;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? productType;
  String? createdAt;
  String? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColors>? productColors;

  Maybelline
  (
    {
      this.id,
      this.brand,
      this.name,
      this.price,
      this.imageLink,
      this.productLink,
      this.websiteLink,
      this.description,
      this.rating,
      this.productType,
      this.createdAt,
      this.updatedAt,
      this.productApiUrl,
      this.apiFeaturedImage,
      this.productColors
    }
  );

  Maybelline.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    imageLink = json['image_link'];
    productLink = json['product_link'];
    websiteLink = json['website_link'];
    description = json['description'];
    rating = json['rating'];
    productType = json['product_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productApiUrl = json['product_api_url'];
    apiFeaturedImage = json['api_featured_image'];
    if (json['product_colors'] != null)
    {
      productColors = <ProductColors>[];
      json['product_colors'].forEach((v)
      {
        productColors!.add(new ProductColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image_link'] = this.imageLink;
    data['product_link'] = this.productLink;
    data['website_link'] = this.websiteLink;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['product_type'] = this.productType;
    // if (this.tagList != null) {
    //   data['tag_list'] = this.tagList!.map((v) => v.toJson()).toList();
    // }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_api_url'] = this.productApiUrl;
    data['api_featured_image'] = this.apiFeaturedImage;
    if (this.productColors != null)
    {
      data['product_colors'] = this.productColors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductColors
{
  String? hexValue;
  String? colourName;

  ProductColors({this.hexValue, this.colourName});

  ProductColors.fromJson(Map<String, dynamic> json)
  {
    hexValue = json['hex_value'];
    colourName = json['colour_name'];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hex_value'] = this.hexValue;
    data['colour_name'] = this.colourName;
    return data;
  }
}

void main() => runApp(const MainApp());

Future<List<Maybelline>> fetchMaybelline() async
{
  final response = await http.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
  if (response.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(response.body);
    List<Maybelline> _itemsList = List<Maybelline>.from
    (
      _parsedList.map<Maybelline>((dynamic i) => Maybelline.fromJson(i))
    );
    return _itemsList;
  }
  else
  {
    throw Exception('Nahin chal raha yaaarrrrrrrr');
  }
}

class MaybellineWidget extends StatefulWidget
{
  const MaybellineWidget({super.key});

  @override
  State<MaybellineWidget> createState() => _MaybellineWidgetState();
}

class _MaybellineWidgetState extends State<MaybellineWidget>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.blue,
        leading: Icon
        (
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text
        (
          "Products",
          style: TextStyle
          (
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Container
      (
        child: FutureBuilder
        (
          future: fetchMaybelline(),
          builder: (context, snapashot)
          {
            if (snapashot.hasData)
            {
              return _buildList(snapashot.data!);
            }
            else if (snapashot.hasError)
            {
              return Text('$snapashot.error');
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

ListView _buildList(List<Maybelline> snapashot)
{
  return ListView.builder
  (
    itemCount: snapashot.length,
    itemBuilder: (context, i)
    {
      return ListTile
      (
        leading: Image.network(snapashot[i].imageLink.toString()),
        title: Text(snapashot[i].name.toString()),
        trailing: Text("\$" + snapashot[i].price.toString()),
        onTap: ()
        {
          showModalBottomSheet<void>
          (
            context: context,
            builder: (BuildContext context)
            {
              return SizedBox
              (
                width: double.maxFinite,
                child: Padding
                (
                  padding: EdgeInsets.all(10.0),
                  child: Wrap
                  (
                    children:
                    [
                      ListTile
                      (
                        leading: Image.network(snapashot[i].imageLink.toString()),
                        title: Text(snapashot[i].name.toString()),
                        subtitle: Text(snapashot[i].description.toString()),
                      ),
                      ListTile
                      (
                        titleAlignment: ListTileTitleAlignment.center,
                        leading: Text("Brand: " + snapashot[i].brand.toString().toUpperCase(), style: TextStyle(color: Colors.red)),
                        trailing: Text("Price: \$" + snapashot[i].price.toString(), style: TextStyle(color: Colors.green)),
                      ),
                      ListTile
                      (
                        titleAlignment: ListTileTitleAlignment.center,
                        leading: Text("Product type: " + snapashot[i].productType.toString().toUpperCase(), style: TextStyle(color: Colors.green)),
                        trailing: Text("Rating: " + snapashot[i].rating.toString(), style: TextStyle(color: Colors.blue)),
                      ),
                      Row
                      (
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: _buildColorCircles(snapashot[i].productColors!),
                      ),
                      // Row
                      // (
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: snapashot[i].productColors!.map((productColorsList)
                      //   {
                      //     return Wrap
                      //     (
                      //       children:
                      //       [
                      //         CircleAvatar
                      //         (
                      //           backgroundColor: Color
                      //           (
                      //             int.parse((productColorsList.hexValue.toString()).replaceAll("#", "0xFF"))
                      //           ),
                      //         ),
                      //         SizedBox(width: 5.0),
                      //       ] 
                      //     );
                      //   }).toList(),
                      // ),
                      // Text(snapashot[i].productColors?[0].hexValue.toString() ?? "", style: TextStyle(color: Colors.red)),
                      // if (snapashot[i].productColors!.isNotEmpty)
                      // {
                      //   // _f1(snapashot[i].productColors!),

                      // }
                      // GridView.builder
                      // (
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      //   itemCount: snapashot[i].productColors!.length,
                      //   itemBuilder: (context, j)
                      //   {
                      //     // return CircleAvatar(backgroundColor: Color(int.parse((snapashot[i].productColors!?[j].hexValue.toString() ?? "").replaceAll("#", "0xFF"))),);
                      //     return Text(snapashot[i].productColors!?[j].hexValue.toString() ?? "");
                      //   },
                      // ),
                    ]
                  )
                )
              );
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          );
        },
      );
    }
  );
}

List<Wrap> _buildColorCircles(List<ProductColors> productColorsArray)
{
  return productColorsArray.map((productColorsList)
  {
    return Wrap
    (
      children:
      [
        CircleAvatar
        (
          backgroundColor: Color
          (
            int.parse((productColorsList.hexValue.toString()).replaceAll("#", "0xFF"))
          ),
        ),
        SizedBox(width: 5.0),
      ] 
    );
  }).toList();
}

// GridView _f1(List<ProductColors> a)
// {
//   if (a.length == 0)
//   {
//     return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 0),);
//   }
//   GridView f = GridView.builder
//     (
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: a.length),
//       itemBuilder: (context, i) {
//         return CircleAvatar(backgroundColor: Color(int.parse((a?[i].hexValue.toString() ?? "").replaceAll("#", "0xFF"))),);
//       },

//     );
//   return f;
//   // return Text(a?[0].hexValue.toString() ?? "", style: TextStyle(color: Colors.red));
// }