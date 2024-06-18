import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  String id;
  String name;
  BrandModel? subcategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? categoryId;

  BrandModel({
    required this.id,
    required this.name,
    this.subcategoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.categoryId,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    id: json["_id"],
    name: json["name"],
    subcategoryId: json["subcategoryId"] == null ? null : BrandModel.fromJson(json["subcategoryId"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "subcategoryId": subcategoryId?.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "categoryId": categoryId,
  };
}
