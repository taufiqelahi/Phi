// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

product _$productFromJson(Map<String, dynamic> json) {
  return _product.fromJson(json);
}

/// @nodoc
mixin _$product {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $productCopyWith<product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $productCopyWith<$Res> {
  factory $productCopyWith(product value, $Res Function(product) then) =
      _$productCopyWithImpl<$Res, product>;
  @useResult
  $Res call({String firstName, String lastName, int age});
}

/// @nodoc
class _$productCopyWithImpl<$Res, $Val extends product>
    implements $productCopyWith<$Res> {
  _$productCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? age = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_productCopyWith<$Res> implements $productCopyWith<$Res> {
  factory _$$_productCopyWith(
          _$_product value, $Res Function(_$_product) then) =
      __$$_productCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName, int age});
}

/// @nodoc
class __$$_productCopyWithImpl<$Res>
    extends _$productCopyWithImpl<$Res, _$_product>
    implements _$$_productCopyWith<$Res> {
  __$$_productCopyWithImpl(_$_product _value, $Res Function(_$_product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? age = null,
  }) {
    return _then(_$_product(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_product with DiagnosticableTreeMixin implements _product {
  const _$_product(
      {required this.firstName, required this.lastName, required this.age});

  factory _$_product.fromJson(Map<String, dynamic> json) =>
      _$$_productFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final int age;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'product(firstName: $firstName, lastName: $lastName, age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'product'))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('age', age));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_product &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_productCopyWith<_$_product> get copyWith =>
      __$$_productCopyWithImpl<_$_product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_productToJson(
      this,
    );
  }
}

abstract class _product implements product {
  const factory _product(
      {required final String firstName,
      required final String lastName,
      required final int age}) = _$_product;

  factory _product.fromJson(Map<String, dynamic> json) = _$_product.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  int get age;
  @override
  @JsonKey(ignore: true)
  _$$_productCopyWith<_$_product> get copyWith =>
      throw _privateConstructorUsedError;
}
