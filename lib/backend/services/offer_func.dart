import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phi/backend/model/offer.dart';

class OfferFunc {
  Future<List<Offer>> getAllOffer() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('offers').get();

    return snapshot.docs
        .map((e) => Offer.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
}
