import 'package:cached_network_image/cached_network_image.dart';
import 'package:fic1_pos_flutter_martinus/core/constants/variables.dart';
import 'package:fic1_pos_flutter_martinus/core/extensions/int_ext.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/product_response_model.dart';
import 'package:flutter/material.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  final VoidCallback onCartButton;

  const ProductCard({
    super.key,
    required this.data,
    required this.onCartButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.card),
          borderRadius: BorderRadius.circular(19),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.disabled.withOpacity(0.4),
            ),
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              // child: Image.asset(data.image, width: 80, height: 80),
              // child: Image.network(data.image),
              child: CachedNetworkImage(
                imageUrl:
                    '${data.image.contains("http") ? data.image : Variables.imageBaseUrl + data.image}',
                fit: BoxFit.cover,
                width: 80,
                height: 80,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(
                  Icons.food_bank_outlined,
                  size: 80,
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            data.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SpaceHeight(8.0),
          Text(
            data.category,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
            ),
          ),
          const SpaceHeight(8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  data.price.currencyFormatRp,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onCartButton,
                child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      color: AppColors.primary,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ) //Assets.icons.orders.svg(),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}