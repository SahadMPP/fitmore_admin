import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmore_admin/model/coupon.dart';

class FireStoreCouponService {
  final CollectionReference coupon =
      FirebaseFirestore.instance.collection("coupon");

  Future<void> addNote(Coupon couponDeatile) {
    return coupon.add({
      "name": couponDeatile.name,
      "code": couponDeatile.code,
      "amount": couponDeatile.amount,
      "product": couponDeatile.product
    });
  }

  Stream<QuerySnapshot> getAllNote() {
    final streamNote = coupon.snapshots();
    return streamNote;
  }

  Future<void> updateNote(String id, Coupon couponDeatile) {
    return coupon.doc(id).update({
      "name": couponDeatile.name,
      "code": couponDeatile.code,
      "amount": couponDeatile.amount,
      "product": couponDeatile.product
    });
  }

  Future<void> deleteId(String id) {
    return coupon.doc(id).delete();
  }
}
