// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PersonalInfoSchema {
  Field<String> get dateOfBirth => throw _privateConstructorUsedError;
  Field<String> get gender => throw _privateConstructorUsedError;
  Field<String> get phone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalInfoSchemaCopyWith<PersonalInfoSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInfoSchemaCopyWith<$Res> {
  factory $PersonalInfoSchemaCopyWith(
          PersonalInfoSchema value, $Res Function(PersonalInfoSchema) then) =
      _$PersonalInfoSchemaCopyWithImpl<$Res, PersonalInfoSchema>;
  @useResult
  $Res call(
      {Field<String> dateOfBirth, Field<String> gender, Field<String> phone});

  $FieldCopyWith<String, $Res> get dateOfBirth;
  $FieldCopyWith<String, $Res> get gender;
  $FieldCopyWith<String, $Res> get phone;
}

/// @nodoc
class _$PersonalInfoSchemaCopyWithImpl<$Res, $Val extends PersonalInfoSchema>
    implements $PersonalInfoSchemaCopyWith<$Res> {
  _$PersonalInfoSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateOfBirth = null,
    Object? gender = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Field<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get dateOfBirth {
    return $FieldCopyWith<String, $Res>(_value.dateOfBirth, (value) {
      return _then(_value.copyWith(dateOfBirth: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get gender {
    return $FieldCopyWith<String, $Res>(_value.gender, (value) {
      return _then(_value.copyWith(gender: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get phone {
    return $FieldCopyWith<String, $Res>(_value.phone, (value) {
      return _then(_value.copyWith(phone: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonalInfoSchemaImplCopyWith<$Res>
    implements $PersonalInfoSchemaCopyWith<$Res> {
  factory _$$PersonalInfoSchemaImplCopyWith(_$PersonalInfoSchemaImpl value,
          $Res Function(_$PersonalInfoSchemaImpl) then) =
      __$$PersonalInfoSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Field<String> dateOfBirth, Field<String> gender, Field<String> phone});

  @override
  $FieldCopyWith<String, $Res> get dateOfBirth;
  @override
  $FieldCopyWith<String, $Res> get gender;
  @override
  $FieldCopyWith<String, $Res> get phone;
}

/// @nodoc
class __$$PersonalInfoSchemaImplCopyWithImpl<$Res>
    extends _$PersonalInfoSchemaCopyWithImpl<$Res, _$PersonalInfoSchemaImpl>
    implements _$$PersonalInfoSchemaImplCopyWith<$Res> {
  __$$PersonalInfoSchemaImplCopyWithImpl(_$PersonalInfoSchemaImpl _value,
      $Res Function(_$PersonalInfoSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateOfBirth = null,
    Object? gender = null,
    Object? phone = null,
  }) {
    return _then(_$PersonalInfoSchemaImpl(
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Field<String>,
    ));
  }
}

/// @nodoc

class _$PersonalInfoSchemaImpl implements _PersonalInfoSchema {
  const _$PersonalInfoSchemaImpl(
      {required this.dateOfBirth, required this.gender, required this.phone});

  @override
  final Field<String> dateOfBirth;
  @override
  final Field<String> gender;
  @override
  final Field<String> phone;

  @override
  String toString() {
    return 'PersonalInfoSchema(dateOfBirth: $dateOfBirth, gender: $gender, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalInfoSchemaImpl &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateOfBirth, gender, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalInfoSchemaImplCopyWith<_$PersonalInfoSchemaImpl> get copyWith =>
      __$$PersonalInfoSchemaImplCopyWithImpl<_$PersonalInfoSchemaImpl>(
          this, _$identity);
}

abstract class _PersonalInfoSchema implements PersonalInfoSchema {
  const factory _PersonalInfoSchema(
      {required final Field<String> dateOfBirth,
      required final Field<String> gender,
      required final Field<String> phone}) = _$PersonalInfoSchemaImpl;

  @override
  Field<String> get dateOfBirth;
  @override
  Field<String> get gender;
  @override
  Field<String> get phone;
  @override
  @JsonKey(ignore: true)
  _$$PersonalInfoSchemaImplCopyWith<_$PersonalInfoSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
