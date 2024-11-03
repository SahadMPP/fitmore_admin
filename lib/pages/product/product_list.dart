import 'package:fitmore_admin/pages/product/product_adding.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../dashboard/widget/header_widget.dart';

class ProdectList extends StatefulWidget {
  const ProdectList({super.key});

  @override
  State<ProdectList> createState() => _ProdectListState();
}

class _ProdectListState extends State<ProdectList> {
  int onHoverIndex = -1; // Initialize with -1 (no item is hovered)

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const HeaderWidget(
                title: 'Product List',
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14),
                  itemBuilder: (context, index) {
                    return MouseRegion(
                      
                      onEnter: (_) {
                        setState(() {
                          onHoverIndex = index;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          onHoverIndex = -1;
                        });
                      },
                      child: ProductCard(
                        onHover: onHoverIndex == index,
                        imageUrl: 'data:image/jpeg;base64,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', // Replace with actual image URL
                        name: 'Product Name',
                        price: 49.99,
                        rating: 4.5,
                        inStock: true,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: InkWell(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddingProduct(),)),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: AppColor.yellow,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final double rating;
  final bool inStock;
  final bool onHover;

  const ProductCard({
    super.key,
    required this.onHover,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: onHover ? Colors.black.withOpacity(0.4) : Colors.grey.withOpacity(0.2),
            spreadRadius: onHover ? 6 : 3,
            blurRadius: onHover ? 10 : 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 16,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 2),
            const Row(
              children: [
                Text(
                  'Stock',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  '10',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
