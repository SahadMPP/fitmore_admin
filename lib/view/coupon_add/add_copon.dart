import 'package:fitmore_admin/service/global/firebase/coupon.dart';
import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:fitmore_admin/view/coupon_add/widget/card.dart';
import 'package:fitmore_admin/view/coupon_add/widget/text_field.dart';
import 'package:fitmore_admin/view/coupon_add/widget/top_box.dart';
import 'package:flutter/material.dart';

import '../../model/coupon.dart';
import '../widget/snack_bar.dart';

class AddCoupon extends StatefulWidget {
  final bool isUpdate;
  final Coupon? updateData;
  final String? id;
  const AddCoupon({super.key,required this.isUpdate, this.updateData, this.id});

  @override
  State<AddCoupon> createState() => _AddCouponState();
}

class _AddCouponState extends State<AddCoupon> {
  final _formKey = GlobalKey<FormState>(); // Form Key for validation

  // Controllers for text fields
  TextEditingController _couponNameController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  String? _selectedCategory;

  @override
  void initState() {
    if (widget.isUpdate) {
      _couponNameController = TextEditingController(text: widget.updateData!.name);
      _codeController = TextEditingController(text: widget.updateData!.code);
      _amountController = TextEditingController(text: widget.updateData!.amount);
      _selectedCategory = widget.updateData!.product.toString();
    }
    super.initState();
  }

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
                if(widget.isUpdate)
                TopBox(width: width, onAddCoupon: _updateCoupon, isUpdate: true),
                if(!widget.isUpdate)
                TopBox(width: width, onAddCoupon: _addCoupon,isUpdate: false),
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

   void _updateCoupon() {
    if (_formKey.currentState!.validate()) {
      try {
        FireStoreCouponService couponService = FireStoreCouponService();
        couponService.updateNote(widget.id!,Coupon(
            name: _couponNameController.text,
            code: _codeController.text,
            amount: _amountController.text,
            product: _selectedCategory.toString()));
        ScaffoldMessenger.of(context).showSnackBar(customSnackbar(massage: 'Coupon Updated', backgroundColor: Colors.green));
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(customSnackbar(massage: e.toString(), backgroundColor: Colors.red));
      }

      // Reset form or navigate
    }
  }
}

