// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressSchema {
  Field<String> get country => throw _privateConstructorUsedError;
  Field<String> get stateName => throw _privateConstructorUsedError;
  Field<String> get city => throw _privateConstructorUsedError;
  Field<String> get street => throw _privateConstructorUsedError;
  Field<String> get postalCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressSchemaCopyWith<AddressSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressSchemaCopyWith<$Res> {
  factory $AddressSchemaCopyWith(
          AddressSchema value, $Res Function(AddressSchema) then) =
      _$AddressSchemaCopyWithImpl<$Res, AddressSchema>;
  @useResult
  $Res call(
      {Field<String> country,
      Field<String> stateName,
      Field<String> city,
      Field<String> street,
      Field<String> postalCode});

  $FieldCopyWith<String, $Res> get country;
  $FieldCopyWith<String, $Res> get stateName;
  $FieldCopyWith<String, $Res> get city;
  $FieldCopyWith<String, $Res> get street;
  $FieldCopyWith<String, $Res> get postalCode;
}

/// @nodoc
class _$AddressSchemaCopyWithImpl<$Res, $Val extends AddressSchema>
    implements $AddressSchemaCopyWith<$Res> {
  _$AddressSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? stateName = null,
    Object? city = null,
    Object? street = null,
    Object? postalCode = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      stateName: null == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as Field<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get country {
    return $FieldCopyWith<String, $Res>(_value.country, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get stateName {
    return $FieldCopyWith<String, $Res>(_value.stateName, (value) {
      return _then(_value.copyWith(stateName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get city {
    return $FieldCopyWith<String, $Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get street {
    return $FieldCopyWith<String, $Res>(_value.street, (value) {
      return _then(_value.copyWith(street: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get postalCode {
    return $FieldCopyWith<String, $Res>(_value.postalCode, (value) {
      return _then(_value.copyWith(postalCode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressSchemaImplCopyWith<$Res>
    implements $AddressSchemaCopyWith<$Res> {
  factory _$$AddressSchemaImplCopyWith(
          _$AddressSchemaImpl value, $Res Function(_$AddressSchemaImpl) then) =
      __$$AddressSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Field<String> country,
      Field<String> stateName,
      Field<String> city,
      Field<String> street,
      Field<String> postalCode});

  @override
  $FieldCopyWith<String, $Res> get country;
  @override
  $FieldCopyWith<String, $Res> get stateName;
  @override
  $FieldCopyWith<String, $Res> get city;
  @override
  $FieldCopyWith<String, $Res> get street;
  @override
  $FieldCopyWith<String, $Res> get postalCode;
}

/// @nodoc
class __$$AddressSchemaImplCopyWithImpl<$Res>
    extends _$AddressSchemaCopyWithImpl<$Res, _$AddressSchemaImpl>
    implements _$$AddressSchemaImplCopyWith<$Res> {
  __$$AddressSchemaImplCopyWithImpl(
      _$AddressSchemaImpl _value, $Res Function(_$AddressSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? stateName = null,
    Object? city = null,
    Object? street = null,
    Object? postalCode = null,
  }) {
    return _then(_$AddressSchemaImpl(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      stateName: null == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as Field<String>,
    ));
  }
}

/// @nodoc

class _$AddressSchemaImpl implements _AddressSchema {
  const _$AddressSchemaImpl(
      {required this.country,
      required this.stateName,
      required this.city,
      required this.street,
      required this.postalCode});

  @override
  final Field<String> country;
  @override
  final Field<String> stateName;
  @override
  final Field<String> city;
  @override
  final Field<String> street;
  @override
  final Field<String> postalCode;

  @override
  String toString() {
    return 'AddressSchema(country: $country, stateName: $stateName, city: $city, street: $street, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressSchemaImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, country, stateName, city, street, postalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressSchemaImplCopyWith<_$AddressSchemaImpl> get copyWith =>
      __$$AddressSchemaImplCopyWithImpl<_$AddressSchemaImpl>(this, _$identity);
}

abstract class _AddressSchema implements AddressSchema {
  const factory _AddressSchema(
      {required final Field<String> country,
      required final Field<String> stateName,
      required final Field<String> city,
      required final Field<String> street,
      required final Field<String> postalCode}) = _$AddressSchemaImpl;

  @override
  Field<String> get country;
  @override
  Field<String> get stateName;
  @override
  Field<String> get city;
  @override
  Field<String> get street;
  @override
  Field<String> get postalCode;
  @override
  @JsonKey(ignore: true)
  _$$AddressSchemaImplCopyWith<_$AddressSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
