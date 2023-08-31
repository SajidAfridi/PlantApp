import 'package:flutter/material.dart';
import 'package:plant_store_app/common/colors.dart';

InputDecoration inputDecoration(String hintText, Icon icon) {
  const double borderWidth = 0.0; // Set a fixed border width
  return InputDecoration(
    prefixIcon: Padding(
      padding: const EdgeInsets.all(8), // add padding to adjust icon
      child: icon,
    ),
    filled: true,
    fillColor: AppColors.imageBackgroundColor,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: borderWidth,
        color: AppColors.imageBackgroundColor,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      //borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
      borderSide: BorderSide(
        color: Colors.red,
        width: borderWidth,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 0, // Set the border width
        color: AppColors.primaryColor.withOpacity(0.1),
      ),
    ),
    hintText: hintText,
    hintStyle: const TextStyle(
      color: AppColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    contentPadding: const EdgeInsets.fromLTRB(100, 0, 20, 0),
  );
}
