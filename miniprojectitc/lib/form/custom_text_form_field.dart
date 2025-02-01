import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, required this.label, this.controller});
  final String label;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(color: Color(0xffC0C0C0)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC0C0C0)),
          ),
        ),
      ),
      );
  }
}