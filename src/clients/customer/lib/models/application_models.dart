import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
class User with _$User {
  User._();

  factory User({
    required String id,
    String? email,
    String? defaultAddress,
  }) = _User;

  bool get hasAddress => defaultAddress?.isNotEmpty ?? false;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class PlacesDetails with _$PlacesDetails {
  factory PlacesDetails({
    String? placeId,
    String? streetNumber,
    String? streetShort,
    String? streetLong,
    String? state,
    String? zip,
    String? city,
    String? searchString,
    double? lat,
    double? lng,
  }) = _PlacesDetails;

  factory PlacesDetails.fromJson(Map<String, dynamic> json) =>
      _$PlacesDetailsFromJson(json);

  static Map<String, dynamic>? locationToJson(Location? data) => data?.toJson();
}

@freezed
class PlacesAutoCompleteResult with _$PlacesAutoCompleteResult {
  factory PlacesAutoCompleteResult({
    String? placeId,
    String? mainText,
    String? description,
    String? secondaryText,
  }) = _PlacesAutoCompleteResult;

  factory PlacesAutoCompleteResult.fromJson(Map<String, dynamic> json) =>
      _$PlacesAutoCompleteResultFromJson(json);
}

@freezed
class Location with _$Location {
  factory Location({
    required String id,
    double? longitude,
    double? latitude,
    String? placeName,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
