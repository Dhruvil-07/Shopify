import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/model/VariantTypeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class VariantTypeController extends GetxController
{
  //list of category
  RxList<VariantTypeModel> VariantTypeData = <VariantTypeModel>[].obs;

  //method for get all category
  Future<void> GetAllVariantType(BuildContext context) async
  {
    var url = "http://localhost:8000/varianttype";
    var Response = await httpService.GetApi(context, url);

    if(Response != null)
    {
      VariantTypeData.clear();
      var Data = Response["data"];
      List.of(Data).map((e){
        return VariantTypeData.value.add(VariantTypeModel.fromJson(e));
      }).toList();
    }
  }

}