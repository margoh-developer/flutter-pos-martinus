import 'package:bloc/bloc.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/order_item.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  late int loadedTableNumber;
  final Map<int, List<OrderItem>> tableOrders = {};
  CheckoutBloc() : super(_Success(0, [], 0, 0)) {
    on<_LoadTableNumber>((event, emit) {
      loadedTableNumber = event.tableNumber;
      // emit(_Loadtable(loadedTableNumber));
      List<OrderItem> newCheckout = [];
      int totalQuantity = 0;
      int totalPrice = 0;
      if (tableOrders[loadedTableNumber] != null) {
        newCheckout = tableOrders[loadedTableNumber]!;

        for (var element in newCheckout) {
          totalQuantity += element.quantity;
          totalPrice += element.quantity * element.product.price;
        }
      }

      emit(_Success(loadedTableNumber, newCheckout, totalQuantity, totalPrice));

      // emit(_Success(
      //     loadedTableNumber, tableOrders[loadedTableNumber] ?? [], 0, 0));
    });

    on<_AddCheckout>((event, emit) {
      var currentstate = state as _Success;
      List<OrderItem> newCheckout = [...currentstate.products];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);
        newCheckout[index].quantity++;
      } else {
        newCheckout.add(OrderItem(
            product: event.product,
            quantity: 1,
            tableNumber: loadedTableNumber));
      }
      // int tableNumber = loadedTableNumber;
      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += element.quantity * element.product.price;
      }
      tableOrders.addEntries({loadedTableNumber: newCheckout}.entries);
      emit(_Success(loadedTableNumber, newCheckout, totalQuantity, totalPrice));
    });

    on<_RemoveCheckout>((event, emit) {
      var currentstate = state as _Success;
      List<OrderItem> newCheckout = [...currentstate.products];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);
        if (newCheckout[index].quantity > 1) {
          newCheckout[index].quantity--;
        } else {
          newCheckout.removeAt(index);
        }
      }
      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += element.quantity * element.product.price;
      }

      //update table orders
      tableOrders.update(loadedTableNumber, (value) => newCheckout,
          ifAbsent: () => []);

      emit(_Success(loadedTableNumber, newCheckout, totalQuantity, totalPrice));
    });

    on<_DeleteCheckout>((event, emit) {
      var currentstate = state as _Success;
      List<OrderItem> newCheckout = [...currentstate.products];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);
        if (newCheckout[index].quantity > 0) {
          newCheckout.removeAt(index);
        }
      }
      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += element.quantity * element.product.price;
      }

      //remove table orders
      tableOrders.remove(loadedTableNumber);
      emit(_Success(loadedTableNumber, newCheckout, totalQuantity, totalPrice));
    });

    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Success(0, [], 0, 0));
    });
  }
}
