// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int tableNumber) loadTableNumber,
    required TResult Function(Product product) addcheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) deleteCheckout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int tableNumber)? loadTableNumber,
    TResult? Function(Product product)? addcheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? deleteCheckout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int tableNumber)? loadTableNumber,
    TResult Function(Product product)? addcheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? deleteCheckout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadTableNumber value) loadTableNumber,
    required TResult Function(_AddCheckout value) addcheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_DeleteCheckout value) deleteCheckout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadTableNumber value)? loadTableNumber,
    TResult? Function(_AddCheckout value)? addcheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_DeleteCheckout value)? deleteCheckout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadTableNumber value)? loadTableNumber,
    TResult Function(_AddCheckout value)? addcheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_DeleteCheckout value)? deleteCheckout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEventCopyWith<$Res> {
  factory $CheckoutEventCopyWith(
          CheckoutEvent value, $Res Function(CheckoutEvent) then) =
      _$CheckoutEventCopyWithImpl<$Res, CheckoutEvent>;
}

/// @nodoc
class _$CheckoutEventCopyWithImpl<$Res, $Val extends CheckoutEvent>
    implements $CheckoutEventCopyWith<$Res> {
  _$CheckoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CheckoutEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int tableNumber) loadTableNumber,
    required TResult Function(Product product) addcheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) deleteCheckout,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int tableNumber)? loadTableNumber,
    TResult? Function(Product product)? addcheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? deleteCheckout,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int tableNumber)? loadTableNumber,
    TResult Function(Product product)? addcheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadTableNumber value) loadTableNumber,
    required TResult Function(_AddCheckout value) addcheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_DeleteCheckout value) deleteCheckout,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadTableNumber value)? loadTableNumber,
    TResult? Function(_AddCheckout value)? addcheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_DeleteCheckout value)? deleteCheckout,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadTableNumber value)? loadTableNumber,
    TResult Function(_AddCheckout value)? addcheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_DeleteCheckout value)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CheckoutEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$LoadTableNumberImplCopyWith<$Res> {
  factory _$$LoadTableNumberImplCopyWith(_$LoadTableNumberImpl value,
          $Res Function(_$LoadTableNumberImpl) then) =
      __$$LoadTableNumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int tableNumber});
}

/// @nodoc
class __$$LoadTableNumberImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$LoadTableNumberImpl>
    implements _$$LoadTableNumberImplCopyWith<$Res> {
  __$$LoadTableNumberImplCopyWithImpl(
      _$LoadTableNumberImpl _value, $Res Function(_$LoadTableNumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableNumber = null,
  }) {
    return _then(_$LoadTableNumberImpl(
      null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadTableNumberImpl implements _LoadTableNumber {
  const _$LoadTableNumberImpl(this.tableNumber);

  @override
  final int tableNumber;

  @override
  String toString() {
    return 'CheckoutEvent.loadTableNumber(tableNumber: $tableNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTableNumberImpl &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTableNumberImplCopyWith<_$LoadTableNumberImpl> get copyWith =>
      __$$LoadTableNumberImplCopyWithImpl<_$LoadTableNumberImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int tableNumber) loadTableNumber,
    required TResult Function(Product product) addcheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) deleteCheckout,
  }) {
    return loadTableNumber(tableNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int tableNumber)? loadTableNumber,
    TResult? Function(Product product)? addcheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? deleteCheckout,
  }) {
    return loadTableNumber?.call(tableNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int tableNumber)? loadTableNumber,
    TResult Function(Product product)? addcheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (loadTableNumber != null) {
      return loadTableNumber(tableNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadTableNumber value) loadTableNumber,
    required TResult Function(_AddCheckout value) addcheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_DeleteCheckout value) deleteCheckout,
  }) {
    return loadTableNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadTableNumber value)? loadTableNumber,
    TResult? Function(_AddCheckout value)? addcheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_DeleteCheckout value)? deleteCheckout,
  }) {
    return loadTableNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadTableNumber value)? loadTableNumber,
    TResult Function(_AddCheckout value)? addcheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_DeleteCheckout value)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (loadTableNumber != null) {
      return loadTableNumber(this);
    }
    return orElse();
  }
}

