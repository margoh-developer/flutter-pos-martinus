// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:CashierPOS/core/extensions/int_ext.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/constants/colors.dart';
import '../../order/models/order_model.dart';
import 'history_transaction_dialog.dart';

class HistoryTransactionCard extends StatelessWidget {
  final OrderModel data;
  final EdgeInsetsGeometry? padding;
  // final VoidCallback? onTap;

  const HistoryTransactionCard({
    Key? key,
    required this.data,
    this.padding,
    // this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return HistoryTransactionDialog(
                data: data,
              );
            });
      },
      child: Container(
        margin: padding,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 48.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.06),
            ),
          ],
        ),
        child: ListTile(
          leading: Assets.icons.payments.svg(),
          title: Text(data.paymentMethod == "cash" ? "Cash" : "QRIS"),
          subtitle:
              Text('Meja - ${data.tableNumber} (${data.totalQuantity} items)'),
          trailing: Text(
            data.totalPrice.currencyFormatRp,
            style: const TextStyle(
              color: AppColors.green,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
