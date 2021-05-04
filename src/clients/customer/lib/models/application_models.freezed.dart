// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call({required String id, String? email, String? defaultAddress}) {
    return _User(
      id: id,
      email: email,
      defaultAddress: defaultAddress,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get defaultAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({String id, String? email, String? defaultAddress});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? defaultAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAddress: defaultAddress == freezed
          ? _value.defaultAddress
          : defaultAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({String id, String? email, String? defaultAddress});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? defaultAddress = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAddress: defaultAddress == freezed
          ? _value.defaultAddress
          : defaultAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User({required this.id, this.email, this.defaultAddress}) : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? defaultAddress;

  @override
  String toString() {
    return 'User(id: $id, email: $email, defaultAddress: $defaultAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.defaultAddress, defaultAddress) ||
                const DeepCollectionEquality()
                    .equals(other.defaultAddress, defaultAddress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(defaultAddress);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User({required String id, String? email, String? defaultAddress}) =
      _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get defaultAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}

PlacesDetails _$PlacesDetailsFromJson(Map<String, dynamic> json) {
  return _PlacesDetails.fromJson(json);
}

/// @nodoc
class _$PlacesDetailsTearOff {
  const _$PlacesDetailsTearOff();

  _PlacesDetails call(
      {String? placeId,
      String? streetNumber,
      String? streetShort,
      String? streetLong,
      String? state,
      String? zip,
      String? city,
      String? searchString,
      double? lat,
      double? lng}) {
    return _PlacesDetails(
      placeId: placeId,
      streetNumber: streetNumber,
      streetShort: streetShort,
      streetLong: streetLong,
      state: state,
      zip: zip,
      city: city,
      searchString: searchString,
      lat: lat,
      lng: lng,
    );
  }

  PlacesDetails fromJson(Map<String, Object> json) {
    return PlacesDetails.fromJson(json);
  }
}

/// @nodoc
const $PlacesDetails = _$PlacesDetailsTearOff();

/// @nodoc
mixin _$PlacesDetails {
  String? get placeId => throw _privateConstructorUsedError;
  String? get streetNumber => throw _privateConstructorUsedError;
  String? get streetShort => throw _privateConstructorUsedError;
  String? get streetLong => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get zip => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get searchString => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacesDetailsCopyWith<PlacesDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesDetailsCopyWith<$Res> {
  factory $PlacesDetailsCopyWith(
          PlacesDetails value, $Res Function(PlacesDetails) then) =
      _$PlacesDetailsCopyWithImpl<$Res>;
  $Res call(
      {String? placeId,
      String? streetNumber,
      String? streetShort,
      String? streetLong,
      String? state,
      String? zip,
      String? city,
      String? searchString,
      double? lat,
      double? lng});
}

/// @nodoc
class _$PlacesDetailsCopyWithImpl<$Res>
    implements $PlacesDetailsCopyWith<$Res> {
  _$PlacesDetailsCopyWithImpl(this._value, this._then);

  final PlacesDetails _value;
  // ignore: unused_field
  final $Res Function(PlacesDetails) _then;

  @override
  $Res call({
    Object? placeId = freezed,
    Object? streetNumber = freezed,
    Object? streetShort = freezed,
    Object? streetLong = freezed,
    Object? state = freezed,
    Object? zip = freezed,
    Object? city = freezed,
    Object? searchString = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      streetNumber: streetNumber == freezed
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      streetShort: streetShort == freezed
          ? _value.streetShort
          : streetShort // ignore: cast_nullable_to_non_nullable
              as String?,
      streetLong: streetLong == freezed
          ? _value.streetLong
          : streetLong // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      zip: zip == freezed
          ? _value.zip
          : zip // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      searchString: searchString == freezed
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$PlacesDetailsCopyWith<$Res>
    implements $PlacesDetailsCopyWith<$Res> {
  factory _$PlacesDetailsCopyWith(
          _PlacesDetails value, $Res Function(_PlacesDetails) then) =
      __$PlacesDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? placeId,
      String? streetNumber,
      String? streetShort,
      String? streetLong,
      String? state,
      String? zip,
      String? city,
      String? searchString,
      double? lat,
      double? lng});
}

/// @nodoc
class __$PlacesDetailsCopyWithImpl<$Res>
    extends _$PlacesDetailsCopyWithImpl<$Res>
    implements _$PlacesDetailsCopyWith<$Res> {
  __$PlacesDetailsCopyWithImpl(
      _PlacesDetails _value, $Res Function(_PlacesDetails) _then)
      : super(_value, (v) => _then(v as _PlacesDetails));

  @override
  _PlacesDetails get _value => super._value as _PlacesDetails;

  @override
  $Res call({
    Object? placeId = freezed,
    Object? streetNumber = freezed,
    Object? streetShort = freezed,
    Object? streetLong = freezed,
    Object? state = freezed,
    Object? zip = freezed,
    Object? city = freezed,
    Object? searchString = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_PlacesDetails(
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      streetNumber: streetNumber == freezed
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      streetShort: streetShort == freezed
          ? _value.streetShort
          : streetShort // ignore: cast_nullable_to_non_nullable
              as String?,
      streetLong: streetLong == freezed
          ? _value.streetLong
          : streetLong // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      zip: zip == freezed
          ? _value.zip
          : zip // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      searchString: searchString == freezed
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlacesDetails implements _PlacesDetails {
  _$_PlacesDetails(
      {this.placeId,
      this.streetNumber,
      this.streetShort,
      this.streetLong,
      this.state,
      this.zip,
      this.city,
      this.searchString,
      this.lat,
      this.lng});

  factory _$_PlacesDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_PlacesDetailsFromJson(json);

  @override
  final String? placeId;
  @override
  final String? streetNumber;
  @override
  final String? streetShort;
  @override
  final String? streetLong;
  @override
  final String? state;
  @override
  final String? zip;
  @override
  final String? city;
  @override
  final String? searchString;
  @override
  final double? lat;
  @override
  final double? lng;

  @override
  String toString() {
    return 'PlacesDetails(placeId: $placeId, streetNumber: $streetNumber, streetShort: $streetShort, streetLong: $streetLong, state: $state, zip: $zip, city: $city, searchString: $searchString, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlacesDetails &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.streetNumber, streetNumber) ||
                const DeepCollectionEquality()
                    .equals(other.streetNumber, streetNumber)) &&
            (identical(other.streetShort, streetShort) ||
                const DeepCollectionEquality()
                    .equals(other.streetShort, streetShort)) &&
            (identical(other.streetLong, streetLong) ||
                const DeepCollectionEquality()
                    .equals(other.streetLong, streetLong)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.zip, zip) ||
                const DeepCollectionEquality().equals(other.zip, zip)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.searchString, searchString) ||
                const DeepCollectionEquality()
                    .equals(other.searchString, searchString)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lng, lng) ||
                const DeepCollectionEquality().equals(other.lng, lng)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(streetNumber) ^
      const DeepCollectionEquality().hash(streetShort) ^
      const DeepCollectionEquality().hash(streetLong) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(zip) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(searchString) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lng);

  @JsonKey(ignore: true)
  @override
  _$PlacesDetailsCopyWith<_PlacesDetails> get copyWith =>
      __$PlacesDetailsCopyWithImpl<_PlacesDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlacesDetailsToJson(this);
  }
}

abstract class _PlacesDetails implements PlacesDetails {
  factory _PlacesDetails(
      {String? placeId,
      String? streetNumber,
      String? streetShort,
      String? streetLong,
      String? state,
      String? zip,
      String? city,
      String? searchString,
      double? lat,
      double? lng}) = _$_PlacesDetails;

  factory _PlacesDetails.fromJson(Map<String, dynamic> json) =
      _$_PlacesDetails.fromJson;

  @override
  String? get placeId => throw _privateConstructorUsedError;
  @override
  String? get streetNumber => throw _privateConstructorUsedError;
  @override
  String? get streetShort => throw _privateConstructorUsedError;
  @override
  String? get streetLong => throw _privateConstructorUsedError;
  @override
  String? get state => throw _privateConstructorUsedError;
  @override
  String? get zip => throw _privateConstructorUsedError;
  @override
  String? get city => throw _privateConstructorUsedError;
  @override
  String? get searchString => throw _privateConstructorUsedError;
  @override
  double? get lat => throw _privateConstructorUsedError;
  @override
  double? get lng => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlacesDetailsCopyWith<_PlacesDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

PlacesAutoCompleteResult _$PlacesAutoCompleteResultFromJson(
    Map<String, dynamic> json) {
  return _PlacesAutoCompleteResult.fromJson(json);
}

/// @nodoc
class _$PlacesAutoCompleteResultTearOff {
  const _$PlacesAutoCompleteResultTearOff();

  _PlacesAutoCompleteResult call(
      {String? placeId,
      String? mainText,
      String? description,
      String? secondaryText}) {
    return _PlacesAutoCompleteResult(
      placeId: placeId,
      mainText: mainText,
      description: description,
      secondaryText: secondaryText,
    );
  }

  PlacesAutoCompleteResult fromJson(Map<String, Object> json) {
    return PlacesAutoCompleteResult.fromJson(json);
  }
}

/// @nodoc
const $PlacesAutoCompleteResult = _$PlacesAutoCompleteResultTearOff();

/// @nodoc
mixin _$PlacesAutoCompleteResult {
  String? get placeId => throw _privateConstructorUsedError;
  String? get mainText => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get secondaryText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacesAutoCompleteResultCopyWith<PlacesAutoCompleteResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesAutoCompleteResultCopyWith<$Res> {
  factory $PlacesAutoCompleteResultCopyWith(PlacesAutoCompleteResult value,
          $Res Function(PlacesAutoCompleteResult) then) =
      _$PlacesAutoCompleteResultCopyWithImpl<$Res>;
  $Res call(
      {String? placeId,
      String? mainText,
      String? description,
      String? secondaryText});
}

/// @nodoc
class _$PlacesAutoCompleteResultCopyWithImpl<$Res>
    implements $PlacesAutoCompleteResultCopyWith<$Res> {
  _$PlacesAutoCompleteResultCopyWithImpl(this._value, this._then);

  final PlacesAutoCompleteResult _value;
  // ignore: unused_field
  final $Res Function(PlacesAutoCompleteResult) _then;

  @override
  $Res call({
    Object? placeId = freezed,
    Object? mainText = freezed,
    Object? description = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      mainText: mainText == freezed
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryText: secondaryText == freezed
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PlacesAutoCompleteResultCopyWith<$Res>
    implements $PlacesAutoCompleteResultCopyWith<$Res> {
  factory _$PlacesAutoCompleteResultCopyWith(_PlacesAutoCompleteResult value,
          $Res Function(_PlacesAutoCompleteResult) then) =
      __$PlacesAutoCompleteResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? placeId,
      String? mainText,
      String? description,
      String? secondaryText});
}

/// @nodoc
class __$PlacesAutoCompleteResultCopyWithImpl<$Res>
    extends _$PlacesAutoCompleteResultCopyWithImpl<$Res>
    implements _$PlacesAutoCompleteResultCopyWith<$Res> {
  __$PlacesAutoCompleteResultCopyWithImpl(_PlacesAutoCompleteResult _value,
      $Res Function(_PlacesAutoCompleteResult) _then)
      : super(_value, (v) => _then(v as _PlacesAutoCompleteResult));

  @override
  _PlacesAutoCompleteResult get _value =>
      super._value as _PlacesAutoCompleteResult;

  @override
  $Res call({
    Object? placeId = freezed,
    Object? mainText = freezed,
    Object? description = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_PlacesAutoCompleteResult(
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      mainText: mainText == freezed
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryText: secondaryText == freezed
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlacesAutoCompleteResult implements _PlacesAutoCompleteResult {
  _$_PlacesAutoCompleteResult(
      {this.placeId, this.mainText, this.description, this.secondaryText});

  factory _$_PlacesAutoCompleteResult.fromJson(Map<String, dynamic> json) =>
      _$_$_PlacesAutoCompleteResultFromJson(json);

  @override
  final String? placeId;
  @override
  final String? mainText;
  @override
  final String? description;
  @override
  final String? secondaryText;

  @override
  String toString() {
    return 'PlacesAutoCompleteResult(placeId: $placeId, mainText: $mainText, description: $description, secondaryText: $secondaryText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlacesAutoCompleteResult &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.mainText, mainText) ||
                const DeepCollectionEquality()
                    .equals(other.mainText, mainText)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.secondaryText, secondaryText) ||
                const DeepCollectionEquality()
                    .equals(other.secondaryText, secondaryText)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(mainText) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(secondaryText);

  @JsonKey(ignore: true)
  @override
  _$PlacesAutoCompleteResultCopyWith<_PlacesAutoCompleteResult> get copyWith =>
      __$PlacesAutoCompleteResultCopyWithImpl<_PlacesAutoCompleteResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlacesAutoCompleteResultToJson(this);
  }
}

abstract class _PlacesAutoCompleteResult implements PlacesAutoCompleteResult {
  factory _PlacesAutoCompleteResult(
      {String? placeId,
      String? mainText,
      String? description,
      String? secondaryText}) = _$_PlacesAutoCompleteResult;

  factory _PlacesAutoCompleteResult.fromJson(Map<String, dynamic> json) =
      _$_PlacesAutoCompleteResult.fromJson;

  @override
  String? get placeId => throw _privateConstructorUsedError;
  @override
  String? get mainText => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get secondaryText => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlacesAutoCompleteResultCopyWith<_PlacesAutoCompleteResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

  _Location call(
      {required String id,
      double? longitude,
      double? latitude,
      String? placeName}) {
    return _Location(
      id: id,
      longitude: longitude,
      latitude: latitude,
      placeName: placeName,
    );
  }

  Location fromJson(Map<String, Object> json) {
    return Location.fromJson(json);
  }
}

/// @nodoc
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  String get id => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  String? get placeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call(
      {String id, double? longitude, double? latitude, String? placeName});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? placeName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      placeName: placeName == freezed
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, double? longitude, double? latitude, String? placeName});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? placeName = freezed,
  }) {
    return _then(_Location(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      placeName: placeName == freezed
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  _$_Location(
      {required this.id, this.longitude, this.latitude, this.placeName});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$_$_LocationFromJson(json);

  @override
  final String id;
  @override
  final double? longitude;
  @override
  final double? latitude;
  @override
  final String? placeName;

  @override
  String toString() {
    return 'Location(id: $id, longitude: $longitude, latitude: $latitude, placeName: $placeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Location &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.placeName, placeName) ||
                const DeepCollectionEquality()
                    .equals(other.placeName, placeName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(placeName);

  @JsonKey(ignore: true)
  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocationToJson(this);
  }
}

abstract class _Location implements Location {
  factory _Location(
      {required String id,
      double? longitude,
      double? latitude,
      String? placeName}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  double? get longitude => throw _privateConstructorUsedError;
  @override
  double? get latitude => throw _privateConstructorUsedError;
  @override
  String? get placeName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
