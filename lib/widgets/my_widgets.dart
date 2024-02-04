import 'package:flutter/material.dart';
import 'package:montra_expense_tracker/utils/app_color.dart';

Widget myelevatedButton(
    {required String text,
    required Function() onPressed,
    Color? color,
    double? width,
    double? height,
    double? fontSize,
    FontWeight? fontWeight,
    double? radius,
    required Color textColor}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'inter'),
    ),
    style: ElevatedButton.styleFrom(
      primary: color,
      minimumSize: Size(343, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}

Widget myTextField(
    {text,
    //String? icon,
    bool,
    TextEditingController? controller,
    Function? validator}) {
  return TextFormField(
    validator: (input) => validator!(input),
    obscureText: bool,
    controller: controller,
    // controller: controller,
    decoration: InputDecoration(
        //contentPadding: EdgeInsets.only(top: 20, left: 20),
        errorStyle: TextStyle(fontSize: 0),
        hintStyle: TextStyle(
          fontSize: 18,
          color: AppColors.Light20,
        ),
        hintText: text,
        focusColor: AppColors.Violet100,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.Violet100, width: 1.5),
            borderRadius: BorderRadius.circular(16.0)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
  );
}
