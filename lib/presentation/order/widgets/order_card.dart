import 'package:cached_network_image/cached_network_image.dart';
import 'package:fic1_pos_flutter_martinus/core/extensions/int_ext.dart';
import 'package:fic1_pos_flutter_martinus/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:fic1_pos_flutter_martinus/presentation/home/models/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/variables.dart';

class OrderCard extends StatelessWidget {
  final OrderItem data;
  final VoidCallback onDeleteTap;
  final EdgeInsetsGeometry? padding;

  const OrderCard({
    super.key,
    required this.data,
    required this.onDeleteTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          margin: padding,
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
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                child: CachedNetworkImage(
                  imageUrl: //'${Variables.imageBaseUrl}${data.image}',
                      '${data.product.image.contains("http") ? data.product.image : Variables.imageBaseUrl + data.product.image}',
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(
                    Icons.food_bank_outlined,
                    size: 80,
                  ),
                ),

                // Image.asset(
                //   data.product.image,
                //   width: 76,
                //   height: 76,
                //   fit: BoxFit.cover,
                // ),
              ),
              const SpaceWidth(24.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          (data.product.price * data.quantity).currencyFormatRp,
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
                              context.read<CheckoutBloc>().add(
                                  CheckoutEvent.removeCheckout(data.product));

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
                              child: Text(data.quantity.toString()),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<CheckoutBloc>()
                                  .add(CheckoutEvent.addcheckout(data.product));
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
            onPressed: onDeleteTap,
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
