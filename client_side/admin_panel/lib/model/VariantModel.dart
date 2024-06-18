import 'dart:convert';

VariantModel variantModelFromJson(String str) => VariantModel.fromJson(json.decode(str));

String variantModelToJson(VariantModel data) => json.encode(data.toJson());

class VariantModel {
  String id;
  String name;
  VariantModel? variantTypeId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? type;

  VariantModel({
    required this.id,
    required this.name,
    this.variantTypeId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.type,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) => VariantModel(
    id: json["_id"],
    name: json["name"],
    variantTypeId: json["VariantTypeId"] == null ? null : VariantModel.fromJson(json["VariantTypeId"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "VariantTypeId": variantTypeId?.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "type": type,
  };
}