abstract class _LoadTableNumber implements CheckoutEvent {
  const factory _LoadTableNumber(final int tableNumber) = _$LoadTableNumberImpl;

  int get tableNumber;
  @JsonKey(ignore: true)
  _$$LoadTableNumberImplCopyWith<_$LoadTableNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddCheckoutImplCopyWith<$Res> {
  factory _$$AddCheckoutImplCopyWith(
          _$AddCheckoutImpl value, $Res Function(_$AddCheckoutImpl) then) =
      __$$AddCheckoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$AddCheckoutImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$AddCheckoutImpl>
    implements _$$AddCheckoutImplCopyWith<$Res> {
  __$$AddCheckoutImplCopyWithImpl(
      _$AddCheckoutImpl _value, $Res Function(_$AddCheckoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$AddCheckoutImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$AddCheckoutImpl implements _AddCheckout {
  const _$AddCheckoutImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CheckoutEvent.addcheckout(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCheckoutImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCheckoutImplCopyWith<_$AddCheckoutImpl> get copyWith =>
      __$$AddCheckoutImplCopyWithImpl<_$AddCheckoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int tableNumber) loadTableNumber,
    required TResult Function(Product product) addcheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) deleteCheckout,
  }) {
    return addcheckout(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int tableNumber)? loadTableNumber,
    TResult? Function(Product product)? addcheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? deleteCheckout,
  }) {
    return addcheckout?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int tableNumber)? loadTableNumber,
    TResult Function(Product product)? addcheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (addcheckout != null) {
      return addcheckout(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadTableNumber value) loadTableNumber,
    required TResult Function(_AddCheckout value) addcheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_DeleteCheckout value) deleteCheckout,
  }) {
    return addcheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadTableNumber value)? loadTableNumber,
    TResult? Function(_AddCheckout value)? addcheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_DeleteCheckout value)? deleteCheckout,
  }) {
    return addcheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadTableNumber value)? loadTableNumber,
    TResult Function(_AddCheckout value)? addcheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_DeleteCheckout value)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (addcheckout != null) {
      return addcheckout(this);
    }
    return orElse();
  }
}

abstract class _AddCheckout implements CheckoutEvent {
  const factory _AddCheckout(final Product product) = _$AddCheckoutImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$AddCheckoutImplCopyWith<_$AddCheckoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveCheckoutImplCopyWith<$Res> {
  factory _$$RemoveCheckoutImplCopyWith(_$RemoveCheckoutImpl value,
          $Res Function(_$RemoveCheckoutImpl) then) =
      __$$RemoveCheckoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$RemoveCheckoutImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$RemoveCheckoutImpl>
    implements _$$RemoveCheckoutImplCopyWith<$Res> {
  __$$RemoveCheckoutImplCopyWithImpl(
      _$RemoveCheckoutImpl _value, $Res Function(_$RemoveCheckoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$RemoveCheckoutImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$RemoveCheckoutImpl implements _RemoveCheckout {
  const _$RemoveCheckoutImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CheckoutEvent.removeCheckout(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCheckoutImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveCheckoutImplCopyWith<_$RemoveCheckoutImpl> get copyWith =>
      __$$RemoveCheckoutImplCopyWithImpl<_$RemoveCheckoutImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int tableNumber) loadTableNumber,
    required TResult Function(Product product) addcheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) deleteCheckout,
  }) {
    return removeCheckout(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int tableNumber)? loadTableNumber,
    TResult? Function(Product product)? addcheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? deleteCheckout,
  }) {
    return removeCheckout?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int tableNumber)? loadTableNumber,
    TResult Function(Product product)? addcheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (removeCheckout != null) {
      return removeCheckout(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadTableNumber value) loadTableNumber,
    required TResult Function(_AddCheckout value) addcheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_DeleteCheckout value) deleteCheckout,
  }) {
    return removeCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadTableNumber value)? loadTableNumber,
    TResult? Function(_AddCheckout value)? addcheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_DeleteCheckout value)? deleteCheckout,
  }) {
    return removeCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadTableNumber value)? loadTableNumber,
    TResult Function(_AddCheckout value)? addcheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_DeleteCheckout value)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (removeCheckout != null) {
      return removeCheckout(this);
    }
    return orElse();
  }
}

