// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      category: json['category'] as String,
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'category': instance.category,
      'id': instance.id,
      'price': instance.price,
      'title': instance.title,
      'image': instance.image,
    };
