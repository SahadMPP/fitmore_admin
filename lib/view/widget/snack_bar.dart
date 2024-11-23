import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

SnackBar customSnackbar(
    {required String massage, required Color backgroundColor}) {
  return SnackBar(
    margin:  EdgeInsets.all(12.sp),
    behavior: SnackBarBehavior.floating,
    content: Text(
      massage,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: backgroundColor,
  );
}
