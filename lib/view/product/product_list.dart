import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmore_admin/view/product/product_adding.dart';
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

  CollectionReference conf = FirebaseFirestore.instance.collection('product');

  Stream<QuerySnapshot> getAllNote() {
    final streamNote = conf.snapshots();
    return streamNote;
  }

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
                child: StreamBuilder(
                    stream: getAllNote(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List notes = snapshot.data!.docs;

                        return GridView.builder(
                          itemCount: notes.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  mainAxisSpacing: 14,
                                  crossAxisSpacing: 14),
                          itemBuilder: (context, index) {
                            DocumentSnapshot document = notes[index];
                            // String documentId = document.id;
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
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
                                imageUrl:
                                    data['image2'], // Replace with actual image URL
                                name:data['title'],
                                price:data['price'],
                                rating: 4.5,
                                inStock: true,
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return const Center(child: Text('No Notes'));
                      }
                    }),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddingProduct(),
              )),
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
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: onHover
                ? Colors.black.withOpacity(0.4)
                : Colors.grey.withOpacity(0.2),
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
                color: Colors.white,
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
