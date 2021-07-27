// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    email: json['email'] as String?,
    defaultAddress: json['defaultAddress'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'defaultAddress': instance.defaultAddress,
    };

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    id: json['id'] as String?,
    placeId: json['placeId'] as String,
    lattitude: (json['lattitude'] as num).toDouble(),
    longitute: (json['longitute'] as num).toDouble(),
    street: json['street'] as String?,
    city: json['city'] as String?,
    state: json['state'] as String?,
    postalCode: json['postalCode'] as String?,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeId': instance.placeId,
      'lattitude': instance.lattitude,
      'longitute': instance.longitute,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
    };

_$_Merchant _$_$_MerchantFromJson(Map<String, dynamic> json) {
  return _$_Merchant(
    id: json['id'] as String,
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    image: json['image'] as String?,
    name: json['name'] as String?,
    numberOfRatings: json['numberOfRatings'] as int?,
    rating: (json['rating'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_MerchantToJson(_$_Merchant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categories': instance.categories,
      'image': instance.image,
      'name': instance.name,
      'numberOfRatings': instance.numberOfRatings,
      'rating': instance.rating,
    };
