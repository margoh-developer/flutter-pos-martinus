// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../../home/models/order_item.dart';
import '../bloc/table/table_bloc.dart';

class TableCard extends StatefulWidget {
  final int index;
  final VoidCallback onTap;
  const TableCard({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  String qty = '0';
  late Map<int, List<OrderItem>> _tableOrders;

  // @override
  // void initState() {
  //   super.initState();
  //   _updateTableOrders();
  // }

  // void _updateTableOrders() {
  //   setState(() {
  //     _tableOrders = CheckoutBloc().tableOrders;
  //     print(_tableOrders);
  //     qty = _tableOrders[widget.index]!.first.quantity.toString();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(45.0),
            color: AppColors.primary,
          ),
          child: Center(
            child: Row(
              // alignment: Alignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Meja - ',
                //     style: const TextStyle(
                //       color: AppColors.disabled,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 14.0,
                //     )),
                Text('${widget.index}',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),

                // Text(qty)
                // BlocBuilder<TableBloc, TableState>(
                //   builder: (context, state) {
                //     return state.maybeWhen(orElse: () {
                //       return SizedBox();
                //     }, loading: () {
                //       return Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }, loaded: (data) {
                //       // print(data[widget.index]!.first.quantity.toString());
                //       if (data[widget.index] == null) {
                //         return const SizedBox();
                //       }
                //       return
                //           // Text(data[widget.index]!.first.quantity.toString(),
                //           //     style: const TextStyle(
                //           //       color: AppColors.white,
                //           //       fontWeight: FontWeight.bold,
                //           //       fontSize: 20.0,
                //           //     ));

                //           Positioned(
                //         top: 0,
                //         right: 0,
                //         child: CircleAvatar(
                //           // backgroundColor: AppColors.primary,
                //           child: Text(
                //             data[widget.index]!.first.quantity.toString(),
                //             style: const TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       );
                //     });
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
      BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return SizedBox();
          }, loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          }, loaded: (data) {
            // print(data[widget.index]!.first.quantity.toString());
            if (data[widget.index] == null) {
              return const SizedBox();
            }
            int totalQuantity = data[widget.index]!
                .fold(0, (sum, orderItem) => sum + orderItem.quantity);
            return
                // Text(data[widget.index]!.first.quantity.toString(),
                //     style: const TextStyle(
                //       color: AppColors.white,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20.0,
                //     ));

                Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: AppColors.red,
                child: Text(
                  totalQuantity.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          });
        },
      )
    ]);
  }
}
