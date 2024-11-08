import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmore_admin/view/product/widget/text_field_reg.dart';
import 'package:flutter/material.dart';

class AddingProduct extends StatefulWidget {
  const AddingProduct({super.key});

  @override
  State<AddingProduct> createState() => _AddingProductState();
}

class _AddingProductState extends State<AddingProduct> {
  List<Widget> children = [
    Expanded(
        child: Column(
      children: [
        Wrap(
          children: [
            const SizedBox(width: 15),
            Container(
              height: 100,
              width: 100,
              color: Colors.grey,
            ),
            const SizedBox(width: 15),
            Container(
              height: 100,
              width: 100,
              color: Colors.grey,
            ),
            const SizedBox(width: 15),
            Container(
              height: 100,
              width: 100,
              color: Colors.grey,
            ),
            const SizedBox(width: 15),
            Container(
              height: 100,
              width: 100,
              color: Colors.grey,
            ),
          ],
        ),
        const Spacer()
      ],
    )),
    const Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          TextFieldInReg(
            icon: Icons.card_travel,
            labelText: 'Name',
            hintText: 'Enter product name',
            validatorText: 'Enter product name',
            keyboardType: TextInputType.name,
            obscureText: false,
            maxLength: null,
          ),
          SizedBox(height: 15),
          // dropdown
          // dropdown
          SizedBox(height: 15),
          TextFieldInReg(
            icon: Icons.price_change,
            labelText: 'Price',
            hintText: 'Enter product price',
            validatorText: 'Enter product price',
            keyboardType: TextInputType.phone,
            obscureText: false,
            maxLength: null,
          ),
          SizedBox(height: 15),
          TextFieldInReg(
            icon: Icons.production_quantity_limits,
            labelText: 'Stock',
            hintText: 'Enter product Stock',
            validatorText: 'Enter product Stock',
            keyboardType: TextInputType.phone,
            obscureText: false,
            maxLength: null,
          ),
          SizedBox(height: 15),
          TextFieldInReg(
            icon: Icons.text_fields,
            labelText: 'Discription',
            hintText: 'Enter product Discription',
            validatorText: 'Enter product Discription',
            keyboardType: TextInputType.text,
            obscureText: false,
            maxLength: null,
            maxLines: 4,
          ),
        ],
      ),
    )),
  ];

  CollectionReference conf =
                            FirebaseFirestore.instance.collection('product');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Add Product'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              margin: const EdgeInsets.all(12),
              child: width < 600
                  ? Column(
                      children: children,
                    )
                  : Row(children: children),
            ),
          ),
          Expanded(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        final map = {
                          "id": 1,
                          "title": "Sample Product",
                          "discription":
                              "This is a sample product description.",
                          "image1": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRx2pjMbW3AbuqbUIyDxfN2TE2GXEdsBQZWA9vk7pTZr7YnrP9dkXfHZLKMsJ6N1279oY04tVEc3wBMo2XS_BIApjv6fY--S8Jb9K4ToBz0K7nLjvkHaA_4uA",
                          "image2": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR3Q--KOMcN4yipQpGRBr-SlMtv5owA9FxpZtjoENDr4-qloEmKvDCbhlKH_8C4muObO3J-C34nVRbJNhw0nPK99PXlpnu7uqAgb6z5yQfx",
                          "image3": "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ4JMkWi_XRklYC_H_jjcNVXfqJOmHb_0taEBE1p-ZidaAnXwVXXL_OTRQSXdm_QqQPUz0bq62vjkBbi47e59kudSCYed15XHRwntL8aP7MyPHqsLcAh7B_gw",
                          "image4": "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTHbQ3B4iL-4SOwEOgYxBQ-ieKsxTIAqv4PyznGOOGCT4VSNBBtQltNJZgxS8eBApQgfVgcYn5s4xiQuerAT4p6wQoponlLEB7dZWMdySOkgkZYCdRKH09XZMo",
                          "price": 100,
                          "category": "Electronics",
                          "active": true,
                          "productCount": 50
                        };
                        
                        conf.add(map);
                      },
                      child: const Text('Add'))))
        ],
      ),
    );
  }
}
