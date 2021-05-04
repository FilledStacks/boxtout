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
