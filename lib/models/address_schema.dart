import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front_end/models/field.dart';

part "address_schema.freezed.dart";

@freezed
class AddressSchema with _$AddressSchema {
  const factory AddressSchema({
    required Field<String> country,
    required Field<String> stateName,
    required Field<String> city,
    required Field<String> street,
    required Field<String> postalCode,
  }) = _AddressSchema;

  factory AddressSchema.empty() => AddressSchema(
      country: Field(value: ''),
      stateName: Field(value: ''),
      city: Field(value: ''),
      street: Field(value: ''),
      postalCode: Field(value: ''));
}
