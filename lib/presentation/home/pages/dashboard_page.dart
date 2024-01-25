import 'package:CashierPOS/core/assets/assets.gen.dart';
import 'package:CashierPOS/core/constants/colors.dart';
import 'package:CashierPOS/data/datasources/auth_local_datasource.dart';
import 'package:CashierPOS/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:CashierPOS/presentation/auth/pages/login_page.dart';
import 'package:CashierPOS/presentation/history/pages/history_page.dart';
import 'package:CashierPOS/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:CashierPOS/presentation/home/pages/home_page.dart';
import 'package:CashierPOS/presentation/home/settings/pages/setting_page.dart';
import 'package:CashierPOS/presentation/home/widgets/nav_item.dart';
import 'package:CashierPOS/presentation/order/pages/list_order_page.dart';
import 'package:CashierPOS/presentation/order/pages/order_page.dart';
import 'package:CashierPOS/presentation/table/pages/table_order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const TableOrderPage(),
    // const ListOrderPage(),
    const HistoryPage(),
    const SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Dashboard Page"),
      //   actions: [
      //     BlocConsumer<LogoutBloc, LogoutState>(
      //       listener: (context, state) {
      //         state.maybeMap(
      //             orElse: () {},
      //             success: (_) {
      //               AuthLocalDataSource().removeAuthData();
      //               Navigator.pushReplacement(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const LoginPage()));
      //             });
      //       },
      //       builder: (context, state) {
      //         return IconButton(
      //             onPressed: () {
      //               context.read<LogoutBloc>().add(LogoutEvent.logout());
      //             },
      //             icon: Icon(Icons.logout));
      //       },
      //     )
      //   ],
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 30.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.08),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              iconPath: Assets.icons.home.path,
              label: 'Home',
              isActive: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            // NavItem(
            //     iconPath: Assets.icons.orders.path,
            //     label: 'Orders',
            //     isActive: _selectedIndex == 1,
            //     onTap: () {
            //       _onItemTapped(1);
            //       // context.push(const OrdersPage());
            //     }),
            NavItem(
              iconPath: Assets.icons.payments.path,
              label: 'Histories',
              isActive: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            NavItem(
              iconPath: Assets.icons.dashboard.path,
              label: 'Settings',
              isActive: _selectedIndex == 2,
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}
