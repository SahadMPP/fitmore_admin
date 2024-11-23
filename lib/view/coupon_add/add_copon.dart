import 'package:fitmore_admin/service/global/firebase/coupon.dart';
import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/coupon.dart';
import '../widget/snack_bar.dart';

class AddCoupon extends StatefulWidget {
  const AddCoupon({super.key});

  @override
  State<AddCoupon> createState() => _AddCouponState();
}

class _AddCouponState extends State<AddCoupon> {
  final _formKey = GlobalKey<FormState>(); // Form Key for validation

  // Controllers for text fields
  final _couponNameController = TextEditingController();
  final _codeController = TextEditingController();
  final _amountController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    // Dispose controllers
    _couponNameController.dispose();
    _codeController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            // Wrap everything in a Form
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBox(width: width, onAddCoupon: _addCoupon),
                sw5,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          buildCard(
                            title: 'General Information',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextField(
                                  label: 'Coupon Name',
                                  hint: '',
                                  controller: _couponNameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a coupon name';
                                    }
                                    return null;
                                  },
                                ),
                                buildTextField(
                                  label: 'Code',
                                  hint: '',
                                  controller: _codeController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a coupon code';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          buildCard(
                            title: 'More',
                            child: Column(
                              children: [
                                buildTextField(
                                  label: 'Amount %',
                                  hint: '\$118.89',
                                  controller: _amountController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the discount amount';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Please enter a valid number';
                                    }
                                    return null;
                                  },
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    labelText: 'Coupon Category',
                                  ),
                                  value: _selectedCategory,
                                  items:
                                      ['All Product', 'Nike', 'Puma', 'Other']
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ))
                                          .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedCategory = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select a category';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          sh2,
          child,
        ],
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: .5.h),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            maxLines: maxLines,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addCoupon() {
    if (_formKey.currentState!.validate()) {
      try {
        FireStoreCouponService couponService = FireStoreCouponService();
        couponService.addNote(Coupon(
            name: _couponNameController.text,
            code: _codeController.text,
            amount: _amountController.text,
            product: _selectedCategory.toString()));
        ScaffoldMessenger.of(context).showSnackBar(customSnackbar(massage: 'Coupon Added', backgroundColor: Colors.green));
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(customSnackbar(massage: e.toString(), backgroundColor: Colors.red));

      }

      // Reset form or navigate
    }
  }
}

class TopBox extends StatelessWidget {
  final double width;
  final VoidCallback onAddCoupon; // Callback for add coupon button

  const TopBox({
    super.key,
    required this.width,
    required this.onAddCoupon,
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
              const Text('Add Coupon',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
          child: const Text(
            'Add Coupon',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

