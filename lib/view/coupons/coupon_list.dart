import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:fitmore_admin/utils/const/text_style.dart';
import 'package:fitmore_admin/view/coupons/add_copon.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CouponList extends StatelessWidget {
  const CouponList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search discounts by name..',
                          hintStyle: AppTextStyles.bodyText2,
                          prefixIcon: Icon(Icons.search,
                              color: Colors.grey, size: 15.sp),
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddCoupon(),)),
                    style: ButtonStyle(
                      backgroundColor: 
                      const WidgetStatePropertyAll(Colors.blue),
                      shape: WidgetStatePropertyAll(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(3)))
                    ),
                    child: Text(
                      'Add',
                      style:
                          AppTextStyles.caption.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            sh1,
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.grey[50],
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  sw1,
                  Expanded(
                      flex: 2,
                      child: Text('Name',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.black54))),
                  Expanded(
                      flex: 2,
                      child: Text('Code',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.black54))),
                  Expanded(
                      flex: 2,
                      child: Text('Amount',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.black54))),
                  Expanded(
                      flex: 2,
                      child: Text('Product',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.black54))),
                              if(width>900)
                              sw20
                ],
              ),
            ),
            sh2,
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      sw1,
                      Expanded(
                          flex: 2,
                          child: Text('Black Friday',
                              style: AppTextStyles.bodyText2.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment
                              .centerLeft, // Adjust alignment as needed
                          child: Card(
                            margin: EdgeInsets.all(5.sp),
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(8.sp)),
                            color: Colors.grey[50],
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: .5.w,
                                right: 1.w,
                                top: 1.h,
                                bottom: 1.h,
                              ), // Add padding for spacing around text
                              child: Text(
                                'BLACKFRIDAY',
                                style: AppTextStyles.bodyText2.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text('50%',
                              style: AppTextStyles.bodyText2.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                      Expanded(
                          flex: 2,
                          child: Text('All products',
                              style: AppTextStyles.bodyText2.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                              if(width>900)
                              sw20

                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
