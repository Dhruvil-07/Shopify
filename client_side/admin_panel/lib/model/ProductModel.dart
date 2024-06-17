// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  String name;
  String description;
  int quantity;
  int price;
  int offerPrice;
  ProId proCategoryId;
  ProId proSubCategoryId;
  ProId proBrandId;
  ProId proVariantTypeId;
  List<String> proVariantId;
  List<Image> images;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
    required this.offerPrice,
    required this.proCategoryId,
    required this.proSubCategoryId,
    required this.proBrandId,
    required this.proVariantTypeId,
    required this.proVariantId,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    quantity: json["quantity"],
    price: json["price"],
    offerPrice: json["offerPrice"],
    proCategoryId: ProId.fromJson(json["proCategoryId"]),
    proSubCategoryId: ProId.fromJson(json["proSubCategoryId"]),
    proBrandId: ProId.fromJson(json["proBrandId"]),
    proVariantTypeId: ProId.fromJson(json["proVariantTypeId"]),
    proVariantId: List<String>.from(json["proVariantId"].map((x) => x)),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "quantity": quantity,
    "price": price,
    "offerPrice": offerPrice,
    "proCategoryId": proCategoryId.toJson(),
    "proSubCategoryId": proSubCategoryId.toJson(),
    "proBrandId": proBrandId.toJson(),
    "proVariantTypeId": proVariantTypeId.toJson(),
    "proVariantId": List<dynamic>.from(proVariantId.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Image {
  int image;
  String url;
  String id;

  Image({
    required this.image,
    required this.url,
    required this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    image: json["image"],
    url: json["url"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "url": url,
    "_id": id,
  };
}

class ProId {
  String id;
  String name;

  ProId({
    required this.id,
    required this.name,
  });

  factory ProId.fromJson(Map<String, dynamic> json) => ProId(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
