import 'dart:convert';

VariantTypeModel variantTypeModelFromJson(String str) => VariantTypeModel.fromJson(json.decode(str));

String variantTypeModelToJson(VariantTypeModel data) => json.encode(data.toJson());

class VariantTypeModel {
  String id;
  String name;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  VariantTypeModel({
    required this.id,
    required this.name,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory VariantTypeModel.fromJson(Map<String, dynamic> json) => VariantTypeModel(
    id: json["_id"],
    name: json["name"],
    type: json["type"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "type": type,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
