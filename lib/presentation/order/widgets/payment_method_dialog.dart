// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:CashierPOS/core/extensions/build_context_ext.dart';
import 'package:CashierPOS/core/extensions/int_ext.dart';
import 'package:CashierPOS/core/extensions/string_ext.dart';
import 'package:CashierPOS/presentation/order/widgets/payment_success_dialog.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/menu_button.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../../data/datasources/product_local_datasource.dart';
import '../../home/models/order_item.dart';
import '../bloc/order/order_bloc.dart';
import '../models/order_model.dart';
import 'payment_cash_dialog.dart';
import 'payment_qris_dialog.dart';

class PaymentMethodDialog extends StatefulWidget {
  final int totalPrice;
  final List<OrderItem> data;
  const PaymentMethodDialog({
    Key? key,
    required this.totalPrice,
    required this.data,
  }) : super(key: key);

  @override
  State<PaymentMethodDialog> createState() => _PaymentCashDialogState();
}

class _PaymentCashDialogState extends State<PaymentMethodDialog> {
  // TextEditingController?
  //     priceController; // = TextEditingController(text: widget.price.currencyFormatRp);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final priceController = TextEditingController(text: widget.price.currencyFormatRp);
    return AlertDialog(
      scrollable: true,
      title: Stack(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.highlight_off),
            color: AppColors.primary,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                'Pilih Metode Pembayaran',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GestureDetector(
          //   onTap: () {
          //     context
          //         .read<OrderBloc>()
          //         .add(OrderEvent.addPaymentMethod('cash', widget.data));
          //     showDialog(
          //       context: context,
          //       builder: (context) => PaymentCashDialog(
          //         price: widget.totalPrice,
          //       ),
          //     );
          //   },
          //   child: Container(
          //     padding: const EdgeInsets.all(16.0),
          //     decoration: const BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(6.0)),
          //     ),
          //     child: const Text('Cash'),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () {
          //     context
          //         .read<OrderBloc>()
          //         .add(OrderEvent.addPaymentMethod('qris', widget.data));
          //     showDialog(
          //       context: context,
          //       barrierDismissible: false,
          //       builder: (context) =>
          //           PaymentQrisDialog(price: widget.totalPrice),
          //     );
          //   },
          //   child: Container(
          //     padding: const EdgeInsets.all(16.0),
          //     decoration: const BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(6.0)),
          //     ),
          //     child: const Text('QRIS'),
          //   ),
          // )
          MenuButton(
            iconPath: Assets.icons.cash.path,
            label: 'Tunai',
            isActive: false,
            onPressed: () {
              context.pop();
              // indexValue.value = 1;
              context
                  .read<OrderBloc>()
                  .add(OrderEvent.addPaymentMethod('cash', widget.data));
              showDialog(
                context: context,
                builder: (context) => PaymentCashDialog(
                  price: widget.totalPrice,
                ),
              );
            },
          ),
          SpaceHeight(20),
          MenuButton(
            iconPath: Assets.icons.qrCode.path,
            label: 'QRIS',
            isActive: false,
            onPressed: () {
              // indexValue.value = 1;
              context.pop();
              context
                  .read<OrderBloc>()
                  .add(OrderEvent.addPaymentMethod('qris', widget.data));
              showDialog(
                context: context,
                builder: (context) => PaymentQrisDialog(
                  price: widget.totalPrice,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
