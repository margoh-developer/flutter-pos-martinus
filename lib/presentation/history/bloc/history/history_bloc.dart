import 'package:bloc/bloc.dart';
import 'package:CashierPOS/data/models/request/order_request_model.dart';
import 'package:CashierPOS/presentation/home/models/order_item.dart';
import 'package:CashierPOS/presentation/order/models/order_model.dart';
import 'package:CashierPOS/presentation/order/models/order_model_local.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/product_local_datasource.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(_Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const HistoryState.loading());
      final data = await ProductLocalDatasource.instance.getAllOrder();

      // List<List<OrderItem>> orderItemsList = [];
      for (var element in data) {
        List<OrderItemModel> getOrderItem = await ProductLocalDatasource
            .instance
            .getOrderItemByOrderIdLocal(element.id!);
        List<OrderItem> orderItems = await ProductLocalDatasource.instance
            .convertOrderItemModeltoOrderItem(
                getOrderItem, element.tableNumber!);
        print(orderItems);
        element.orders = orderItems;
        // orderItemsList.add(product);
      }
      print(data);
      emit(HistoryState.success(data));
    });
  }
}
