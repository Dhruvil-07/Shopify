import 'dart:collection';
import 'dart:convert';
import 'package:admin_panel/Utils/Instances.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Utils/snakbar.dart';

class HttpService
{

     //Request Header
     var RequestHeader = {
        'Content-Type' : 'application/json',
        'Authorization' : 'Bearer eyJhbGciOiJIUzI1NiJ9.NjY1YzA4MTFmY2JlZjU5YmJhZDlmNGYy.Uusxf7vNudPUaJgY3kRAeGTbFhdDmVgcvh58bHZU8fY',
     };

     //function for get request
     Future<dynamic> GetApi(BuildContext context , String url) async
     {
         print(RequestHeader);
          try
          {

                var apiResponse = await http.get(Uri.parse(url),
                  headers : RequestHeader,
                );
                var decodedData = jsonDecode(apiResponse.body);

                if(apiResponse.statusCode != 200)
                {
                    print(decodedData);
                    ShowSnakbar(context, decodedData["message"]);
                    return;
                }

                return decodedData;
          }
          catch(e)
          {
            print("Inside controller");
            print(e);
          }
     }



     //function for post request
     Future<dynamic> PostApi(BuildContext context , String url , Map<String,dynamic> data) async
     {
         try
         {
             var apiResponse = await http.post(Uri.parse(url),
               headers : RequestHeader,
               body: jsonEncode(data),
             );
             var decodedData = jsonDecode(apiResponse.body);

             if(apiResponse.statusCode != 201)
             {
               print(decodedData);
               ShowSnakbar(context, decodedData["message"]);
               return;
             }

             return decodedData;
         }
         catch(e)
         {
           print("Api Inside Catch");
           print(e);
         }
     }

}