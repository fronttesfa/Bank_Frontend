import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front_end/models/field.dart';

part "account_info_schema.freezed.dart";

@freezed
class AccountInfoSchema with _$AccountInfoSchema {
  const factory AccountInfoSchema({
    required Field<String> fName,
    required Field<String> lName,
    required Field<String> email,
    required Field<String> password,
    required Field<String> confirmPassword,
  }) = _AccountInfoSchema;

  factory AccountInfoSchema.empty() => AccountInfoSchema(
      fName: Field(value: ''),
      lName: Field(value: ''),
      email: Field(value: ''),
      password: Field(value: ''),
      confirmPassword: Field(value: ''));
}
