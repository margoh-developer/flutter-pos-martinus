import 'package:fic1_pos_flutter_martinus/core/extensions/int_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fic1_pos_flutter_martinus/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:fic1_pos_flutter_martinus/presentation/home/models/order_item.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';

class ListOrderCard extends StatefulWidget {
  final int tableNumber;
  final VoidCallback onDeleteTap;
  final EdgeInsetsGeometry? padding;
  final List<OrderItem> listTableOrders;

  const ListOrderCard({
    Key? key,
    required this.tableNumber,
    required this.onDeleteTap,
    this.padding,
    required this.listTableOrders,
  }) : super(key: key);

  @override
  State<ListOrderCard> createState() => _ListOrderCardState();
}

class _ListOrderCardState extends State<ListOrderCard> {
  List<OrderItem> newCheckout = [];
  int totalQuantity = 0;
  int totalPrice = 0;
  @override
  void initState() {
    List<OrderItem> products = widget.listTableOrders;

    if (products.isNotEmpty) {
      newCheckout = products;

      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += element.quantity * element.product.price;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          margin: widget.padding,
          padding: const EdgeInsets.all(16.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Color(0xFFC7D0EB)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            children: [
              const SpaceWidth(24.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meja - ${widget.tableNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          totalPrice.currencyFormatRp,
                          // data.product.price.currencyFormatRp,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(20.0),
                    StatefulBuilder(
                      builder: (context, setState) => Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // context.read<CheckoutBloc>().add(
                              //     CheckoutEvent.removeCheckout());

                              // if (data.quantity > 1) {
                              //   data.quantity--;
                              //   setState(() {});
                              // }
                            },
                            child: Container(
                              color: AppColors.white,
                              child: const Icon(
                                Icons.remove_circle,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40.0,
                            child: Center(
                              child: Text(totalQuantity.toString()),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // context
                              //     .read<CheckoutBloc>()
                              //     .add(CheckoutEvent.addcheckout(data.product));
                              // data.quantity++;
                              // setState(() {});
                            },
                            child: Container(
                              color: AppColors.white,
                              child: const Icon(
                                Icons.add_circle,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: widget.onDeleteTap,
            icon: const Icon(
              Icons.highlight_off,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
