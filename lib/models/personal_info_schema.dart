import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front_end/models/field.dart';

part "personal_info_schema.freezed.dart";

enum Gender { male, female }

@freezed
class PersonalInfoSchema with _$PersonalInfoSchema {
  const factory PersonalInfoSchema({
    required Field<String> dateOfBirth,
    required Field<String> gender,
    required Field<String> phone,
  }) = _PersonalInfoSchema;

  factory PersonalInfoSchema.empty() => PersonalInfoSchema(
      dateOfBirth: Field(value: ''),
      gender: Field(value: "male"),
      phone: Field(value: ''));
}
