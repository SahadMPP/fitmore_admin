import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmore_admin/service/global/firebase/product.dart';
import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:fitmore_admin/utils/const/text_style.dart';
import 'package:fitmore_admin/view/product_add/product_add.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProdectList extends StatelessWidget {
  const ProdectList({super.key});

  @override
  Widget build(BuildContext context) {
    FireStoreProductService fireStoreProductService = FireStoreProductService();
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
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddProduct(),
                    )),
                    style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 14, 48, 236)),
                        shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(3)))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline_sharp,
                          color: Colors.white,
                          size: 15.sp,
                        ),
                        sw1,
                        Text(
                          'Add Product',
                          style: AppTextStyles.caption
                              .copyWith(color: Colors.white),
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
                          style: AppTextStyles.bodyText2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400))),
                  Expanded(
                      child: Text('Category',
                          style: AppTextStyles.bodyText2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400))),
                  Expanded(
                      child: Text('Price',
                          style: AppTextStyles.bodyText2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400))),
                  Expanded(
                      child: Text('Stock',
                          style: AppTextStyles.bodyText2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400))),
                  Expanded(
                      child: Text('Revenew',
                          style: AppTextStyles.bodyText2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400))),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('Action',
                            style: AppTextStyles.bodyText2.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400))),
                  )),
                ],
              ),
            ),
            sh2,
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: fireStoreProductService.getAllNote(),
                    builder: (context, snapshot) {
                      List notes = snapshot.data!.docs;
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot document = notes[index];
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
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
                                        child: Image.asset(
                                          'assets/images/images.jfif',
                                          fit: BoxFit.cover,
                                        )),
                                    sw1,
                                    Expanded(
                                        child: Text(data['title'].toString(),
                                            style: AppTextStyles.bodyText2
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                    Expanded(
                                        child: Text(data['category'].toString(),
                                            style: AppTextStyles.bodyText2
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                    Expanded(
                                        child: Text(data['price'].toString(),
                                            style: AppTextStyles.bodyText2
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                    Expanded(
                                        child: Text(
                                            data['productCount'].toString(),
                                            style: AppTextStyles.bodyText2
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                    Expanded(
                                        child: Text('\$1243',
                                            style: AppTextStyles.bodyText2
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.only(right: 2.w),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                            children: [
                                              const Spacer(),
                                              InkWell(
                                                onTap: () =>
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AddProduct(),
                                                )),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                  size: 15.sp,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () => showDialog(
                                                    builder:
                                                        (context) =>
                                                            AlertDialog(
                                                              content: const Text(
                                                                  'Are you sure to delete?'),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              actions: [
                                                                ElevatedButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  style: const ButtonStyle(
                                                                      shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5))))),
                                                                  child: const Text(
                                                                      'Close'),
                                                                ),
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      fireStoreProductService
                                                                          .deleteId(
                                                                              document.id);
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    style: const ButtonStyle(
                                                                        shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                                                                            borderRadius: BorderRadius.all(Radius.circular(
                                                                                5))))),
                                                                    child: const Text(
                                                                        'Yes')),
                                                              ],
                                                            ),
                                                    context: context),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 15.sp,
                                                ),
                                              ),
                                            ],
                                          )),
                                    )),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return const Center(child: Text('No Notes'));
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
