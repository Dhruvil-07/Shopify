import 'package:admin_panel/model/CouponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../Utils/Instances.dart';

class CouponController extends GetxController
{
  //list of category
  RxList<CouponModel> CouponData = <CouponModel>[].obs;

  //method for get all category
  Future<void> GetAllCoupon(BuildContext context) async
  {
    var url = "http://localhost:8000/coupon";
    var Response = await httpService.GetApi(context, url);

    if(Response != null)
    {
      CouponData.clear();
      var Data = Response["data"];
      List.of(Data).map((e){
        return CouponData.value.add(CouponModel.fromJson(e));
      }).toList();
    }
  }
}