import 'package:flutter/material.dart';


class Categoryview extends StatefulWidget {
  const Categoryview({Key? key}) : super(key: key);

  @override
  State<Categoryview> createState() => _CategoryviewState();
}

class _CategoryviewState extends State<Categoryview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Category view"),
      ),
    );
  }
}
