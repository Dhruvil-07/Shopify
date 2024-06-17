import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/Utils/snakbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController
{
    //function for login
    Future<void> Login(BuildContext context , Map<String,dynamic> data) async
    {
       var url = "http://localhost:8000/user/login";
       var Response = await httpService.PostApi(context,url,data);

       if(Response != null)
       {
          httpService.RequestHeader.addEntries({'Authorization': 'Bearer ${Response["Token"]}'}.entries);

          // prefService.createCatch(Response["Token"]).whenComplete((){
          //    httpService.RequestHeader.addEntries({'Authorization' : 'Brear ${Response["Token"]}'}.entries);
          // });

          //storageService.createStorage(Response["Token"]);

          ShowSnakbar(context, "Login SuccessFully");
       }
    }

}