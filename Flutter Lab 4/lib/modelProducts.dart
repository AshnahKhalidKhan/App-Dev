class APIDataModel
{
            //   "id": 1,
            // "title": "iPhone 9",
            // "description": "An apple mobile which is nothing like apple",
            // "price": 549,
            // "discountPercentage": 12.96,
            // "rating": 4.69,
            // "stock": 94,
            // "brand": "Apple",
            // "category": "smartphones",
            // "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
            // "images": [
            //     "https://i.dummyjson.com/data/products/1/1.jpg",
            //     "https://i.dummyjson.com/data/products/1/2.jpg",
            //     "https://i.dummyjson.com/data/products/1/3.jpg",
            //     "https://i.dummyjson.com/data/products/1/4.jpg",
            //     "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
            // ]

  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<Images>? images;
  // List<ProductColors>? productColors;

  APIDataModel
  (
    {
      this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images
    }
  );

  APIDataModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];

    if (json['images'] != null)
    {
      images = <Images>[];
      json['images'].forEach((v)
      {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['title'] = this.title;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;

    if (this.images != null)
    {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}










//This part here bwloe this is full of errorss


class Images
{
  String? hexValue;
  String? colourName;

  Images({this.hexValue, this.colourName});

  Images.fromJson(Map<String, dynamic> json)
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


