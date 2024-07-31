import 'package:flutter/material.dart';

class CustomFromField extends StatelessWidget {
  CustomFromField({this.hintText, this.textInputType, this.icon, this.controller});

  String? hintText;
  TextInputType? textInputType;
  IconData? icon;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white, // هنا تقوم بتحديد لون النص
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your information';
          }
        },
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFFE9E3D5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xffe9e3d5),
            ),
          ),
        ),
      ),
    );
  }
}