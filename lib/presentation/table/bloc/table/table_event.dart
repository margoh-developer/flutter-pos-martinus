part of 'table_bloc.dart';

@freezed
class TableEvent with _$TableEvent {
  const factory TableEvent.started() = _Started;
  const factory TableEvent.addProductToTable(List<OrderItem> orderItems) =
      _AddProductToTable;
  const factory TableEvent.clearTableOrderItems(int tableNumber) = _ClearTableOrderItems;
}
