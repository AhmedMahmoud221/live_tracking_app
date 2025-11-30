import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromARGB(255, 226, 226, 226)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(color: Colors.black),
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please enter $hint';
        }
        return null;
      },
    );
  }
}
