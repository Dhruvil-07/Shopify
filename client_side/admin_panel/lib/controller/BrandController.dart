import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/model/BrandModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BrandController extends GetxController
{
    //list of brands
    RxList<BrandModel> BrandData = <BrandModel>[].obs;

    //function to get all brands
    Future<void> GetAllBrands(BuildContext context) async
    {
        var url = "http://localhost:8000/brand";
        var Response = await httpService.GetApi(context, url);

        if(Response != null)
        {
            BrandData.clear();
            var Data = Response["data"];
            List.of(Data).map((e){
              return BrandData.value.add(BrandModel.fromJson(e));
            }).toList();
            return;
        }
    }

}