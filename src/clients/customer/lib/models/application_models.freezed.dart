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

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
class _$AddressTearOff {
  const _$AddressTearOff();

  _Address call(
      {String? id,
      required String placeId,
      required double lattitude,
      required double longitute,
      String? street,
      String? city,
      String? state,
      String? postalCode}) {
    return _Address(
      id: id,
      placeId: placeId,
      lattitude: lattitude,
      longitute: longitute,
      street: street,
      city: city,
      state: state,
      postalCode: postalCode,
    );
  }

  Address fromJson(Map<String, Object> json) {
    return Address.fromJson(json);
  }
}

/// @nodoc
const $Address = _$AddressTearOff();

/// @nodoc
mixin _$Address {
  String? get id => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  double get lattitude => throw _privateConstructorUsedError;
  double get longitute => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String placeId,
      double lattitude,
      double longitute,
      String? street,
      String? city,
      String? state,
      String? postalCode});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? placeId = freezed,
    Object? lattitude = freezed,
    Object? longitute = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      lattitude: lattitude == freezed
          ? _value.lattitude
          : lattitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitute: longitute == freezed
          ? _value.longitute
          : longitute // ignore: cast_nullable_to_non_nullable
              as double,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) then) =
      __$AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String placeId,
      double lattitude,
      double longitute,
      String? street,
      String? city,
      String? state,
      String? postalCode});
}

/// @nodoc
class __$AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(_Address _value, $Res Function(_Address) _then)
      : super(_value, (v) => _then(v as _Address));

  @override
  _Address get _value => super._value as _Address;

  @override
  $Res call({
    Object? id = freezed,
    Object? placeId = freezed,
    Object? lattitude = freezed,
    Object? longitute = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_Address(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      lattitude: lattitude == freezed
          ? _value.lattitude
          : lattitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitute: longitute == freezed
          ? _value.longitute
          : longitute // ignore: cast_nullable_to_non_nullable
              as double,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {this.id,
      required this.placeId,
      required this.lattitude,
      required this.longitute,
      this.street,
      this.city,
      this.state,
      this.postalCode});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressFromJson(json);

  @override
  final String? id;
  @override
  final String placeId;
  @override
  final double lattitude;
  @override
  final double longitute;
  @override
  final String? street;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? postalCode;

  @override
  String toString() {
    return 'Address(id: $id, placeId: $placeId, lattitude: $lattitude, longitute: $longitute, street: $street, city: $city, state: $state, postalCode: $postalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Address &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.lattitude, lattitude) ||
                const DeepCollectionEquality()
                    .equals(other.lattitude, lattitude)) &&
            (identical(other.longitute, longitute) ||
                const DeepCollectionEquality()
                    .equals(other.longitute, longitute)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(lattitude) ^
      const DeepCollectionEquality().hash(longitute) ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(postalCode);

  @JsonKey(ignore: true)
  @override
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressToJson(this);
  }
}

abstract class _Address implements Address {
  factory _Address(
      {String? id,
      required String placeId,
      required double lattitude,
      required double longitute,
      String? street,
      String? city,
      String? state,
      String? postalCode}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get placeId => throw _privateConstructorUsedError;
  @override
  double get lattitude => throw _privateConstructorUsedError;
  @override
  double get longitute => throw _privateConstructorUsedError;
  @override
  String? get street => throw _privateConstructorUsedError;
  @override
  String? get city => throw _privateConstructorUsedError;
  @override
  String? get state => throw _privateConstructorUsedError;
  @override
  String? get postalCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddressCopyWith<_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
