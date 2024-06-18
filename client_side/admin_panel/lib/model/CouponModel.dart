import 'dart:convert';

CouponModel couponModelFromJson(String str) => CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  String id;
  String couponCode;
  String discountType;
  int discountAmount;
  int minimumPurchaseAmount;
  String endDate;
  String status;
  String applicableCategory;
  String applicableSubCategory;
  String applicableProduct;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  CouponModel({
    required this.id,
    required this.couponCode,
    required this.discountType,
    required this.discountAmount,
    required this.minimumPurchaseAmount,
    required this.endDate,
    required this.status,
    required this.applicableCategory,
    required this.applicableSubCategory,
    required this.applicableProduct,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
    id: json["_id"],
    couponCode: json["couponCode"],
    discountType: json["discountType"],
    discountAmount: json["discountAmount"],
    minimumPurchaseAmount: json["minimumPurchaseAmount"],
    endDate: json["endDate"],
    status: json["status"],
    applicableCategory: json["applicableCategory"],
    applicableSubCategory: json["applicableSubCategory"],
    applicableProduct: json["applicableProduct"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "couponCode": couponCode,
    "discountType": discountType,
    "discountAmount": discountAmount,
    "minimumPurchaseAmount": minimumPurchaseAmount,
    "endDate": endDate,
    "status": status,
    "applicableCategory": applicableCategory,
    "applicableSubCategory": applicableSubCategory,
    "applicableProduct": applicableProduct,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
