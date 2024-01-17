import 'package:cached_network_image/cached_network_image.dart';
import 'package:fic1_pos_flutter_martinus/core/extensions/int_ext.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/product_response_model.dart';
import 'package:fic1_pos_flutter_martinus/presentation/home/settings/pages/edit_product_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/buttons.dart';
import '../../../../core/components/spaces.dart';
import '../../../../core/constants/colors.dart';

import '../../../../core/constants/variables.dart';
import '../../models/product_model.dart';

class MenuProductItem extends StatelessWidget {
  final Product data;
  const MenuProductItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: AppColors.blueLight),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: CachedNetworkImage(
              imageUrl: '${Variables.imageBaseUrl}${data.image}',
              // '${data.image.contains("http") ? data.image : Variables.imageBaseUrl + data.image}',
              fit: BoxFit.cover,
              width: 80,
              height: 80,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(
                Icons.food_bank_outlined,
                size: 80,
              ),
            ),
            // Image.asset(data.image,
            //     width: 74.0, height: 74.0, fit: BoxFit.cover),
          ),
          const SpaceWidth(22.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SpaceHeight(5.0),
                Text(
                  data.category,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SpaceHeight(10.0),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                                title: Text("${data.name}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                backgroundColor: AppColors.blueLight,
                                // icon: const Icon(Icons.info),
                                // title: Text("${data.name}"),
                                contentPadding: EdgeInsets.all(16),
                                children: [
                                  //Stack(children: [
                                  // Positioned(
                                  //   top: 00,
                                  //   right: 0,
                                  //   child: GestureDetector(
                                  //     onTap: () {
                                  //       Navigator.of(context).pop();
                                  //     },
                                  //     child: Icon(Icons.close),
                                  //   ),
                                  // ),
                                  Column(
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Icon(Icons.close),
                                            ),
                                          ]),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(35)),
                                        clipBehavior: Clip.antiAlias,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '${Variables.imageBaseUrl}${data.image}',
                                          // '${data.image?.contains("http") ? data.image! : Variables.imageBaseUrl + data.image!}',
                                          width: 80,
                                          height: 80,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.food_bank_outlined,
                                            size: 80,
                                          ),
                                        ),
                                      ),
                                      SpaceHeight(20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Nama Product :'),
                                          Text('${data.name.toString()}'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Harga :'),
                                          Text(
                                              '${data.price.currencyFormatRp.toString()}'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Stock :'),
                                          Text('${data.stock.toString()}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // ]),
                                ]),
                          );
                        },
                        label: 'Detail',
                        icon: Icon(
                          Icons.info,
                          size: 15,
                          color: AppColors.white,
                        ),
                        fontSize: 12.0,
                        height: 30,
                        color: AppColors.primary,
                        textColor: AppColors.white,
                      ),
                    ),
                    const SpaceWidth(6.0),
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditProductPage(data: data)));
                          // context.push(EditProductPage(data: data));
                        },
                        label: 'Edit',
                        color: AppColors.primary,
                        textColor: AppColors.white,
                        icon:
                            Icon(Icons.edit, size: 15, color: AppColors.white),
                        fontSize: 12.0,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
