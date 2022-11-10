// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_LoginObject>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$_LoginObject(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String userName, final String password) =
      _$_LoginObject;

  @override
  String get userName;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddUserObject {
  PickerFile? get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddUserObjectCopyWith<AddUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddUserObjectCopyWith<$Res> {
  factory $AddUserObjectCopyWith(
          AddUserObject value, $Res Function(AddUserObject) then) =
      _$AddUserObjectCopyWithImpl<$Res, AddUserObject>;
  @useResult
  $Res call(
      {PickerFile? image,
      String name,
      String role,
      String password,
      String username});
}

/// @nodoc
class _$AddUserObjectCopyWithImpl<$Res, $Val extends AddUserObject>
    implements $AddUserObjectCopyWith<$Res> {
  _$AddUserObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = null,
    Object? role = null,
    Object? password = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddUserObjectCopyWith<$Res>
    implements $AddUserObjectCopyWith<$Res> {
  factory _$$_AddUserObjectCopyWith(
          _$_AddUserObject value, $Res Function(_$_AddUserObject) then) =
      __$$_AddUserObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PickerFile? image,
      String name,
      String role,
      String password,
      String username});
}

/// @nodoc
class __$$_AddUserObjectCopyWithImpl<$Res>
    extends _$AddUserObjectCopyWithImpl<$Res, _$_AddUserObject>
    implements _$$_AddUserObjectCopyWith<$Res> {
  __$$_AddUserObjectCopyWithImpl(
      _$_AddUserObject _value, $Res Function(_$_AddUserObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = null,
    Object? role = null,
    Object? password = null,
    Object? username = null,
  }) {
    return _then(_$_AddUserObject(
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddUserObject implements _AddUserObject {
  _$_AddUserObject(
      this.image, this.name, this.role, this.password, this.username);

  @override
  final PickerFile? image;
  @override
  final String name;
  @override
  final String role;
  @override
  final String password;
  @override
  final String username;

  @override
  String toString() {
    return 'AddUserObject(image: $image, name: $name, role: $role, password: $password, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddUserObject &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, image, name, role, password, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddUserObjectCopyWith<_$_AddUserObject> get copyWith =>
      __$$_AddUserObjectCopyWithImpl<_$_AddUserObject>(this, _$identity);
}

abstract class _AddUserObject implements AddUserObject {
  factory _AddUserObject(
      final PickerFile? image,
      final String name,
      final String role,
      final String password,
      final String username) = _$_AddUserObject;

  @override
  PickerFile? get image;
  @override
  String get name;
  @override
  String get role;
  @override
  String get password;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$_AddUserObjectCopyWith<_$_AddUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateUserObject {
  PickerFile? get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateUserObjectCopyWith<UpdateUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserObjectCopyWith<$Res> {
  factory $UpdateUserObjectCopyWith(
          UpdateUserObject value, $Res Function(UpdateUserObject) then) =
      _$UpdateUserObjectCopyWithImpl<$Res, UpdateUserObject>;
  @useResult
  $Res call({PickerFile? image, String name, UserRole role, String username});
}

/// @nodoc
class _$UpdateUserObjectCopyWithImpl<$Res, $Val extends UpdateUserObject>
    implements $UpdateUserObjectCopyWith<$Res> {
  _$UpdateUserObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = null,
    Object? role = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateUserObjectCopyWith<$Res>
    implements $UpdateUserObjectCopyWith<$Res> {
  factory _$$_UpdateUserObjectCopyWith(
          _$_UpdateUserObject value, $Res Function(_$_UpdateUserObject) then) =
      __$$_UpdateUserObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PickerFile? image, String name, UserRole role, String username});
}

/// @nodoc
class __$$_UpdateUserObjectCopyWithImpl<$Res>
    extends _$UpdateUserObjectCopyWithImpl<$Res, _$_UpdateUserObject>
    implements _$$_UpdateUserObjectCopyWith<$Res> {
  __$$_UpdateUserObjectCopyWithImpl(
      _$_UpdateUserObject _value, $Res Function(_$_UpdateUserObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = null,
    Object? role = null,
    Object? username = null,
  }) {
    return _then(_$_UpdateUserObject(
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateUserObject implements _UpdateUserObject {
  _$_UpdateUserObject(this.image, this.name, this.role, this.username);

  @override
  final PickerFile? image;
  @override
  final String name;
  @override
  final UserRole role;
  @override
  final String username;

  @override
  String toString() {
    return 'UpdateUserObject(image: $image, name: $name, role: $role, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserObject &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, name, role, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateUserObjectCopyWith<_$_UpdateUserObject> get copyWith =>
      __$$_UpdateUserObjectCopyWithImpl<_$_UpdateUserObject>(this, _$identity);
}

abstract class _UpdateUserObject implements UpdateUserObject {
  factory _UpdateUserObject(final PickerFile? image, final String name,
      final UserRole role, final String username) = _$_UpdateUserObject;

  @override
  PickerFile? get image;
  @override
  String get name;
  @override
  UserRole get role;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateUserObjectCopyWith<_$_UpdateUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddCategoryObject {
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCategoryObjectCopyWith<AddCategoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryObjectCopyWith<$Res> {
  factory $AddCategoryObjectCopyWith(
          AddCategoryObject value, $Res Function(AddCategoryObject) then) =
      _$AddCategoryObjectCopyWithImpl<$Res, AddCategoryObject>;
  @useResult
  $Res call({String color, PickerFile? image, String label});
}

/// @nodoc
class _$AddCategoryObjectCopyWithImpl<$Res, $Val extends AddCategoryObject>
    implements $AddCategoryObjectCopyWith<$Res> {
  _$AddCategoryObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? image = freezed,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddCategoryObjectCopyWith<$Res>
    implements $AddCategoryObjectCopyWith<$Res> {
  factory _$$_AddCategoryObjectCopyWith(_$_AddCategoryObject value,
          $Res Function(_$_AddCategoryObject) then) =
      __$$_AddCategoryObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String color, PickerFile? image, String label});
}

/// @nodoc
class __$$_AddCategoryObjectCopyWithImpl<$Res>
    extends _$AddCategoryObjectCopyWithImpl<$Res, _$_AddCategoryObject>
    implements _$$_AddCategoryObjectCopyWith<$Res> {
  __$$_AddCategoryObjectCopyWithImpl(
      _$_AddCategoryObject _value, $Res Function(_$_AddCategoryObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? image = freezed,
    Object? label = null,
  }) {
    return _then(_$_AddCategoryObject(
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddCategoryObject implements _AddCategoryObject {
  _$_AddCategoryObject(this.color, this.image, this.label);

  @override
  final String color;
  @override
  final PickerFile? image;
  @override
  final String label;

  @override
  String toString() {
    return 'AddCategoryObject(color: $color, image: $image, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCategoryObject &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, image, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddCategoryObjectCopyWith<_$_AddCategoryObject> get copyWith =>
      __$$_AddCategoryObjectCopyWithImpl<_$_AddCategoryObject>(
          this, _$identity);
}

abstract class _AddCategoryObject implements AddCategoryObject {
  factory _AddCategoryObject(
          final String color, final PickerFile? image, final String label) =
      _$_AddCategoryObject;

  @override
  String get color;
  @override
  PickerFile? get image;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$_AddCategoryObjectCopyWith<_$_AddCategoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddSupplementObject {
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddSupplementObjectCopyWith<AddSupplementObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSupplementObjectCopyWith<$Res> {
  factory $AddSupplementObjectCopyWith(
          AddSupplementObject value, $Res Function(AddSupplementObject) then) =
      _$AddSupplementObjectCopyWithImpl<$Res, AddSupplementObject>;
  @useResult
  $Res call({String color, PickerFile? image, String price, String title});
}

/// @nodoc
class _$AddSupplementObjectCopyWithImpl<$Res, $Val extends AddSupplementObject>
    implements $AddSupplementObjectCopyWith<$Res> {
  _$AddSupplementObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddSupplementObjectCopyWith<$Res>
    implements $AddSupplementObjectCopyWith<$Res> {
  factory _$$_AddSupplementObjectCopyWith(_$_AddSupplementObject value,
          $Res Function(_$_AddSupplementObject) then) =
      __$$_AddSupplementObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String color, PickerFile? image, String price, String title});
}

/// @nodoc
class __$$_AddSupplementObjectCopyWithImpl<$Res>
    extends _$AddSupplementObjectCopyWithImpl<$Res, _$_AddSupplementObject>
    implements _$$_AddSupplementObjectCopyWith<$Res> {
  __$$_AddSupplementObjectCopyWithImpl(_$_AddSupplementObject _value,
      $Res Function(_$_AddSupplementObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_$_AddSupplementObject(
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddSupplementObject implements _AddSupplementObject {
  _$_AddSupplementObject(this.color, this.image, this.price, this.title);

  @override
  final String color;
  @override
  final PickerFile? image;
  @override
  final String price;
  @override
  final String title;

  @override
  String toString() {
    return 'AddSupplementObject(color: $color, image: $image, price: $price, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddSupplementObject &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, image, price, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddSupplementObjectCopyWith<_$_AddSupplementObject> get copyWith =>
      __$$_AddSupplementObjectCopyWithImpl<_$_AddSupplementObject>(
          this, _$identity);
}

abstract class _AddSupplementObject implements AddSupplementObject {
  factory _AddSupplementObject(final String color, final PickerFile? image,
      final String price, final String title) = _$_AddSupplementObject;

  @override
  String get color;
  @override
  PickerFile? get image;
  @override
  String get price;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_AddSupplementObjectCopyWith<_$_AddSupplementObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddProductObject {
  String get categoryId => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProductObjectCopyWith<AddProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductObjectCopyWith<$Res> {
  factory $AddProductObjectCopyWith(
          AddProductObject value, $Res Function(AddProductObject) then) =
      _$AddProductObjectCopyWithImpl<$Res, AddProductObject>;
  @useResult
  $Res call(
      {String categoryId,
      String color,
      PickerFile? image,
      String price,
      String title});
}

/// @nodoc
class _$AddProductObjectCopyWithImpl<$Res, $Val extends AddProductObject>
    implements $AddProductObjectCopyWith<$Res> {
  _$AddProductObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? color = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddProductObjectCopyWith<$Res>
    implements $AddProductObjectCopyWith<$Res> {
  factory _$$_AddProductObjectCopyWith(
          _$_AddProductObject value, $Res Function(_$_AddProductObject) then) =
      __$$_AddProductObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryId,
      String color,
      PickerFile? image,
      String price,
      String title});
}

/// @nodoc
class __$$_AddProductObjectCopyWithImpl<$Res>
    extends _$AddProductObjectCopyWithImpl<$Res, _$_AddProductObject>
    implements _$$_AddProductObjectCopyWith<$Res> {
  __$$_AddProductObjectCopyWithImpl(
      _$_AddProductObject _value, $Res Function(_$_AddProductObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? color = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_$_AddProductObject(
      null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddProductObject implements _AddProductObject {
  _$_AddProductObject(
      this.categoryId, this.color, this.image, this.price, this.title);

  @override
  final String categoryId;
  @override
  final String color;
  @override
  final PickerFile? image;
  @override
  final String price;
  @override
  final String title;

  @override
  String toString() {
    return 'AddProductObject(categoryId: $categoryId, color: $color, image: $image, price: $price, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddProductObject &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, color, image, price, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddProductObjectCopyWith<_$_AddProductObject> get copyWith =>
      __$$_AddProductObjectCopyWithImpl<_$_AddProductObject>(this, _$identity);
}

abstract class _AddProductObject implements AddProductObject {
  factory _AddProductObject(
      final String categoryId,
      final String color,
      final PickerFile? image,
      final String price,
      final String title) = _$_AddProductObject;

  @override
  String get categoryId;
  @override
  String get color;
  @override
  PickerFile? get image;
  @override
  String get price;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_AddProductObjectCopyWith<_$_AddProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateSupplementObject {
  String get id => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateSupplementObjectCopyWith<UpdateSupplementObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSupplementObjectCopyWith<$Res> {
  factory $UpdateSupplementObjectCopyWith(UpdateSupplementObject value,
          $Res Function(UpdateSupplementObject) then) =
      _$UpdateSupplementObjectCopyWithImpl<$Res, UpdateSupplementObject>;
  @useResult
  $Res call(
      {String id, String color, PickerFile? image, String price, String title});
}

/// @nodoc
class _$UpdateSupplementObjectCopyWithImpl<$Res,
        $Val extends UpdateSupplementObject>
    implements $UpdateSupplementObjectCopyWith<$Res> {
  _$UpdateSupplementObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateSupplementObjectCopyWith<$Res>
    implements $UpdateSupplementObjectCopyWith<$Res> {
  factory _$$_UpdateSupplementObjectCopyWith(_$_UpdateSupplementObject value,
          $Res Function(_$_UpdateSupplementObject) then) =
      __$$_UpdateSupplementObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String color, PickerFile? image, String price, String title});
}

/// @nodoc
class __$$_UpdateSupplementObjectCopyWithImpl<$Res>
    extends _$UpdateSupplementObjectCopyWithImpl<$Res,
        _$_UpdateSupplementObject>
    implements _$$_UpdateSupplementObjectCopyWith<$Res> {
  __$$_UpdateSupplementObjectCopyWithImpl(_$_UpdateSupplementObject _value,
      $Res Function(_$_UpdateSupplementObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_$_UpdateSupplementObject(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateSupplementObject implements _UpdateSupplementObject {
  _$_UpdateSupplementObject(
      this.id, this.color, this.image, this.price, this.title);

  @override
  final String id;
  @override
  final String color;
  @override
  final PickerFile? image;
  @override
  final String price;
  @override
  final String title;

  @override
  String toString() {
    return 'UpdateSupplementObject(id: $id, color: $color, image: $image, price: $price, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateSupplementObject &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, color, image, price, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateSupplementObjectCopyWith<_$_UpdateSupplementObject> get copyWith =>
      __$$_UpdateSupplementObjectCopyWithImpl<_$_UpdateSupplementObject>(
          this, _$identity);
}

abstract class _UpdateSupplementObject implements UpdateSupplementObject {
  factory _UpdateSupplementObject(
      final String id,
      final String color,
      final PickerFile? image,
      final String price,
      final String title) = _$_UpdateSupplementObject;

  @override
  String get id;
  @override
  String get color;
  @override
  PickerFile? get image;
  @override
  String get price;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateSupplementObjectCopyWith<_$_UpdateSupplementObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateCategoryObject {
  String get id => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateCategoryObjectCopyWith<UpdateCategoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCategoryObjectCopyWith<$Res> {
  factory $UpdateCategoryObjectCopyWith(UpdateCategoryObject value,
          $Res Function(UpdateCategoryObject) then) =
      _$UpdateCategoryObjectCopyWithImpl<$Res, UpdateCategoryObject>;
  @useResult
  $Res call({String id, String color, PickerFile? image, String label});
}

/// @nodoc
class _$UpdateCategoryObjectCopyWithImpl<$Res,
        $Val extends UpdateCategoryObject>
    implements $UpdateCategoryObjectCopyWith<$Res> {
  _$UpdateCategoryObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
    Object? image = freezed,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateCategoryObjectCopyWith<$Res>
    implements $UpdateCategoryObjectCopyWith<$Res> {
  factory _$$_UpdateCategoryObjectCopyWith(_$_UpdateCategoryObject value,
          $Res Function(_$_UpdateCategoryObject) then) =
      __$$_UpdateCategoryObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String color, PickerFile? image, String label});
}

/// @nodoc
class __$$_UpdateCategoryObjectCopyWithImpl<$Res>
    extends _$UpdateCategoryObjectCopyWithImpl<$Res, _$_UpdateCategoryObject>
    implements _$$_UpdateCategoryObjectCopyWith<$Res> {
  __$$_UpdateCategoryObjectCopyWithImpl(_$_UpdateCategoryObject _value,
      $Res Function(_$_UpdateCategoryObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
    Object? image = freezed,
    Object? label = null,
  }) {
    return _then(_$_UpdateCategoryObject(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateCategoryObject implements _UpdateCategoryObject {
  _$_UpdateCategoryObject(this.id, this.color, this.image, this.label);

  @override
  final String id;
  @override
  final String color;
  @override
  final PickerFile? image;
  @override
  final String label;

  @override
  String toString() {
    return 'UpdateCategoryObject(id: $id, color: $color, image: $image, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateCategoryObject &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, color, image, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCategoryObjectCopyWith<_$_UpdateCategoryObject> get copyWith =>
      __$$_UpdateCategoryObjectCopyWithImpl<_$_UpdateCategoryObject>(
          this, _$identity);
}

abstract class _UpdateCategoryObject implements UpdateCategoryObject {
  factory _UpdateCategoryObject(final String id, final String color,
      final PickerFile? image, final String label) = _$_UpdateCategoryObject;

  @override
  String get id;
  @override
  String get color;
  @override
  PickerFile? get image;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateCategoryObjectCopyWith<_$_UpdateCategoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateProductObject {
  String get id => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateProductObjectCopyWith<UpdateProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProductObjectCopyWith<$Res> {
  factory $UpdateProductObjectCopyWith(
          UpdateProductObject value, $Res Function(UpdateProductObject) then) =
      _$UpdateProductObjectCopyWithImpl<$Res, UpdateProductObject>;
  @useResult
  $Res call(
      {String id,
      String categoryId,
      String color,
      PickerFile? image,
      String price,
      String title});
}

/// @nodoc
class _$UpdateProductObjectCopyWithImpl<$Res, $Val extends UpdateProductObject>
    implements $UpdateProductObjectCopyWith<$Res> {
  _$UpdateProductObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? color = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateProductObjectCopyWith<$Res>
    implements $UpdateProductObjectCopyWith<$Res> {
  factory _$$_UpdateProductObjectCopyWith(_$_UpdateProductObject value,
          $Res Function(_$_UpdateProductObject) then) =
      __$$_UpdateProductObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String categoryId,
      String color,
      PickerFile? image,
      String price,
      String title});
}

/// @nodoc
class __$$_UpdateProductObjectCopyWithImpl<$Res>
    extends _$UpdateProductObjectCopyWithImpl<$Res, _$_UpdateProductObject>
    implements _$$_UpdateProductObjectCopyWith<$Res> {
  __$$_UpdateProductObjectCopyWithImpl(_$_UpdateProductObject _value,
      $Res Function(_$_UpdateProductObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? color = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
  }) {
    return _then(_$_UpdateProductObject(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateProductObject implements _UpdateProductObject {
  _$_UpdateProductObject(
      this.id, this.categoryId, this.color, this.image, this.price, this.title);

  @override
  final String id;
  @override
  final String categoryId;
  @override
  final String color;
  @override
  final PickerFile? image;
  @override
  final String price;
  @override
  final String title;

  @override
  String toString() {
    return 'UpdateProductObject(id: $id, categoryId: $categoryId, color: $color, image: $image, price: $price, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateProductObject &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, categoryId, color, image, price, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateProductObjectCopyWith<_$_UpdateProductObject> get copyWith =>
      __$$_UpdateProductObjectCopyWithImpl<_$_UpdateProductObject>(
          this, _$identity);
}

abstract class _UpdateProductObject implements UpdateProductObject {
  factory _UpdateProductObject(
      final String id,
      final String categoryId,
      final String color,
      final PickerFile? image,
      final String price,
      final String title) = _$_UpdateProductObject;

  @override
  String get id;
  @override
  String get categoryId;
  @override
  String get color;
  @override
  PickerFile? get image;
  @override
  String get price;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateProductObjectCopyWith<_$_UpdateProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddSupplementsToProductObject {
  List<int> get selectedSupplements => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddSupplementsToProductObjectCopyWith<AddSupplementsToProductObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSupplementsToProductObjectCopyWith<$Res> {
  factory $AddSupplementsToProductObjectCopyWith(
          AddSupplementsToProductObject value,
          $Res Function(AddSupplementsToProductObject) then) =
      _$AddSupplementsToProductObjectCopyWithImpl<$Res,
          AddSupplementsToProductObject>;
  @useResult
  $Res call({List<int> selectedSupplements});
}

/// @nodoc
class _$AddSupplementsToProductObjectCopyWithImpl<$Res,
        $Val extends AddSupplementsToProductObject>
    implements $AddSupplementsToProductObjectCopyWith<$Res> {
  _$AddSupplementsToProductObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSupplements = null,
  }) {
    return _then(_value.copyWith(
      selectedSupplements: null == selectedSupplements
          ? _value.selectedSupplements
          : selectedSupplements // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddSupplementsToProductObjectCopyWith<$Res>
    implements $AddSupplementsToProductObjectCopyWith<$Res> {
  factory _$$_AddSupplementsToProductObjectCopyWith(
          _$_AddSupplementsToProductObject value,
          $Res Function(_$_AddSupplementsToProductObject) then) =
      __$$_AddSupplementsToProductObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> selectedSupplements});
}

/// @nodoc
class __$$_AddSupplementsToProductObjectCopyWithImpl<$Res>
    extends _$AddSupplementsToProductObjectCopyWithImpl<$Res,
        _$_AddSupplementsToProductObject>
    implements _$$_AddSupplementsToProductObjectCopyWith<$Res> {
  __$$_AddSupplementsToProductObjectCopyWithImpl(
      _$_AddSupplementsToProductObject _value,
      $Res Function(_$_AddSupplementsToProductObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSupplements = null,
  }) {
    return _then(_$_AddSupplementsToProductObject(
      null == selectedSupplements
          ? _value._selectedSupplements
          : selectedSupplements // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_AddSupplementsToProductObject
    implements _AddSupplementsToProductObject {
  _$_AddSupplementsToProductObject(final List<int> selectedSupplements)
      : _selectedSupplements = selectedSupplements;

  final List<int> _selectedSupplements;
  @override
  List<int> get selectedSupplements {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSupplements);
  }

  @override
  String toString() {
    return 'AddSupplementsToProductObject(selectedSupplements: $selectedSupplements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddSupplementsToProductObject &&
            const DeepCollectionEquality()
                .equals(other._selectedSupplements, _selectedSupplements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedSupplements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddSupplementsToProductObjectCopyWith<_$_AddSupplementsToProductObject>
      get copyWith => __$$_AddSupplementsToProductObjectCopyWithImpl<
          _$_AddSupplementsToProductObject>(this, _$identity);
}

abstract class _AddSupplementsToProductObject
    implements AddSupplementsToProductObject {
  factory _AddSupplementsToProductObject(final List<int> selectedSupplements) =
      _$_AddSupplementsToProductObject;

  @override
  List<int> get selectedSupplements;
  @override
  @JsonKey(ignore: true)
  _$$_AddSupplementsToProductObjectCopyWith<_$_AddSupplementsToProductObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrdersViewObject {
  PickerDateRange get dateRange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrdersViewObjectCopyWith<OrdersViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersViewObjectCopyWith<$Res> {
  factory $OrdersViewObjectCopyWith(
          OrdersViewObject value, $Res Function(OrdersViewObject) then) =
      _$OrdersViewObjectCopyWithImpl<$Res, OrdersViewObject>;
  @useResult
  $Res call({PickerDateRange dateRange});
}

/// @nodoc
class _$OrdersViewObjectCopyWithImpl<$Res, $Val extends OrdersViewObject>
    implements $OrdersViewObjectCopyWith<$Res> {
  _$OrdersViewObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
  }) {
    return _then(_value.copyWith(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as PickerDateRange,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrdersViewObjectCopyWith<$Res>
    implements $OrdersViewObjectCopyWith<$Res> {
  factory _$$_OrdersViewObjectCopyWith(
          _$_OrdersViewObject value, $Res Function(_$_OrdersViewObject) then) =
      __$$_OrdersViewObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PickerDateRange dateRange});
}

/// @nodoc
class __$$_OrdersViewObjectCopyWithImpl<$Res>
    extends _$OrdersViewObjectCopyWithImpl<$Res, _$_OrdersViewObject>
    implements _$$_OrdersViewObjectCopyWith<$Res> {
  __$$_OrdersViewObjectCopyWithImpl(
      _$_OrdersViewObject _value, $Res Function(_$_OrdersViewObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
  }) {
    return _then(_$_OrdersViewObject(
      null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as PickerDateRange,
    ));
  }
}

/// @nodoc

class _$_OrdersViewObject implements _OrdersViewObject {
  _$_OrdersViewObject(this.dateRange);

  @override
  final PickerDateRange dateRange;

  @override
  String toString() {
    return 'OrdersViewObject(dateRange: $dateRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrdersViewObject &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrdersViewObjectCopyWith<_$_OrdersViewObject> get copyWith =>
      __$$_OrdersViewObjectCopyWithImpl<_$_OrdersViewObject>(this, _$identity);
}

abstract class _OrdersViewObject implements OrdersViewObject {
  factory _OrdersViewObject(final PickerDateRange dateRange) =
      _$_OrdersViewObject;

  @override
  PickerDateRange get dateRange;
  @override
  @JsonKey(ignore: true)
  _$$_OrdersViewObjectCopyWith<_$_OrdersViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InfoObject {
  String get telephone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get wifiPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InfoObjectCopyWith<InfoObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoObjectCopyWith<$Res> {
  factory $InfoObjectCopyWith(
          InfoObject value, $Res Function(InfoObject) then) =
      _$InfoObjectCopyWithImpl<$Res, InfoObject>;
  @useResult
  $Res call({String telephone, String address, String wifiPassword});
}

/// @nodoc
class _$InfoObjectCopyWithImpl<$Res, $Val extends InfoObject>
    implements $InfoObjectCopyWith<$Res> {
  _$InfoObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? telephone = null,
    Object? address = null,
    Object? wifiPassword = null,
  }) {
    return _then(_value.copyWith(
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      wifiPassword: null == wifiPassword
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InfoObjectCopyWith<$Res>
    implements $InfoObjectCopyWith<$Res> {
  factory _$$_InfoObjectCopyWith(
          _$_InfoObject value, $Res Function(_$_InfoObject) then) =
      __$$_InfoObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String telephone, String address, String wifiPassword});
}

/// @nodoc
class __$$_InfoObjectCopyWithImpl<$Res>
    extends _$InfoObjectCopyWithImpl<$Res, _$_InfoObject>
    implements _$$_InfoObjectCopyWith<$Res> {
  __$$_InfoObjectCopyWithImpl(
      _$_InfoObject _value, $Res Function(_$_InfoObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? telephone = null,
    Object? address = null,
    Object? wifiPassword = null,
  }) {
    return _then(_$_InfoObject(
      null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      null == wifiPassword
          ? _value.wifiPassword
          : wifiPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InfoObject implements _InfoObject {
  _$_InfoObject(this.telephone, this.address, this.wifiPassword);

  @override
  final String telephone;
  @override
  final String address;
  @override
  final String wifiPassword;

  @override
  String toString() {
    return 'InfoObject(telephone: $telephone, address: $address, wifiPassword: $wifiPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfoObject &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.wifiPassword, wifiPassword) ||
                other.wifiPassword == wifiPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, telephone, address, wifiPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfoObjectCopyWith<_$_InfoObject> get copyWith =>
      __$$_InfoObjectCopyWithImpl<_$_InfoObject>(this, _$identity);
}

abstract class _InfoObject implements InfoObject {
  factory _InfoObject(final String telephone, final String address,
      final String wifiPassword) = _$_InfoObject;

  @override
  String get telephone;
  @override
  String get address;
  @override
  String get wifiPassword;
  @override
  @JsonKey(ignore: true)
  _$$_InfoObjectCopyWith<_$_InfoObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountSettingsViewObject {
  PickerFile? get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get oldPassword => throw _privateConstructorUsedError;
  String? get newPassword => throw _privateConstructorUsedError;
  String? get confirmationNewPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountSettingsViewObjectCopyWith<AccountSettingsViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSettingsViewObjectCopyWith<$Res> {
  factory $AccountSettingsViewObjectCopyWith(AccountSettingsViewObject value,
          $Res Function(AccountSettingsViewObject) then) =
      _$AccountSettingsViewObjectCopyWithImpl<$Res, AccountSettingsViewObject>;
  @useResult
  $Res call(
      {PickerFile? image,
      String name,
      UserRole role,
      String username,
      String? oldPassword,
      String? newPassword,
      String? confirmationNewPassword});
}

/// @nodoc
class _$AccountSettingsViewObjectCopyWithImpl<$Res,
        $Val extends AccountSettingsViewObject>
    implements $AccountSettingsViewObjectCopyWith<$Res> {
  _$AccountSettingsViewObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = null,
    Object? role = null,
    Object? username = null,
    Object? oldPassword = freezed,
    Object? newPassword = freezed,
    Object? confirmationNewPassword = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: freezed == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmationNewPassword: freezed == confirmationNewPassword
          ? _value.confirmationNewPassword
          : confirmationNewPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountSettingsViewObjectCopyWith<$Res>
    implements $AccountSettingsViewObjectCopyWith<$Res> {
  factory _$$_AccountSettingsViewObjectCopyWith(
          _$_AccountSettingsViewObject value,
          $Res Function(_$_AccountSettingsViewObject) then) =
      __$$_AccountSettingsViewObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PickerFile? image,
      String name,
      UserRole role,
      String username,
      String? oldPassword,
      String? newPassword,
      String? confirmationNewPassword});
}

/// @nodoc
class __$$_AccountSettingsViewObjectCopyWithImpl<$Res>
    extends _$AccountSettingsViewObjectCopyWithImpl<$Res,
        _$_AccountSettingsViewObject>
    implements _$$_AccountSettingsViewObjectCopyWith<$Res> {
  __$$_AccountSettingsViewObjectCopyWithImpl(
      _$_AccountSettingsViewObject _value,
      $Res Function(_$_AccountSettingsViewObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = null,
    Object? role = null,
    Object? username = null,
    Object? oldPassword = freezed,
    Object? newPassword = freezed,
    Object? confirmationNewPassword = freezed,
  }) {
    return _then(_$_AccountSettingsViewObject(
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == confirmationNewPassword
          ? _value.confirmationNewPassword
          : confirmationNewPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AccountSettingsViewObject implements _AccountSettingsViewObject {
  _$_AccountSettingsViewObject(this.image, this.name, this.role, this.username,
      this.oldPassword, this.newPassword, this.confirmationNewPassword);

  @override
  final PickerFile? image;
  @override
  final String name;
  @override
  final UserRole role;
  @override
  final String username;
  @override
  final String? oldPassword;
  @override
  final String? newPassword;
  @override
  final String? confirmationNewPassword;

  @override
  String toString() {
    return 'AccountSettingsViewObject(image: $image, name: $name, role: $role, username: $username, oldPassword: $oldPassword, newPassword: $newPassword, confirmationNewPassword: $confirmationNewPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountSettingsViewObject &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(
                    other.confirmationNewPassword, confirmationNewPassword) ||
                other.confirmationNewPassword == confirmationNewPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, name, role, username,
      oldPassword, newPassword, confirmationNewPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountSettingsViewObjectCopyWith<_$_AccountSettingsViewObject>
      get copyWith => __$$_AccountSettingsViewObjectCopyWithImpl<
          _$_AccountSettingsViewObject>(this, _$identity);
}

abstract class _AccountSettingsViewObject implements AccountSettingsViewObject {
  factory _AccountSettingsViewObject(
      final PickerFile? image,
      final String name,
      final UserRole role,
      final String username,
      final String? oldPassword,
      final String? newPassword,
      final String? confirmationNewPassword) = _$_AccountSettingsViewObject;

  @override
  PickerFile? get image;
  @override
  String get name;
  @override
  UserRole get role;
  @override
  String get username;
  @override
  String? get oldPassword;
  @override
  String? get newPassword;
  @override
  String? get confirmationNewPassword;
  @override
  @JsonKey(ignore: true)
  _$$_AccountSettingsViewObjectCopyWith<_$_AccountSettingsViewObject>
      get copyWith => throw _privateConstructorUsedError;
}
