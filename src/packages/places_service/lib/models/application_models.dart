import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

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
class PlacesLocation with _$PlacesLocation {
  factory PlacesLocation({
    required String id,
    double? longitude,
    double? latitude,
    String? placeName,
  }) = _PlacesLocation;

  factory PlacesLocation.fromJson(Map<String, dynamic> json) =>
      _$PlacesLocationFromJson(json);
}
