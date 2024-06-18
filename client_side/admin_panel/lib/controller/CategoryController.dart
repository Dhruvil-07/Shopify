import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/model/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryController extends GetxController
{
    //list of category
    RxList<CategoryModel> CategoryData = <CategoryModel>[].obs;

    //method for get all category
    Future<void> GetAllCategory(BuildContext context) async
    {
        var url = "http://localhost:8000/category";
        var Response = await httpService.GetApi(context, url);

        if(Response != null)
        {
            CategoryData.clear();
            var Data = Response["category"];
            List.of(Data).map((e){
              return CategoryData.value.add(CategoryModel.fromJson(e));
            }).toList();
        }
    }

}