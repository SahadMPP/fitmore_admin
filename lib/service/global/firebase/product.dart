import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmore_admin/model/product.dart';

class FireStoreProductService {
  final CollectionReference product =
      FirebaseFirestore.instance.collection("product");

  Future<void> addNote(Product productDeatiles) {

    return product.add({
      "category": productDeatiles.category,
      "description": productDeatiles.description,
      "id": productDeatiles.id,
      "image1":
          productDeatiles.image1,
      "image2":
          productDeatiles.image2,
      "image3":
          productDeatiles.image3,
      "image4":
         productDeatiles.image4,
      "price": productDeatiles.price,
      "productCount": productDeatiles.productCount,
      "title": productDeatiles.title
    });
  
  }

  Stream<QuerySnapshot> getAllNote() {
    final streamNote = product.snapshots();
    return streamNote;
  }

  Future<void> updateNote(String id, Product productDeatiles) {
    return product.doc(id).update({
      "category": productDeatiles.category,
      "description": productDeatiles.description,
      "id": productDeatiles.id,
      "image1":
          productDeatiles.image1,
      "image2":
          productDeatiles.image2,
      "image3":
          productDeatiles.image3,
      "image4":
         productDeatiles.image4,
      "price": productDeatiles.price,
      "productCount": productDeatiles.productCount,
      "title": productDeatiles.title
    });
  }

  Future<void> deleteId(String id) {
    return product.doc(id).delete();
  }
}
