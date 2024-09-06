import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  const CustomTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}
