import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());

class SubCategoryModel {
  String id;
  String name;
  SubCategoryModel? categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? image;

  SubCategoryModel({
    required this.id,
    required this.name,
    this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.image,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    id: json["_id"],
    name: json["name"],
    categoryId: json["categoryId"] == null ? null : SubCategoryModel.fromJson(json["categoryId"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "categoryId": categoryId?.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "image": image,
  };
}
