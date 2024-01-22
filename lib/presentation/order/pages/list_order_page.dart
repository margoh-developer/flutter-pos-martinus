import 'package:fic1_pos_flutter_martinus/presentation/order/widgets/list_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/spaces.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';

class ListOrderPage extends StatefulWidget {
  const ListOrderPage({super.key});

  @override
  State<ListOrderPage> createState() => _ListOrderPageState();
}

class _ListOrderPageState extends State<ListOrderPage> {
  var totalTable = CheckoutBloc().tableOrders;
  // print(totalTable);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Order Detail'),
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
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          itemCount: totalTable.length,
          separatorBuilder: (context, index) => const SpaceHeight(20.0),
          itemBuilder: (context, index) => ListOrderCard(
                tableNumber: totalTable.keys.toList()[index],
                // padding: paddingHorizontal,
                listTableOrders: totalTable[index] ?? [],
                onDeleteTap: () {
                  // context
                  //     .read<CheckoutBloc>()
                  //     .add(CheckoutEvent.deleteCheckout(data[index].product));
                  // orders.removeAt(index);
                  // setState(() {});
                },
              )),

      // bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
      //   builder: (context, state) {
      //     return state.maybeWhen(orElse: () {
      //       return const SizedBox();
      //     }, success: (tnumber, data, qty, price) {
      //       if (data.isEmpty) {
      //         return const SizedBox();
      //       }
      //       return Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             // ProcessButton(
      //             //   onPressed: () async {
      //             //     showDialog(
      //             //       context: context,
      //             //       barrierDismissible: false,
      //             //       builder: (context) => PaymentMethodDialog(
      //             //           totalPrice: totalPrice, data: orders),
      //             //     );
      //             //   },
      //             // ),
      //           ],
      //         ),
      //       );
      //     });
      //   },
      // ),
    );
  }
}
