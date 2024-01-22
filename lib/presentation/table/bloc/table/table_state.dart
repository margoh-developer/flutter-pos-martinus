part of 'table_bloc.dart';

@freezed
class TableState with _$TableState {
  const factory TableState.initial() = _Initial;
  const factory TableState.loading() = _Loading;
  const factory TableState.loaded(Map<int, List<OrderItem>> tableOrders) =
      _Loaded;
  const factory TableState.error(String message) = _Error;
}
