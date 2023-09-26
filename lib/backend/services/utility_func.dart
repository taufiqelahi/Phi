import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phi/backend/model/shoe_utility.dart';

class UtilityFunc {
  Stream<ShoeUtility> getShoeUtilityStream() {
    return FirebaseFirestore.instance
        .collection('utilities')
        .doc('all')
        .snapshots()
        .map((event) => ShoeUtility(
            sizes: event.data()!['sizes'],
            colors: event.data()!['colors'].cast<String>()));
  }
}
