// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/bloc/checkout/checkout_bloc.dart';
import '../../../home/models/order_item.dart';

part 'table_bloc.freezed.dart';
part 'table_event.dart';
part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  // final CheckoutBloc checkoutBloc;
  final Map<int, List<OrderItem>> _tableOrders = {};
  TableBloc() : super(_Initial()) {
    on<_AddProductToTable>((event, emit) {
      emit(TableState.loading());
      final orders = event.orderItems;
      final tableNumber = event.orderItems.first.tableNumber;
      _tableOrders[tableNumber] = orders;

      emit(TableState.loaded(_tableOrders));
    });
  }
}
