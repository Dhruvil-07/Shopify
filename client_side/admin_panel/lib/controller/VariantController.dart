import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/model/VariantTypeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/VariantModel.dart';

class VariantController extends GetxController
{
  //list of category
  RxList<VariantModel> VariantData = <VariantModel>[].obs;

  //method for get all category
  Future<void> GetAllVariant(BuildContext context) async
  {
    var url = "http://localhost:8000/variant";
    var Response = await httpService.GetApi(context, url);

    if(Response != null)
    {
      VariantData.clear();
      var Data = Response["data"];
      List.of(Data).map((e){
        return VariantData.value.add(VariantModel.fromJson(e));
      }).toList();

      print(VariantData[0].name);
    }
  }

}