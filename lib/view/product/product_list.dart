import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:fitmore_admin/utils/const/text_style.dart';
import 'package:fitmore_admin/view/product/product_add.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProdectList extends StatelessWidget {
  const ProdectList({super.key});

  @override
  Widget build(BuildContext context) {
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
                          hintText: 'Search Product by name..',
                          hintStyle: AppTextStyles.bodyText2,
                          prefixIcon: Icon(Icons.search,
                              color: Colors.grey, size: 15.sp),
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddProduct(),)),
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Color.fromARGB(255, 14, 48, 236)),
                        shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(3)))),
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline_sharp,color: Colors.white,size: 15.sp,),
                        sw1,
                        Text(
                          'Add Product',
                          style:
                              AppTextStyles.caption.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sh1,
            Container(
              width: double.infinity,
              height: 40,
              color: const Color.fromARGB(255, 38, 68, 241),
              child: Row(
                children: [
                  sw3,
                  Expanded(
                      
                      child: Text('Product Name',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.white,fontWeight: FontWeight.w400))),
                  Expanded(
                      
                      child: Text('Category',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.white,fontWeight: FontWeight.w400))),
                  Expanded(
                      
                      child: Text('Price',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.white,fontWeight: FontWeight.w400))),
                  Expanded(
                      
                      child: Text('Stock',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.white,fontWeight: FontWeight.w400))),
                               Expanded(
                      
                      child: Text('Revenew',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.white,fontWeight: FontWeight.w400))),
                               Expanded(
                            child:Padding(
                              padding: EdgeInsets.only(right: 2.w),
                              child:  Align(alignment: Alignment.centerRight,child: Text('Action',
                          style: AppTextStyles.bodyText2
                              .copyWith(color: Colors.white,fontWeight: FontWeight.w400))),
                            )),
                 
                ],
              ),
            ),
            sh2,
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: .5.h),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 4.h,
                            height: 4.h,
                            child: Image.asset('assets/images/images.jfif',fit: BoxFit.cover,)),
                        sw1,
                        Expanded(
                            
                            child: Text('Navy Blue Shoe',
                                style: AppTextStyles.bodyText2.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                        Expanded(
                            
                            child: Text('Nike',
                                style: AppTextStyles.bodyText2.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                        Expanded(
                            
                            child: Text('\$120',
                                style: AppTextStyles.bodyText2.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                        Expanded(
                            
                            child: Text('500',
                                style: AppTextStyles.bodyText2.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                                    Expanded(
                            
                            child: Text('\$1243',
                                style: AppTextStyles.bodyText2.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                                     Expanded(
                            
                            child:Padding(
                              padding: EdgeInsets.only(right: 2.w),
                              child: const Align(alignment: Alignment.centerRight,child: Icon(Icons.more_vert,color: Colors.black,)),
                            )),
                      ],
                    ),
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
