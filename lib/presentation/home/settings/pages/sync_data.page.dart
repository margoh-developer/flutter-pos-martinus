import 'package:CashierPOS/core/components/spaces.dart';
import 'package:CashierPOS/presentation/home/pages/dashboard_page.dart';
import 'package:CashierPOS/presentation/home/settings/bloc/sync_order/sync_order_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../data/datasources/product_local_datasource.dart';
import '../../bloc/product/product_bloc.dart';

class SyncDataPage extends StatefulWidget {
  const SyncDataPage({super.key});

  @override
  State<SyncDataPage> createState() => _SyncDataPageState();
}

class _SyncDataPageState extends State<SyncDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Data Online'),
        centerTitle: true,
      ),
      //textfield untuk input server key
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          //buttonn sync data product
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) async {
              state.maybeMap(
                orElse: () {},
                success: (_) async {
                  await ProductLocalDatasource.instance.removeAllProduct();
                  await ProductLocalDatasource.instance
                      .insertAllProduct(_.products.toList());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    action: SnackBarAction(
                        textColor: AppColors.white,
                        label: "Home",
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardPage()));
                        }),
                    content: Text("Sync Data Product Successfully"),
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
                    child: Text("Sync Data Product"));
              }, loading: () {
                return Center(child: const CircularProgressIndicator());
              });
            },
          ),
          SpaceHeight(20),
          BlocConsumer<SyncOrderBloc, SyncOrderState>(
            listener: (context, state) async {
              state.maybeMap(
                orElse: () {},
                success: (_) async {
                  // await ProductLocalDatasource.instance.removeAllProduct();
                  // await ProductLocalDatasource.instance
                  //     .insertAllProduct(_.products.toList());
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: AppColors.primary,
                      content: Text(
                        'Sync Data Orders Successfully',
                      )));
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return ElevatedButton(
                    onPressed: () {
                      context
                          .read<SyncOrderBloc>()
                          .add(const SyncOrderEvent.sendOrder());
                    },
                    child: const Text('Sync Data Orders'));
              }, loading: () {
                return Center(child: const CircularProgressIndicator());
              });
            },
          ),
        ],
      ),
    );
  }
}
