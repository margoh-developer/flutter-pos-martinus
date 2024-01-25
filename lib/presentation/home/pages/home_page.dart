// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:CashierPOS/core/extensions/build_context_ext.dart';
import 'package:CashierPOS/presentation/order/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:CashierPOS/core/assets/assets.gen.dart';
import 'package:CashierPOS/core/components/menu_button.dart';
import 'package:CashierPOS/core/components/search_input.dart';
import 'package:CashierPOS/core/components/spaces.dart';
import 'package:CashierPOS/core/constants/colors.dart';
import 'package:CashierPOS/data/models/response/product_response_model.dart';
import 'package:CashierPOS/presentation/home/bloc/product/product_bloc.dart';
import 'package:CashierPOS/presentation/home/models/product_category.dart';
import 'package:CashierPOS/presentation/home/models/product_model.dart';
import 'package:CashierPOS/presentation/home/widgets/product_card.dart';
import 'package:CashierPOS/presentation/home/widgets/product_empty.dart';

import '../../../data/datasources/product_local_datasource.dart';

class HomePage extends StatefulWidget {
  final int tableNumber;
  const HomePage({
    Key? key,
    required this.tableNumber,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final indexValue = ValueNotifier(0);
  var productCategory = "all";

  List<ProductModel> searchResults = [];
  // final List<ProductModel> products = [
  //   ProductModel(
  //     image: Assets.images.f1.path,
  //     name: 'Nutty Latte',
  //     category: ProductCategory.drink,
  //     price: 39000,
  //     stock: 10,
  //   ),
  //   ProductModel(
  //     image: Assets.images.f2.path,
  //     name: 'Iced Latte',
  //     category: ProductCategory.drink,
  //     price: 24000,
  //     stock: 10,
  //   ),
  //   ProductModel(
  //     image: Assets.images.f3.path,
  //     name: 'Iced Mocha',
  //     category: ProductCategory.drink,
  //     price: 33000,
  //     stock: 10,
  //   ),
  //   ProductModel(
  //     image: Assets.images.f4.path,
  //     name: 'Hot Mocha',
  //     category: ProductCategory.drink,
  //     price: 33000,
  //     stock: 10,
  //   ),
  // ];

  @override
  void initState() {
    // searchResults = products;

    context.read<ProductBloc>().add(ProductEvent.fetchLocal());
    super.initState();
  }

  void onCategoryTap(int index) {
    // searchController.clear();
    indexValue.value = index;
    // String category = 'all';
    switch (index) {
      case 0:
        productCategory = 'all';
        break;
      case 1:
        productCategory = 'drink';
        break;
      case 2:
        productCategory = 'food';
        break;
      case 3:
        productCategory = 'snack';
        break;
    }
    context.read<ProductBloc>().add(
        ProductEvent.fetchByCategory(productCategory, searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Menu untuk Meja ${widget.tableNumber}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<ProductBloc>().add(ProductEvent.fetchLocal());
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Sync Data Successfully"),
              backgroundColor: AppColors.primary,
            ));
          },
          // child: BlocListener<ProductBloc, ProductState>(
          //   listener: (context, state) {
          //     state.maybeMap(
          //         orElse: () {},
          //         success: (_) {
          //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //             content: Text("Sync Data Successfully"),
          //             backgroundColor: AppColors.primary,
          //           ));
          //           // context.read<ProductBloc>().add(ProductEvent.fetchLocal());
          //         });
          //   },
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              SearchInput(
                clearTap: () {
                  searchController.clear();
                  context
                      .read<ProductBloc>()
                      .add(ProductEvent.fetchByCategory(productCategory, ""));
                },
                controller: searchController,
                onChanged: (value) {
                  context.read<ProductBloc>().add(
                      ProductEvent.fetchByCategory(productCategory, value));

                  // indexValue.value = 0;
                  // searchResults = products
                  //     .where((e) =>
                  //         e.name.toLowerCase().contains(value.toLowerCase()))
                  //     .toList();
                  // setState(() {});
                },
              ),
              const SpaceHeight(20.0),
              ValueListenableBuilder(
                valueListenable: indexValue,
                builder: (context, value, _) => Row(
                  children: [
                    MenuButton(
                      iconPath: Assets.icons.allCategories.path,
                      label: 'Semua',
                      isActive: value == 0,
                      onPressed: () => onCategoryTap(0),
                    ),
                    const SpaceWidth(10.0),
                    MenuButton(
                      iconPath: Assets.icons.drink.path,
                      label: 'Minuman',
                      isActive: value == 1,
                      onPressed: () => onCategoryTap(1),
                    ),
                    const SpaceWidth(10.0),
                    MenuButton(
                      iconPath: Assets.icons.food.path,
                      label: 'Makanan',
                      isActive: value == 2,
                      onPressed: () => onCategoryTap(2),
                    ),
                    const SpaceWidth(10.0),
                    MenuButton(
                      iconPath: Assets.icons.snack.path,
                      label: 'Snack',
                      isActive: value == 3,
                      onPressed: () => onCategoryTap(3),
                    ),
                  ],
                ),
              ),
              const SpaceHeight(35.0),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return const Center(
                      child: SizedBox(
                        height: 20,
                      ),
                    );
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }, error: (message) {
                    return Center(
                      child: Text(message),
                    );
                  }, success: (products) {
                    if (products.isEmpty) {
                      return const ProductEmpty();
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.65,
                        crossAxisCount: 2,
                        crossAxisSpacing: 30.0,
                        mainAxisSpacing: 30.0,
                      ),
                      itemBuilder: (context, index) => ProductCard(
                        data: products[index],
                        tableNumber: widget.tableNumber,
                        // onCartButton: () {},
                      ),
                    );
                  });
                },
              ),
              const SpaceHeight(30.0),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.shopping_cart),
            onPressed: () {
              context.push(OrderPage(tableNumber: widget.tableNumber));
            }),
      ),
    );
  }
}
