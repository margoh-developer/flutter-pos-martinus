// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:CashierPOS/core/constants/variables.dart';
import 'package:CashierPOS/presentation/home/settings/pages/manage_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:CashierPOS/core/extensions/build_context_ext.dart';
import 'package:CashierPOS/core/extensions/int_ext.dart';
import 'package:CashierPOS/core/extensions/string_ext.dart';
import 'package:CashierPOS/presentation/home/pages/dashboard_page.dart';

import '../../../../core/components/buttons.dart';
import '../../../../core/components/custom_dropdown.dart';
import '../../../../core/components/custom_text_field.dart';
import '../../../../core/components/image_picker_widget.dart';
import '../../../../core/components/spaces.dart';
import '../../../../core/constants/colors.dart';
import '../../../../data/models/response/product_response_model.dart';
import '../../bloc/product/product_bloc.dart';
import '../models/category_model.dart';

class EditProductPage extends StatefulWidget {
  final Product data;
  const EditProductPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  String category = 'food';

  XFile? imageFile;

  bool isBestSeller = false;

  final List<CategoryModel> categories = [
    CategoryModel(name: 'Minuman', value: 'drink'),
    CategoryModel(name: 'Makanan', value: 'food'),
    CategoryModel(name: 'Snack', value: 'snack'),
  ];

  @override
  void initState() {
    nameController.text = widget.data.name;
    priceController.text = widget.data.price.currencyFormatRp;
    stockController.text = widget.data.stock.toString();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
    stockController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          CustomTextField(
            controller: nameController,
            label: 'Nama Produk',
          ),
          const SpaceHeight(20.0),
          CustomTextField(
            controller: priceController,
            label: 'Harga Produk',
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final int priceValue = value.toIntegerFromText;
              priceController.text = priceValue.currencyFormatRp;
              // priceController?.selection = TextSelection.fromPosition(
              //     TextPosition(offset: priceController.text.length));
            },
          ),
          const SpaceHeight(20.0),
          ImagePickerWidget(
            existingImageURL: '${Variables.imageBaseUrl}${widget.data.image}',
            label: 'Foto Produk',
            onChanged: (file) {
              if (file == null) {
                return;
              }
              imageFile = file;
            },
          ),
          const SpaceHeight(20.0),
          CustomTextField(
            controller: stockController,
            label: 'Stok Produk',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(20.0),
          Row(
            children: [
              Checkbox(
                value: isBestSeller,
                onChanged: (value) {
                  setState(() {
                    isBestSeller = value!;
                  });
                },
              ),
              const Text('Produk Terlaris'),
            ],
          ),
          const SpaceHeight(20.0),
          CustomDropdown<CategoryModel>(
            // value: widget.data.category == 'drink'
            //     ? categories[0]
            //     : widget.data.category == 'food'
            //         ? categories[1]
            //         : categories[2],
            value: categories.firstWhere(
              (category) => category.value == widget.data.category,
              orElse: () => categories[
                  0], // Atau nilai default jika kategori tidak ditemukan
            ),
            items: categories,
            label: 'Kategori',
            onChanged: (value) {
              category = value!.value;
            },
          ),
          const SpaceHeight(24.0),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                error: (message) {
                  print(message.message);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: AppColors.primary,
                      content: Text(
                        message.message,
                      )));
                },
                success: (_) {
                  // Navigator.pop(context);
                  // context.read<ProductBloc>().add(ProductEvent.fetch());

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPage()));
                 
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, success: (_) {
                return Button.filled(
                  onPressed: () {
                    final Product product;
                    final String name = nameController.text;
                    final int price = priceController.text.toIntegerFromText;
                    final int stock = stockController.text.toIntegerFromText;
                    if (imageFile == null) {
                      product = Product(
                        name: name,
                        price: price,
                        stock: stock,
                        category: category,
                        isBestSeller: isBestSeller,
                        productId: widget.data.productId,
                      );
                      context
                          .read<ProductBloc>()
                          .add(ProductEvent.editProduct(product));
                    } else {
                      product = Product(
                        name: name,
                        price: price,
                        stock: stock,
                        category: category,
                        isBestSeller: isBestSeller,
                        productId: widget.data.productId,
                        image: imageFile!.path,
                      );
                      context
                          .read<ProductBloc>()
                          .add(ProductEvent.editProduct(product, imageFile!));
                    }

                    // context
                    //     .read<ProductBloc>()
                    //     .add(ProductEvent.editProduct(product));

                    //navigate to home
                  },
                  label: 'Simpan',
                );
              });
            },
          ),
          const SpaceHeight(30.0),
          Button.outlined(
            onPressed: () {
              Navigator.pop(context);
            },
            label: 'Batal',
          ),
          const SpaceHeight(30.0),
        ],
      ),
    );
  }
}
