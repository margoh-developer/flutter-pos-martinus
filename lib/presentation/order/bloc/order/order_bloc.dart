import 'package:bloc/bloc.dart';
import 'package:fic1_pos_flutter_martinus/data/datasources/auth_local_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/models/order_item.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(_Success([], 0, 0, '', 0, 0, '')) {
    on<_AddPaymentMethod>((event, emit) async {
      emit(_Loading());
      final userData = await AuthLocalDataSource().getAuthData();
      emit(_Success(
          event.orders,
          event.orders.fold(
              0, (previousValue, element) => previousValue + element.quantity),
          event.orders.fold(
              0,
              (previousValue, element) =>
                  previousValue + (element.quantity * element.product.price)),
          event.paymentMethod,
          0,
          userData.user.id,
          userData.user.name,
          ));
    });

    on<_AddNominalBayar>((event, emit) {
      var currentstate = state as _Success;
      emit(_Loading());
      emit(_Success(
          currentstate.products,
          currentstate.totalQuantity,
          currentstate.totalPrice,
          currentstate.paymentMethod,
          event.nominal,
          currentstate.idKasir,
          currentstate.namaKasir));
    });

    //started
    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Success([], 0, 0, '', 0, 0, ''));
    });
  }
}
