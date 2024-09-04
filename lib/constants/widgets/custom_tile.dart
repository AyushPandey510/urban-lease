import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  String title;
  CustomTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}
