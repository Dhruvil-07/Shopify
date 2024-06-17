import 'package:admin_panel/Utils/Instances.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/ProductModel.dart';

class ProductController extends GetxController
{
    RxList<ProductModel> ProductData = <ProductModel>[].obs;

    //get all product
    Future<void> GetAllProduct(BuildContext context) async
    {
        var url = "http://localhost:8000/product";
        var response = await httpService.GetApi(context, url);

        if(response != null)
        {
           ProductData.clear();
           var data = response["data"];
           List.of(data).map((e){
             ProductData.value.add(ProductModel.fromJson(e));
           }).toList();
        }
    }


}