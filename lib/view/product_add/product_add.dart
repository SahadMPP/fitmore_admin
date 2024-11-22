import 'package:fitmore_admin/model/product.dart';
import 'package:fitmore_admin/service/global/firebase/product.dart';
import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:fitmore_admin/utils/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String categoryCheckBox = 'NikeTTExt';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBox(
                  width: width,
                  categoryCheckBox: categoryCheckBox,
                  product: Product(
                    category: categoryCheckBox,
                    description: descriptionController.text,
                    id: 11,
                    price: 111,
                    productCount: 111,
                    title: titleController.text,
                  ),
                ),
                sw5,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          if (width < 900) buildProductMedia(),
                          buildCard(
                            title: 'General Information',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextField(
                                    controller: titleController,
                                    label: 'Product Name',
                                    hint: 'Xiaomi Watch 2 Pro'),
                                buildTextField(
                                  controller: descriptionController,
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
                                    controller: priceController,
                                    label: 'Base Price',
                                    hint: '\$118.89'),
                                buildTextField(
                                    label: 'Stock',
                                    hint: '25',
                                    controller: stockController),
                                DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                      labelText: 'Product Category'),
                                  items: ['Nike', 'Puma', 'DC', 'Other']
                                      .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: AppTextStyles.bodyText2
                                                .copyWith(color: Colors.black),
                                          )))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      categoryCheckBox = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (width > 900)
                      Expanded(
                        flex: 3,
                        child: buildProductMedia(),
                      ),
                  ],
                ),
              ],
            ),
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
        borderRadius: BorderRadius.circular(8.sp),
      ),
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
      {required String label,
      required String hint,
      int maxLines = 1,
      required controller}) {
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
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field is empty';
              }
              return null;
            },
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

  Widget buildProductMedia() {
    return buildCard(
      title: 'Product Media',
      child: Column(
        children: [
          Row(
            children: List.generate(
                4,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Image.network('https://via.placeholder.com/100'),
                    )),
          ),
          sh2,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue),
              shape: WidgetStateProperty.all(
                ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Add product',
              style: AppTextStyles.bodyText2.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBox extends StatelessWidget {
  final double width;
  final String? categoryCheckBox;
  final Product product;
  const TopBox({
    super.key,
    required this.width,
    required this.categoryCheckBox,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.sp),
      margin: EdgeInsets.all(10.sp),
      width: double.infinity,
      height: 20.h,
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
              if (width < 900) sideButton(context)
            ],
          ),
          if (width > 900) sideButton(context)
        ],
      ),
    );
  }

  Row sideButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all(
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Discard Changes',
            style: AppTextStyles.bodyText2.copyWith(color: Colors.red),
          ),
        ),
        sw1,
        ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
          onPressed: () {
            FireStoreProductService service = FireStoreProductService();

            if (categoryCheckBox == '') {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Category is Empty')));
            } else {
              final productt = Product(
                category: categoryCheckBox!,
                description: product.description,
                id: product.id,
                price: product.price,
                productCount: product.productCount,
                title: product.title,
              );
              service.addNote(productt);
            }
          },
          child: Text(
            'Add Product',
            style: AppTextStyles.bodyText2.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
