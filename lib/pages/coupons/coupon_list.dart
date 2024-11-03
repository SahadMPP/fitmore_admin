import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../dashboard/widget/header_widget.dart';

class CouponList extends StatefulWidget {
  const CouponList({super.key});

  @override
  State<CouponList> createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  int hoveredIndex = -1; // Initialize with -1 to indicate no hover
  CollectionReference conf = FirebaseFirestore.instance.collection('coupon');
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
                title: 'Coupon List',
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: getAllNote(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List notes = snapshot.data!.docs;
                      return ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot document = notes[index];
                            // String documentId = document.id;
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            String noteText = data['name'];
                            return MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  hoveredIndex = index;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  hoveredIndex = -1;
                                });
                              },
                              child: Container(
                                color: hoveredIndex == index
                                    ? AppColor
                                        .yellow // Change background on hover
                                    : Colors.transparent,
                                child: ListTile(
                                  title: Text(
                                    noteText,
                                    style: TextStyle(
                                      color: hoveredIndex == index
                                          ? Colors
                                              .white // Highlight color on hover
                                          : Colors.black,
                                    ),
                                  ),
                                  subtitle: Divider(
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: Text('No Notes'));
                    }
                  },
                ),
                // child: ListView.builder(
                //   itemCount: 10, // specify the number of coupons
                //   itemBuilder: (context, index) {
                //     return MouseRegion(
                //       onEnter: (_) {
                //         setState(() {
                //           hoveredIndex = index;
                //         });
                //       },
                //       onExit: (_) {
                //         setState(() {
                //           hoveredIndex = -1;
                //         });
                //       },
                //       child: Container(
                //         color: hoveredIndex == index
                //             ? AppColor.yellow // Change background on hover
                //             : Colors.transparent,
                //         child: ListTile(
                //           title: Text(
                //             'Coupon Code ABCD',
                //             style: TextStyle(
                //               color: hoveredIndex == index
                //                   ? Colors.white // Highlight color on hover
                //                   : Colors.black,
                //             ),
                //           ),
                //           subtitle: Divider(
                //             color: Colors.grey[300],
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: AppColor.yellow,
              child: InkWell(
                onTap: () {
                  //adding to Firebase
                  conf.add({'id': 2, 'name': 'EFGH'});
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