abstract class _RemoveCheckout implements CheckoutEvent {
  const factory _RemoveCheckout(final Product product) = _$RemoveCheckoutImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$RemoveCheckoutImplCopyWith<_$RemoveCheckoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCheckoutImplCopyWith<$Res> {
  factory _$$DeleteCheckoutImplCopyWith(_$DeleteCheckoutImpl value,
          $Res Function(_$DeleteCheckoutImpl) then) =
      __$$DeleteCheckoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$DeleteCheckoutImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$DeleteCheckoutImpl>
    implements _$$DeleteCheckoutImplCopyWith<$Res> {
  __$$DeleteCheckoutImplCopyWithImpl(
      _$DeleteCheckoutImpl _value, $Res Function(_$DeleteCheckoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$DeleteCheckoutImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$DeleteCheckoutImpl implements _DeleteCheckout {
  const _$DeleteCheckoutImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CheckoutEvent.deleteCheckout(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCheckoutImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCheckoutImplCopyWith<_$DeleteCheckoutImpl> get copyWith =>
      __$$DeleteCheckoutImplCopyWithImpl<_$DeleteCheckoutImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int tableNumber) loadTableNumber,
    required TResult Function(Product product) addcheckout,
    required TResult Function(Product product) removeCheckout,
    required TResult Function(Product product) deleteCheckout,
  }) {
    return deleteCheckout(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int tableNumber)? loadTableNumber,
    TResult? Function(Product product)? addcheckout,
    TResult? Function(Product product)? removeCheckout,
    TResult? Function(Product product)? deleteCheckout,
  }) {
    return deleteCheckout?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int tableNumber)? loadTableNumber,
    TResult Function(Product product)? addcheckout,
    TResult Function(Product product)? removeCheckout,
    TResult Function(Product product)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (deleteCheckout != null) {
      return deleteCheckout(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoadTableNumber value) loadTableNumber,
    required TResult Function(_AddCheckout value) addcheckout,
    required TResult Function(_RemoveCheckout value) removeCheckout,
    required TResult Function(_DeleteCheckout value) deleteCheckout,
  }) {
    return deleteCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoadTableNumber value)? loadTableNumber,
    TResult? Function(_AddCheckout value)? addcheckout,
    TResult? Function(_RemoveCheckout value)? removeCheckout,
    TResult? Function(_DeleteCheckout value)? deleteCheckout,
  }) {
    return deleteCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoadTableNumber value)? loadTableNumber,
    TResult Function(_AddCheckout value)? addcheckout,
    TResult Function(_RemoveCheckout value)? removeCheckout,
    TResult Function(_DeleteCheckout value)? deleteCheckout,
    required TResult orElse(),
  }) {
    if (deleteCheckout != null) {
      return deleteCheckout(this);
    }
    return orElse();
  }
}

