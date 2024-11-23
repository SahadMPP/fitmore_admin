
  import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget buildCard({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(12.0.sp),
      margin: EdgeInsets.all(12.0.sp),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          sh2,
          child,
        ],
      ),
    );
  }
