// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:CashierPOS/core/constants/colors.dart';
import 'package:CashierPOS/core/extensions/build_context_ext.dart';
import 'package:CashierPOS/core/extensions/date_time_ext.dart';
import 'package:CashierPOS/core/extensions/int_ext.dart';
import 'package:CashierPOS/presentation/order/models/order_model.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../data/dataoutputs/cwb_print.dart';
import '../../order/bloc/order/order_bloc.dart';

class HistoryTransactionDialog extends StatefulWidget {
  final OrderModel data;
  HistoryTransactionDialog({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<HistoryTransactionDialog> createState() =>
      _HistoryTransactionDialogState();
}

class _HistoryTransactionDialogState extends State<HistoryTransactionDialog> {
  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat("dd-MM-yyyy HH:mm");
    // int tableNumber = 0;
    return AlertDialog(
      scrollable: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Assets.icons.done.svg()),
          const SpaceHeight(24.0),
          const Text(
            'Pembayaran telah sukses dilakukan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SpaceHeight(24.0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceHeight(12.0),
              _LabelValue(
                label: 'PESANAN MEJA NOMOR',
                value: widget.data.tableNumber.toString(),
              ),
              const Divider(height: 36.0),
              _LabelValue(
                label: 'METODE PEMBAYARAN',
                value: widget.data.paymentMethod == "cash" ? "Tunai" : "QRIS",
              ),
              const Divider(height: 36.0),
              GestureDetector(
                child: _LabelValue(
                  label: 'TOTAL PRODUCTS QUANTITY',
                  value: '${widget.data.totalQuantity} Items [Click here!]',
                  valueColor: AppColors.primary,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: Icon(Icons.info, color: AppColors.primary),
                          content: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.data.orders!.length,
                                itemBuilder: (context, index) {
                                  String productName =
                                      widget.data.orders![index].product.name;
                                  String qty = widget
                                      .data.orders![index].quantity
                                      .toString();
                                  String price = widget.data.orders![index]
                                      .product.price.currencyFormatRp;
                                  return _ItemListValue(
                                    label: 'ITEM ${index + 1}',
                                    itemName: '${productName} x $qty',
                                    itemQty: '${price}',
                                  );
                                }),
                          ),
                        );
                        // ListView.builder(
                        //     shrinkWrap: true,
                        //     itemCount: widget.data.orders!.length,
                        //     itemBuilder: (context, index) {
                        //       return _LabelValue(
                        //           label: 'Item $index',
                        //           value:
                        //               '${widget.data.orders![index].product.name} x ${widget.data.orders![index].quantity} : ${widget.data.orders![index].product.price.currencyFormatRp}');
                        //     })
                      });
                },
              ),
              const Divider(height: 36.0),
              _LabelValue(
                label: 'TOTAL PEMBELIAN',
                value: widget.data.totalPrice.currencyFormatRp,
              ),
              const Divider(height: 36.0),
              _LabelValue(
                label: 'NOMINAL BAYAR',
                value: widget.data.paymentMethod == "QRIS"
                    ? widget.data.totalPrice.currencyFormatRp
                    : widget.data.nominalBayar.currencyFormatRp,
              ),
              (widget.data.nominalBayar > widget.data.totalPrice)
                  ? const Divider(height: 36.0)
                  : SizedBox(),
              (widget.data.nominalBayar > widget.data.totalPrice)
                  ? _LabelValue(
                      label: 'KEMBALIAN',
                      value: (widget.data.nominalBayar - widget.data.totalPrice)
                          .currencyFormatRp,
                    )
                  : SizedBox(),
              const Divider(height: 36.0),
              _LabelValue(
                label: 'WAKTU PEMBAYARAN',
                value: DateTime.now().toFormattedTime(),
              ),
              const Divider(height: 36.0),
              _LabelValue(
                label: 'WAKTU PEMBAYARAN',
                value: DateFormat('yyyy-MM-dd HH:mm:ss')
                    .format(DateTime.parse(widget.data.transactionTime)),
              ),
              const SpaceHeight(40.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Button.filled(
                      onPressed: () {
                        context
                            .read<OrderBloc>()
                            .add(const OrderEvent.started());
                        context.pop();
                      },
                      label: 'Selesai',
                      fontSize: 13,
                    ),
                  ),
                  const SpaceWidth(10.0),
                  Flexible(
                    child: Button.outlined(
                      onPressed: () async {
                        print(widget.data.transactionTime);
                        print(widget.data.orders);
                        final ticket = await CwbPrint.instance.printOrder(
                            widget.data.tableNumber!,
                            widget.data.orders!,
                            widget.data.totalQuantity,
                            widget.data.totalPrice,
                            widget.data.paymentMethod,
                            widget.data.nominalBayar,
                            widget.data.namaKasir,
                            widget.data.transactionTime);
                        final result =
                            await PrintBluetoothThermal.writeBytes(ticket);
                      },
                      label: 'Print',
                      icon: Assets.icons.print.svg(),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LabelValue extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _LabelValue({
    required this.label,
    required this.value,
    this.valueColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SpaceHeight(5.0),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

class _ItemListValue extends StatelessWidget {
  final String label;
  final String itemName;
  final Color? valueColor;
  final String itemQty;

  const _ItemListValue({
    Key? key,
    required this.label,
    required this.itemName,
    this.valueColor = Colors.black,
    required this.itemQty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SpaceHeight(5.0),
        Row(
          children: [
            Text(
              itemName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: valueColor,
              ),
            ),
            Spacer(),
            Text(
              itemQty,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: valueColor,
              ),
            ),
          ],
        ),
        Divider(
          height: 36,
        ),
      ],
    );
  }
}
