// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'product.freezed.dart';
// optional: Since our Product class is serializable, we must add this line.
// But if Product was not serializable, we could skip it.
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String category,
    required String id,
    required double price,
    required String title,
    required String image,
    required dynamic size
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json)
  => _$ProductFromJson(json);
}