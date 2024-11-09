import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:fitmore_admin/utils/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TopBox(width: width),
              sw5,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          if(width<900)
                          buildCard(
                            title: 'Product Media',
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Image.network(
                                            'https://via.placeholder.com/100')),
                                    sw1,
                                    Expanded(
                                        child: Image.network(
                                            'https://via.placeholder.com/100')),
                                    sw1,
                                    Expanded(
                                        child: Image.network(
                                            'https://via.placeholder.com/100')),
                                    sw1,
                                    Expanded(
                                        child: Image.network(
                                            'https://via.placeholder.com/100')),
                                  ],
                                ),
                                sh2,
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              Colors.blue),
                                      shape: WidgetStatePropertyAll(
                                          ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)))),
                                  onPressed: () {},
                                  child: Text(
                                    'Add product',
                                    style: AppTextStyles.bodyText2
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          buildCard(
                            title: 'General Information',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextField(
                                    label: 'Product Name',
                                    hint: 'Xiaomi Watch 2 Pro'),
                                buildTextField(
                                  label: 'Description',
                                  hint:
                                      'Supports 19 professional fitness modes and more. Suitable for swimming.',
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                          buildCard(
                            title: 'More',
                            child: Column(
                              children: [
                                buildTextField(
                                    label: 'Base Price', hint: '\$118.89'),
                                buildTextField(label: 'Stock', hint: '25'),
                                DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                      labelText: 'Product Category'),
                                  items: ['Nike', 'Puma', 'Other', 'Other']
                                      .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: AppTextStyles.bodyText2
                                                .copyWith(
                                                    color: Colors.black),
                                          )))
                                      .toList(),
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                      if(width>900)
                  Expanded(
                      flex: 3,
                      child: 
                      buildCard(
                        title: 'Product Media',
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Image.network(
                                        'https://via.placeholder.com/100')),
                                sw1,
                                Expanded(
                                    child: Image.network(
                                        'https://via.placeholder.com/100')),
                                sw1,
                                Expanded(
                                    child: Image.network(
                                        'https://via.placeholder.com/100')),
                                sw1,
                                Expanded(
                                    child: Image.network(
                                        'https://via.placeholder.com/100')),
                              ],
                            ),
                            sh2,
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      const WidgetStatePropertyAll(
                                          Colors.blue),
                                  shape: WidgetStatePropertyAll(
                                      ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)))),
                              onPressed: () {},
                              child: Text(
                                'Add product',
                                style: AppTextStyles.bodyText2
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(12.0.sp),
      margin: EdgeInsets.all(12.0.sp),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: AppTextStyles.bodyText1
                  .copyWith(fontWeight: FontWeight.bold)),
          sh2,
          child,
        ],
      ),
    );
  }

  Widget buildTextField(
      {required String label, required String hint, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.bodyText2
                .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: .5.h),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[100]!)),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBox extends StatelessWidget {
  final double  width;
  const TopBox({
    super.key, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.sp),
      margin: EdgeInsets.all(10.sp),
      width: double.infinity,
      height: 16.h,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Add Product', style: AppTextStyles.headline3),
              Text(
                'Dashboard > Product List > Add Product',
                style: AppTextStyles.bodyText1.copyWith(color: Colors.grey),
              ),
                if(width < 900)
          sideButton()
            ],
          ),
          if(width > 900)
          sideButton()
        ],
      ),
    );
  }

  Row sideButton() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              onPressed: () {},
              child: Text(
                'Descard Changes',
                style: AppTextStyles.bodyText2.copyWith(color: Colors.red),
              ),
            ),
            sw1,
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                  shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              onPressed: () {},
              child: Text(
                'Add product',
                style: AppTextStyles.bodyText2.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
  }
}
