import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/Utils/snakbar.dart';
import 'package:admin_panel/model/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

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


    //method for post new category
    Future<void> PostNewCategory(BuildContext context , Map<String,String> data , XFile? imageData) async
    {
        var url = "http://localhost:8000/category/reg";
        var bodyPayload = data;

        var Response = await httpService.PostApiWithImg(
            context, data, imageData, url);

        if (Response != null) {
            ShowSnakbar(context, Response["message"]);
        }
    }
}