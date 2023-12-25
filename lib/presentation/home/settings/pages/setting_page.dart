import 'package:fic1_pos_flutter_martinus/core/constants/colors.dart';
import 'package:fic1_pos_flutter_martinus/data/datasources/auth_local_datasource.dart';
import 'package:fic1_pos_flutter_martinus/data/datasources/product_local_datasource.dart';
import 'package:fic1_pos_flutter_martinus/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:fic1_pos_flutter_martinus/presentation/auth/pages/login_page.dart';
import 'package:fic1_pos_flutter_martinus/presentation/home/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) async {
              state.maybeMap(
                orElse: () {},
                success: (_) async {
                  await ProductLocalDatasource.instance.removeAllProduct();
                  await ProductLocalDatasource.instance
                      .insertAllProduct(_.products.toList());
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sync Data Successfully"),backgroundColor: AppColors.primary,));
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
                return const CircularProgressIndicator();
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
