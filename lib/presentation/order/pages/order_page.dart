import 'package:fic1_pos_flutter_martinus/presentation/home/models/order_item.dart';
import 'package:fic1_pos_flutter_martinus/presentation/order/bloc/order/order_bloc.dart';
import 'package:fic1_pos_flutter_martinus/presentation/order/widgets/payment_method_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/menu_button.dart';
import '../../../core/components/spaces.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../models/order_model.dart';
import '../widgets/order_card.dart';
import '../widgets/payment_cash_dialog.dart';
import '../widgets/payment_qris_dialog.dart';
import '../widgets/process_button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final indexValue = ValueNotifier(0);
  final paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);
  // final List<OrderModel> orders = [
  //   OrderModel(
  //     image: Assets.images.f1.path,
  //     name: 'Nutty Oat Latte',
  //     price: 39000,
  //   ),
  //   OrderModel(
  //     image: Assets.images.f2.path,
  //     name: 'Iced Latte',
  //     price: 24000,
  //   ),
  // ];
  int totalPrice = 0;
  List<OrderItem> orders = [];
  // int calculateTotalPrice(List<OrderModel> orders) {
  //   int totalPrice = 0;
  //   for (final order in orders) {
  //     totalPrice += order.price;
  //   }
  //   return totalPrice;
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<CheckoutBloc>().add(CheckoutEvent.started());
            },
            icon: Assets.icons.delete.svg(),
          ),
        ],
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const Center(
              child: Text("No Data"),
            );
          }, success: (data, qty, price) {
            if (data.isEmpty) {
              return const Center(
                child: Text("No Data"),
              );
            }
            orders = data;
            totalPrice = price;
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: data.length,
              separatorBuilder: (context, index) => const SpaceHeight(20.0),
              itemBuilder: (context, index) => OrderCard(
                padding: paddingHorizontal,
                data: data[index],
                onDeleteTap: () {
                  context
                      .read<CheckoutBloc>()
                      .add(CheckoutEvent.deleteCheckout(data[index].product));
                  // orders.removeAt(index);
                  // setState(() {});
                },
              ),
            );
          });
        },
      ),
      bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const SizedBox();
          }, success: (data, qty, price) {
            if (data.isEmpty) {
              return const SizedBox();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // BlocBuilder<CheckoutBloc, CheckoutState>(
                  //   builder: (context, state) {
                  //     return state.maybeWhen(
                  //       orElse: () {
                  //         return const SizedBox.shrink();
                  //       },
                  //       success: (data, qty, total) {
                  //         return ValueListenableBuilder(
                  //           valueListenable: indexValue,
                  //           builder: (context, value, _) => Row(
                  //             children: [
                  //               const SpaceWidth(10.0),
                  //               MenuButton(
                  //                 iconPath: Assets.icons.cash.path,
                  //                 label: 'Tunai',
                  //                 isActive: value == 1,
                  //                 onPressed: () {
                  //                   indexValue.value = 1;
                  //                   context.read<OrderBloc>().add(
                  //                       OrderEvent.addPaymentMethod('cash', data));
                  //                 },
                  //               ),
                  //               const SpaceWidth(10.0),
                  //               MenuButton(
                  //                 iconPath: Assets.icons.qrCode.path,
                  //                 label: 'QRIS',
                  //                 isActive: value == 2,
                  //                 onPressed: () {
                  //                   indexValue.value = 2;
                  //                   context.read<OrderBloc>().add(
                  //                       OrderEvent.addPaymentMethod('qris', data));
                  //                 },
                  //               ),
                  //               const SpaceWidth(10.0),
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                  // const SpaceHeight(20.0),
                  ProcessButton(
                    // price: 123000,
                    onPressed: () async {
                      // if (indexValue.value == 0) {
                      // } else if (indexValue.value == 1) {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => PaymentCashDialog(
                      //       price: totalPrice,
                      //     ),
                      //   );
                      // } else if (indexValue.value == 2) {
                      //   showDialog(
                      //     context: context,
                      //     barrierDismissible: false,
                      //     builder: (context) => PaymentQrisDialog(price: totalPrice),
                      //   );
                      // }
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => PaymentMethodDialog(
                            totalPrice: totalPrice, data: orders),
                      );
                    },
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
