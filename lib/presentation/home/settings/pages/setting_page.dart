import 'package:fic1_pos_flutter_martinus/core/assets/assets.gen.dart';
import 'package:fic1_pos_flutter_martinus/core/components/menu_button.dart';
import 'package:fic1_pos_flutter_martinus/core/constants/colors.dart';
import 'package:fic1_pos_flutter_martinus/core/extensions/build_context_ext.dart';
import 'package:fic1_pos_flutter_martinus/data/datasources/auth_local_datasource.dart';
import 'package:fic1_pos_flutter_martinus/data/datasources/product_local_datasource.dart';
import 'package:fic1_pos_flutter_martinus/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:fic1_pos_flutter_martinus/presentation/auth/pages/login_page.dart';
import 'package:fic1_pos_flutter_martinus/presentation/home/bloc/product/product_bloc.dart';
import 'package:fic1_pos_flutter_martinus/presentation/home/settings/pages/manage_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/spaces.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              MenuButton(
                iconPath: Assets.images.manageProduct.path,
                label: 'Kelola Produk',
                onPressed: () {
                  context.push(const ManageProductPage());
                },
                isImage: true,
              ),
              const SpaceWidth(15.0),
              MenuButton(
                iconPath: Assets.images.managePrinter.path,
                label: 'Kelola Printer',
                onPressed: () {}, // => context.push(const ManagePrinterPage()),
                isImage: true,
              ),
            ],
          ),
          const SpaceHeight(20),
          const Divider(),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) async {
              state.maybeMap(
                orElse: () {},
                success: (_) async {
                  await ProductLocalDatasource.instance.removeAllProduct();
                  await ProductLocalDatasource.instance
                      .insertAllProduct(_.products.toList());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Sync Data Successfully"),
                    backgroundColor: AppColors.primary,
                  ));
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return ElevatedButton(
                    onPressed: () {
                      context.read<ProductBloc>().add(ProductEvent.fetch());
                    },
                    child: Text("Sync Data Online"));
              }, loading: () {
                return Center(child: const CircularProgressIndicator());
              });
            },
          ),
          const Divider(),
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeMap(
                  orElse: () {},
                  success: (_) {
                    AuthLocalDataSource().removeAuthData();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Logout Successfully"),
                      backgroundColor: AppColors.red,
                    ));
                  });
            },
            builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    context.read<LogoutBloc>().add(LogoutEvent.logout());
                  },
                  child: Text("Logout"));
            },
          ),
        ],
      ),
    );
  }
}
