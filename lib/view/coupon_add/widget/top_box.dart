import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopBox extends StatelessWidget {
  final double width;
  final VoidCallback onAddCoupon; // Callback for add coupon button
  final bool isUpdate;
  const TopBox({
    super.key,
    required this.width,
    required this.onAddCoupon, required this.isUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.sp),
      margin: EdgeInsets.all(10.sp),
      width: double.infinity,
      height: width < 900 ? 22.h : 20.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Text(isUpdate ? 'Update Coupon':'Add Coupon',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Text(
                'Dashboard > Coupon List > Add Coupon',
                style: TextStyle(color: Colors.grey),
              ),
              if (width < 900) sideButton(),
            ],
          ),
          if (width > 900) sideButton(),
        ],
      ),
    );
  }

  Row sideButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            // Discard Changes
          },
          child: const Text(
            'Discard Changes',
            style: TextStyle(color: Colors.red),
          ),
        ),
        sw1,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: onAddCoupon,
          child:  Text(
            isUpdate ? 'Update Coupon':'Add Coupon',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

