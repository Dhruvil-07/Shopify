import 'package:admin_panel/model/SubCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Utils/Instances.dart';

class SubCategoryControler extends GetxController
{
   //list of sub category
   RxList<SubCategoryModel> SubCategoryData = <SubCategoryModel>[].obs;

   //function to get All sub Category
   Future<void> GetAllSubCategory(BuildContext context) async
   {
     var url = "http://localhost:8000/subcategory";
     var Response = await httpService.GetApi(context, url);

     if(Response != null)
     {
       SubCategoryData.clear();
       var Data = Response["data"];
       List.of(Data).map((e){
         return SubCategoryData.value.add(SubCategoryModel.fromJson(e));
       }).toList();

       print(SubCategoryData);
     }
   }
}