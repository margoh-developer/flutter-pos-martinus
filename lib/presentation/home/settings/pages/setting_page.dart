import 'package:CashierPOS/core/assets/assets.gen.dart';
import 'package:CashierPOS/core/components/menu_button.dart';
import 'package:CashierPOS/core/constants/colors.dart';
import 'package:CashierPOS/core/extensions/build_context_ext.dart';
import 'package:CashierPOS/data/datasources/auth_local_datasource.dart';
import 'package:CashierPOS/data/datasources/product_local_datasource.dart';
import 'package:CashierPOS/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:CashierPOS/presentation/auth/pages/login_page.dart';
import 'package:CashierPOS/presentation/home/bloc/product/product_bloc.dart';
import 'package:CashierPOS/presentation/home/settings/pages/manage_product.dart';
import 'package:CashierPOS/presentation/home/settings/pages/save_server_key_page.dart';
import 'package:CashierPOS/presentation/home/settings/pages/sync_data.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/spaces.dart';
import 'manage_printer_page.dart';

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
        actions: [
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
              return TextButton.icon(
                onPressed: () {
                  context.read<LogoutBloc>().add(LogoutEvent.logout());
                },
                icon: Icon(Icons.logout),
                label: Text("Logout"),
                // child: Text("Logout")
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Image Logo
          Image.asset(
            Assets.images.logo.path,
            height: 150,
          ),
          Divider(
            height: 20,
          ),
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
                onPressed: () {
                  context.push(const ManagePrinterPage());
                }, // => context.push(const ManagePrinterPage()),
                isImage: true,
              ),
            ],
          ),
          const SpaceHeight(20),
          Row(
            children: [
              // BlocConsumer<ProductBloc, ProductState>(
              //   listener: (context, state) async {
              //     state.maybeMap(
              //       orElse: () {},
              //       success: (_) async {
              //         await ProductLocalDatasource.instance.removeAllProduct();
              //         await ProductLocalDatasource.instance
              //             .insertAllProduct(_.products.toList());
              //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //           content: Text("Sync Data Successfully"),
              //           backgroundColor: AppColors.primary,
              //         ));
              //       },
              //     );
              //   },
              //   builder: (context, state) {
              //     return state.maybeWhen(orElse: () {
              //       return MenuButton(
              //         iconPath: Assets.images.syncData.path,
              //         label: 'Sync Data Online',
              //         onPressed: () {
              //           context.read<ProductBloc>().add(ProductEvent.fetch());
              //         },
              //         isImage: true,
              //       );
              //     }, loading: () {
              //       return Container(
              //           width: context.deviceWidth / 2,
              //           padding: const EdgeInsets.all(8.0),
              //           decoration: BoxDecoration(
              //             color: AppColors.white,
              //             borderRadius:
              //                 const BorderRadius.all(Radius.circular(6.0)),
              //             boxShadow: [
              //               BoxShadow(
              //                 offset: const Offset(0, 4),
              //                 blurRadius: 20.0,
              //                 blurStyle: BlurStyle.outer,
              //                 spreadRadius: 0,
              //                 color: AppColors.black.withOpacity(0.1),
              //               ),
              //             ],
              //           ),
              //           child:
              //               Center(child: const CircularProgressIndicator()));
              //     });
              //   },
              // ),
              MenuButton(
                iconPath: Assets.images.syncData.path,
                label: 'Sync Data Online',
                onPressed: () {
                  context.push(const SyncDataPage());
                },
                isImage: true,
              ),
              const SpaceWidth(15.0),
              MenuButton(
                iconPath: Assets.images.saveKey.path,
                label: 'QRIS Server Key',
                onPressed: () {
                  context.push(const SaveServerKeyPage());
                }, // => context.push(const ManagePrinterPage()),
                isImage: true,
              ),
            ],
          ),

          // const Divider(),
          // BlocConsumer<ProductBloc, ProductState>(
          //   listener: (context, state) async {
          //     state.maybeMap(
          //       orElse: () {},
          //       success: (_) async {
          //         await ProductLocalDatasource.instance.removeAllProduct();
          //         await ProductLocalDatasource.instance
          //             .insertAllProduct(_.products.toList());
          //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //           content: Text("Sync Data Successfully"),
          //           backgroundColor: AppColors.primary,
          //         ));
          //       },
          //     );
          //   },
          //   builder: (context, state) {
          //     return state.maybeWhen(orElse: () {
          //       return ElevatedButton(
          //           onPressed: () {
          //             context.read<ProductBloc>().add(ProductEvent.fetch());
          //           },
          //           child: Text("Sync Data Online"));
          //     }, loading: () {
          //       return Center(child: const CircularProgressIndicator());
          //     });
          //   },
          // ),
          // BlocConsumer<LogoutBloc, LogoutState>(
          //   listener: (context, state) {
          //     state.maybeMap(
          //         orElse: () {},
          //         success: (_) {
          //           AuthLocalDataSource().removeAuthData();
          //           Navigator.pushReplacement(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const LoginPage()));
          //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //             content: Text("Logout Successfully"),
          //             backgroundColor: AppColors.red,
          //           ));
          //         });
          //   },
          //   builder: (context, state) {
          //     return ElevatedButton(
          //         onPressed: () {
          //           context.read<LogoutBloc>().add(LogoutEvent.logout());
          //         },
          //         child: Text("Logout"));
          //   },
          // ),
          Divider(
            height: 20,
          ),
        ],
      ),
    );
  }
}
