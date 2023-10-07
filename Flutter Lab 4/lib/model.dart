// {
//   "id":495,
//   "brand":"maybelline",
//   "name":"Maybelline Face Studio Master Hi-Light Light Booster Bronzer",
//   "price":"14.99",
//   "price_sign":null,
//   "currency":null,
//   "image_link":"https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png",
//   "product_link":"https://well.ca/products/maybelline-face-studio-master_88837.html",
//   "website_link":"https://well.ca",
//   "description":"Maybelline Face Studio Master Hi-Light Light Boosting bronzer formula has an expert \nbalance of shade + shimmer illuminator for natural glow. Skin goes \nsoft-lit with zero glitz.\n\n\t\tFor Best Results: Brush over all shades in palette and gently sweep over \ncheekbones, brow bones, and temples, or anywhere light naturally touches\n the face.\n\n\t\t\n\t\n\n                    ",
//   "rating":5.0,
//   "category":null,
//   "product_type":"bronzer",
//   "tag_list":[],
//   "created_at":"2016-10-01T18:36:15.012Z",
//   "updated_at":"2017-12-23T21:08:50.624Z",
//   "product_api_url":"https://makeup-api.herokuapp.com/api/v1/products/495.json",
//   "api_featured_image":"//s3.amazonaws.com/donovanbailey/products/api_featured_images/000/000/495/original/open-uri20171223-4-9hrto4?1514063330",
//   "product_colors":
//     [
//       {"hex_value":"#9B7163","colour_name":null},
//       {"hex_value":"#D78A89","colour_name":null},
//       {"hex_value":"#DBB7A9","colour_name":null}
//     ]
// }

class APIDataModel
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

  APIDataModel
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

  APIDataModel.fromJson(Map<String, dynamic> json)
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


