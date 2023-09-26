// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:phi/backend/model/product.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'cart_item_count_controller.g.dart';
//
import 'package:get/get.dart';

class CartItemCountController extends GetxController {
  var count = 0.obs;
  addItem() {
    count++;
    print(count);
  }

  removeItem() {
    count--;
  }
}
//
//
//   @riverpod
//   Stream<List<Product>> getAProduct({required String productId}) async* {
//     var allMessages = const <Product>[];
//
//     Stream<Product> p=FirebaseFirestore.instance
//         .collection('products')
//         .doc(productId)
//         .snapshots()
//         .map((event) => Product.fromJson(event.data() as Map<String, dynamic>));
//
//     await for (final n in p) {
//       // A new message has been received. Let's add it to the list of all messages.
//       allMessages = [...allMessages, n];
//       yield allMessages;
//     }
//   }
//