abstract class _DeleteCheckout implements CheckoutEvent {
  const factory _DeleteCheckout(final Product product) = _$DeleteCheckoutImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$DeleteCheckoutImplCopyWith<_$DeleteCheckoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)
        success,
    required TResult Function(int tableNumber) loadtable,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult? Function(int tableNumber)? loadtable,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult Function(int tableNumber)? loadtable,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loadtable value) loadtable,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loadtable value)? loadtable,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loadtable value)? loadtable,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CheckoutState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)
        success,
    required TResult Function(int tableNumber) loadtable,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult? Function(int tableNumber)? loadtable,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult Function(int tableNumber)? loadtable,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loadtable value) loadtable,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loadtable value)? loadtable,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loadtable value)? loadtable,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CheckoutState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CheckoutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)
        success,
    required TResult Function(int tableNumber) loadtable,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult? Function(int tableNumber)? loadtable,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult Function(int tableNumber)? loadtable,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loadtable value) loadtable,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loadtable value)? loadtable,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loadtable value)? loadtable,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CheckoutState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int tableNumber,
      List<OrderItem> products,
      int totalQuantity,
      int totalPrice});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableNumber = null,
    Object? products = null,
    Object? totalQuantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_$SuccessImpl(
      null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.tableNumber, final List<OrderItem> products,
      this.totalQuantity, this.totalPrice)
      : _products = products;

  @override
  final int tableNumber;
  final List<OrderItem> _products;
  @override
  List<OrderItem> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int totalQuantity;
  @override
  final int totalPrice;

  @override
  String toString() {
    return 'CheckoutState.success(tableNumber: $tableNumber, products: $products, totalQuantity: $totalQuantity, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      tableNumber,
      const DeepCollectionEquality().hash(_products),
      totalQuantity,
      totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)
        success,
    required TResult Function(int tableNumber) loadtable,
    required TResult Function(String message) error,
  }) {
    return success(tableNumber, products, totalQuantity, totalPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult? Function(int tableNumber)? loadtable,
    TResult? Function(String message)? error,
  }) {
    return success?.call(tableNumber, products, totalQuantity, totalPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult Function(int tableNumber)? loadtable,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(tableNumber, products, totalQuantity, totalPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loadtable value) loadtable,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loadtable value)? loadtable,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loadtable value)? loadtable,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CheckoutState {
  const factory _Success(final int tableNumber, final List<OrderItem> products,
      final int totalQuantity, final int totalPrice) = _$SuccessImpl;

  int get tableNumber;
  List<OrderItem> get products;
  int get totalQuantity;
  int get totalPrice;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadtableImplCopyWith<$Res> {
  factory _$$LoadtableImplCopyWith(
          _$LoadtableImpl value, $Res Function(_$LoadtableImpl) then) =
      __$$LoadtableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int tableNumber});
}

/// @nodoc
class __$$LoadtableImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$LoadtableImpl>
    implements _$$LoadtableImplCopyWith<$Res> {
  __$$LoadtableImplCopyWithImpl(
      _$LoadtableImpl _value, $Res Function(_$LoadtableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableNumber = null,
  }) {
    return _then(_$LoadtableImpl(
      null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadtableImpl implements _Loadtable {
  const _$LoadtableImpl(this.tableNumber);

  @override
  final int tableNumber;

  @override
  String toString() {
    return 'CheckoutState.loadtable(tableNumber: $tableNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadtableImpl &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadtableImplCopyWith<_$LoadtableImpl> get copyWith =>
      __$$LoadtableImplCopyWithImpl<_$LoadtableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)
        success,
    required TResult Function(int tableNumber) loadtable,
    required TResult Function(String message) error,
  }) {
    return loadtable(tableNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult? Function(int tableNumber)? loadtable,
    TResult? Function(String message)? error,
  }) {
    return loadtable?.call(tableNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult Function(int tableNumber)? loadtable,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadtable != null) {
      return loadtable(tableNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loadtable value) loadtable,
    required TResult Function(_Error value) error,
  }) {
    return loadtable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loadtable value)? loadtable,
    TResult? Function(_Error value)? error,
  }) {
    return loadtable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loadtable value)? loadtable,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loadtable != null) {
      return loadtable(this);
    }
    return orElse();
  }
}

abstract class _Loadtable implements CheckoutState {
  const factory _Loadtable(final int tableNumber) = _$LoadtableImpl;

  int get tableNumber;
  @JsonKey(ignore: true)
  _$$LoadtableImplCopyWith<_$LoadtableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CheckoutState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)
        success,
    required TResult Function(int tableNumber) loadtable,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult? Function(int tableNumber)? loadtable,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int tableNumber, List<OrderItem> products,
            int totalQuantity, int totalPrice)?
        success,
    TResult Function(int tableNumber)? loadtable,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loadtable value) loadtable,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loadtable value)? loadtable,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loadtable value)? loadtable,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CheckoutState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
