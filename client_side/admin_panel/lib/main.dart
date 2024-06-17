import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/view/LoginView.dart';
import 'package:admin_panel/view/PanelView.dart';
import 'package:flutter/material.dart';

void main()
{
   runApp(Shopify_admin());
}

class Shopify_admin extends StatelessWidget {
  const Shopify_admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PanelView(),
      theme: ThemeData.dark(),
    );
  }
}
