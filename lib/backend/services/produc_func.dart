import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phi/backend/model/product.dart';

class ProductFunc {
  Stream<List<Product>> getAllProducts({required String category}) {
    if (category.toLowerCase() == "all") {
      return FirebaseFirestore.instance.collection('products').snapshots().map(
          (event) =>
              event.docs.map((e) => Product.fromJson(e.data())).toList());
    } else {
      return FirebaseFirestore.instance
          .collection('products')
          .where("category", isEqualTo: category.toLowerCase())
          .snapshots()
          .map((event) =>
              event.docs.map((e) => Product.fromJson(e.data())).toList());
    }
  }

  Stream<Product> getAProduct({required String productId}) {
    return FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .snapshots()
        .map((event) => Product.fromJson(event.data() as Map<String, dynamic>));
  }

  addProduct() {}
}
