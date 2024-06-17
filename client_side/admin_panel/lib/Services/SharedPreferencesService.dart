import 'package:shared_preferences/shared_preferences.dart';

class PrefService
{
    Future<void> createCatch(String Val) async
    {
        SharedPreferences prefrences = await SharedPreferences.getInstance();
        prefrences.setString("Token", Val);
    }

    Future<dynamic> readCatch() async
    {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var Token = preferences.getString("Token");
      return Token;
    }

    Future<void> removeCatch() async
    {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove("Token");
    }
}