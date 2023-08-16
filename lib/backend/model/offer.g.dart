// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Offer _$$_OfferFromJson(Map<String, dynamic> json) => _$_Offer(
      discount: (json['discount'] as num).toDouble(),
      id: json['id'] as String,
      productId: json['productId'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_OfferToJson(_$_Offer instance) => <String, dynamic>{
      'discount': instance.discount,
      'id': instance.id,
      'productId': instance.productId,
      'image': instance.image,
    };
