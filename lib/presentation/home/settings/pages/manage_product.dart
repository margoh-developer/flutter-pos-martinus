// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fic1_pos_flutter_martinus/core/components/spaces.dart';
import 'package:fic1_pos_flutter_martinus/core/constants/colors.dart';
import 'package:fic1_pos_flutter_martinus/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

import 'package:fic1_pos_flutter_martinus/data/models/response/product_response_model.dart';
import 'package:fic1_pos_flutter_martinus/presentation/home/settings/widgets/menu_product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/assets/assets.gen.dart';
import '../../bloc/product/product_bloc.dart';
import '../../models/product_category.dart';
import '../../models/product_model.dart';
import 'add_product_page.dart';

class ManageProductPage extends StatefulWidget {
  // final Product data;
  const ManageProductPage({super.key});

  @override
  State<ManageProductPage> createState() => _ManageProductPageState();
}

class _ManageProductPageState extends State<ManageProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductEvent.fetchByCategory("all", ""));
  }

  final List<ProductModel> products = [
    ProductModel(
      image: Assets.images.f1.path,
      name: 'Vanila Late Vanila itu',
      category: ProductCategory.drink,
      price: 200000,
      stock: 10,
    ),
    ProductModel(
      image: Assets.images.f2.path,
      name: 'V60',
      category: ProductCategory.drink,
      price: 1200000,
      stock: 10,
    ),
    ProductModel(
      image: Assets.images.f3.path,
      name: 'Americano',
      category: ProductCategory.drink,
      price: 2100000,
      stock: 10,
    ),
    ProductModel(
      image: Assets.images.f4.path,
      name: 'Coklat',
      category: ProductCategory.food,
      price: 200000,
      stock: 10,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Product"),
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                success: (products) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          MenuProductItem(data: products[index]),
                      separatorBuilder: (context, index) =>
                          const SpaceHeight(20),
                      itemCount: products.length);
                },
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddProductPage()));
        },
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
