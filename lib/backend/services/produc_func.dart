import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phi/backend/model/product.dart';

class ProductFunc {
  Stream<List<Product>> getAllProduct() {
    return FirebaseFirestore.instance.collection('products').snapshots().map(
        (event) => event.docs.map((e) => Product.fromJson(e.data())).toList());
  }

  addProduct() {}
}
