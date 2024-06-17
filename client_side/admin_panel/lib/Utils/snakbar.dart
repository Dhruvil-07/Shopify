import 'package:flutter/material.dart';

void ShowSnakbar(BuildContext context , String Msg)
{
  var snackdemo = SnackBar(
    content: Text(Msg),
    backgroundColor: Colors.green,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackdemo);
}


