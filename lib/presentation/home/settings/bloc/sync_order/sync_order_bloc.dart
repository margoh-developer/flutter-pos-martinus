// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fic1_pos_flutter_martinus/data/datasources/order_remote_datasource.dart';
import 'package:fic1_pos_flutter_martinus/data/models/request/order_request_model.dart';

import '../../../../../data/datasources/product_local_datasource.dart';

part 'sync_order_bloc.freezed.dart';
part 'sync_order_event.dart';
part 'sync_order_state.dart';

class SyncOrderBloc extends Bloc<SyncOrderEvent, SyncOrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;

  SyncOrderBloc(
    this.orderRemoteDatasource,
  ) : super(_Initial()) {
    on<_SendOrder>((event, emit) async {
      emit(const SyncOrderState.loading());
      //get orders from local is sync is 0
      final ordersIsSyncZero =
          await ProductLocalDatasource.instance.getOrderByIsSync();

      for (final order in ordersIsSyncZero) {
        final orderItems = await ProductLocalDatasource.instance
            .getOrderItemByOrderIdLocal(order.id!);

        final orderRequest = OrderRequestModel(
            transactionTime: order.transactionTime,
            totalItem: order.totalQuantity,
            totalPrice: order.totalPrice,
            kasirId: order.idKasir,
            paymentMethod: order.paymentMethod,
            orderItems: orderItems
            // .map((e) => OrderItemModel(
            //       productId: e.product.id!,
            //       quantity: e.quantity,
            //       totalPrice: e.product.price * e.quantity,
            //     ))
            // .toList(),
            );
        final response = await orderRemoteDatasource.sendOrder(orderRequest);
        if (response) {
          await ProductLocalDatasource.instance
              .updateIsSyncOrderById(order.id!);
        }
      }

      emit(const SyncOrderState.success());
    });
  }
}