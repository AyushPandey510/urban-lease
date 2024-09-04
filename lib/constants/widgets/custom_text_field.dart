import 'package:flutter/material.dart';
import 'package:urban_lease/constants/colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController email,
    required this.hintText,
    required this.icon,
    required this.obscureText,
  }) : _email = email;

  final TextEditingController _email;
  final String hintText;
  final IconData? icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _email,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 22,
        color: AppColors.accentColor,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.accentColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 22,
          color: Colors.white38,
          fontWeight: FontWeight.normal,
        ),
        fillColor: Colors.white10,
        prefixIcon: Icon(
          icon,
          color: AppColors.accentColor,
          size: 32,
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
