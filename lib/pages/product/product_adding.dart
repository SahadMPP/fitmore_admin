import 'package:fitmore_admin/pages/product/widget/text_field_reg.dart';
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
              child:width < 600 ? Column(children: children,): Row(children: children),
            ),
          ),
          Expanded(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Add'))))
        ],
      ),
    );
  }
}
