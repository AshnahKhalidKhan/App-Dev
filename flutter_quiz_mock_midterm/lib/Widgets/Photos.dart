import 'package:flutter/material.dart';
import 'package:flutter_quiz_mock_midterm/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIDataModel {
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

  APIDataModel(
      {this.id,
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
      this.productColors});

  APIDataModel.fromJson(Map<String, dynamic> json) {
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
    if (json['product_colors'] != null) {
      productColors = <ProductColors>[];
      json['product_colors'].forEach((v) {
        productColors!.add(new ProductColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
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
    if (this.productColors != null) {
      data['product_colors'] =
          this.productColors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductColors {
  String? hexValue;
  String? colourName;

  ProductColors({this.hexValue, this.colourName});

  ProductColors.fromJson(Map<String, dynamic> json) {
    hexValue = json['hex_value'];
    colourName = json['colour_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hex_value'] = this.hexValue;
    data['colour_name'] = this.colourName;
    return data;
  }
}

void main() => runApp(const MainApp());

class APIDataModelWidget extends StatefulWidget
{
  const APIDataModelWidget({super.key});

  @override
  State<APIDataModelWidget> createState() => _APIDataModelWidgetState();
}

class _APIDataModelWidgetState extends State<APIDataModelWidget>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        leading: Icon(Icons.menu),
        backgroundColor: Colors.blue,
        title: Text('Products'),
        centerTitle: true,
      ),
      body: SafeArea
      (
        child: FutureBuilder
        (
          future: fetchAPIDataModel(),
          builder: (context, snapashot)
          {
            if (snapashot.hasData)
            {
              return _buildingAPIDataModelInList(snapashot.data!);
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

Future<List<APIDataModel>> fetchAPIDataModel() async
{
  final response = await http.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
  if (response.statusCode == 200)
  {
    List<dynamic> _parsedList = jsonDecode(response.body);
    List<APIDataModel> _itemsList = List<APIDataModel>.from
    (
      _parsedList.map<APIDataModel>((dynamic i) => APIDataModel.fromJson(i))
    );
    return _itemsList;
  }
  else
  {
    throw Exception('Nahin chal raha yaaarrrrrrrr');
  }
}

// Future<List<ProductColors>> fetchColors(APIDataModel a)
// {
//   // final response = await http.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
//   // if (response.statusCode == 200)
//   // {
//     List<dynamic> _parsedList = jsonDecode(a.productColors);
//     List<ProductColors> _itemsList = List<ProductColors>.from
//     (
//       _parsedList.map<ProductColors>((dynamic i) => ProductColors.fromJson(i))
//     );
//     return _itemsList;
//   }
//   // else
//   // {
//   //   throw Exception('Nahin chal raha yaaarrrrrrrr');
//   // }
// }

ListView _buildingAPIDataModelInList(List<APIDataModel> photos)
{
  return ListView.builder
  (
    itemCount: photos.length,
    itemBuilder: (context, i)
    {
      return ListTile
      (
        leading: Image.network
        (
          photos[i].imageLink.toString(),
        ),
        title: Text
        (
          photos[i].name.toString(),
        ),
        
        style: ListTileStyle.list,
        shape: Border.all
        (
          width: 1.0,
          color: Colors.grey,
        ),
        trailing: Text
        (
          "\$" + photos[i].price.toString()
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
                          SizedBox
                          (
                            child: Row
                            (
                              children:
                              [
                                Image.network(photos[i].imageLink.toString()),
                                Wrap
                                (
                                  children:
                                  [
                                    Column
                                    (
                                      children:
                                      [
                                        SizedBox
                                        (
                                          
                                          child: Column
                                          (
                                            children: [
                                              Text(photos[i].name.toString()),
                                              Wrap(children: [Text(photos[i].description.toString())])
                                              ]
                                          )
                                        ),
                                        // Text
                                        // (
                                        //   photos[i].description.toString()
                                        // ),
                                      ]
                                    ),
                                  ],
                                )
                              ]),
                          ),
                          Row
                          (
                            children:
                            [
                              Text
                              (
                                "BRAND: ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text
                              (
                                photos[i].brand.toString().toUpperCase(),
                                style: TextStyle(color: Colors.grey, 
                                // fontWeight: FontWeight.bold, 
                                fontSize: 20.0),
                              ),
                              SizedBox(width: 10.0),
                              Text
                              (
                                "Price: ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text
                              (
                                "\$",
                              style: TextStyle( fontSize: 20.0),
                              ),
                              Text
                              (
                                photos[i].price.toString(),
                                style: TextStyle(color: Colors.grey, fontSize: 20.0),
                              ),
                            ],
                          ),
                                                    Row
                          (
                            children:
                            [
                              Text
                              (
                                "Product type: ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text
                              (
                                photos[i].productType.toString().toUpperCase(),
                                style: TextStyle(color: Colors.grey, 
                                // fontWeight: FontWeight.bold, 
                                fontSize: 20.0),
                              ),
                              SizedBox(width: 50.0),
                              Text
                              (
                                "Rating: ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text
                              (
                                photos[i].rating.toString(),
                                style: TextStyle(color: Colors.grey, fontSize: 20.0),
                              ),
                            ],
                          ),

                          // Row
                          // (
                          //   // alignment: Alignment.centerLeft,
                          //   children: 
                          //   [
                          //     GridView.builder(
                          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: photos[i].productColors!.length,),
                          //     itemCount: photos[i].productColors!.length,
                          //     itemBuilder: (context, j)
                          //     {
                          //       return CircleAvatar
                          //       (
                          //         radius: 1.0,
                          //         backgroundColor: Color(int.parse(photos[i].productColors![j].hexValue.toString(), radix: 16)),
                          //       );
                          //     },
                          //   )
                          //   ]
                          // )
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

// GridView ColorsLagana(List<APIDataModel> productColors)
// {
//   return GridView.builder
//   (
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: productColors.length),
//     itemCount: productColors.length,
//     itemBuilder: (context, int i)
//     {
//       return GridTile
//       (
//         child: Card
//         (
//           child: Column
//           (
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>
//             [
//               Container
//               (
//                 alignment: Alignment.center,
//                 width: 50,
//                 height: 50,
//                 decoration: const BoxDecoration
//                 (
//                   shape: BoxShape.circle,
//                   color: Colors.grey,
//                 ),
//                 child: Text
//                 (
//                   comment[i].id.toString()
//                 ),
//               ),
//               Text
//               (
//                 comment[i].name,
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   );
// }