import 'dart:html';

class localStorageService
{
   Storage localstorage = window.localStorage;

   Future<void> createStorage(String token) async
   {
      localstorage["Token"] = token;
   }

   Future<dynamic> readStorage() async
   {
     return localstorage["Token"];
   }

}