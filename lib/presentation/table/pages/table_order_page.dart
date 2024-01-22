import 'package:fic1_pos_flutter_martinus/core/extensions/build_context_ext.dart';
import 'package:fic1_pos_flutter_martinus/presentation/home/pages/home_page.dart';
import 'package:fic1_pos_flutter_martinus/presentation/table/widgets/table_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/bloc/checkout/checkout_bloc.dart';
import '../bloc/table/table_bloc.dart';

class TableOrderPage extends StatefulWidget {
  const TableOrderPage({super.key});

  @override
  State<TableOrderPage> createState() => _TableOrderState();
}

class _TableOrderState extends State<TableOrderPage> {
  List<int> tableNumber = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Order'),
        centerTitle: true,
      ),
      body: Container(
          child: ListView(
        children: [
          Text(
            'Pilih Meja yang anda inginkan',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20.0,
          ),
          BlocBuilder<TableBloc, TableState>(
            builder: (context, state) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tableNumber.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) => TableCard(
                    index: tableNumber[index],
                    onTap: () {
                      context.read<CheckoutBloc>().add(
                          CheckoutEvent.loadTableNumber(tableNumber[index]));
                      // context.push(HomePage(
                      //   tableNumber: tableNumber[index],
                      // ));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            tableNumber: tableNumber[index],
                          ),
                        ),
                      );
                      // context
                      //     .read<TableBloc>()
                      //     .add(TableEvent.loadTable(tableNumber[index]));
                    }),
              );
            },
          ),
        ],
      )),
    );
  }
}
