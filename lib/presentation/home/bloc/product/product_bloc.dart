// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:fic1_pos_flutter_martinus/data/datasources/product_local_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fic1_pos_flutter_martinus/data/datasources/product_remote_datasource.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/product_response_model.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  List<Product> products = [];
  ProductBloc(
    this._productRemoteDatasource,
  ) : super(_Initial()) {
    on<_Fetch>((event, emit) async {
      emit(_Loading());
      final response = await _productRemoteDatasource.getProducts();
      response.fold(
        (l) => emit(_Error(l)),
        (r) {
          products = r.data;
          emit(_Success(r.data));
        },
      );
    });

    on<_FetchLocal>((event, emit) async {
      emit(_Loading());
      final LocalProduct =
          await ProductLocalDatasource.instance.getAllProduct();
      products = LocalProduct;

      emit(_Success(products));
    });

    on<_FetchByCategory>((event, emit) async {
      emit(_Loading());
      final newProducts = event.category == "all"
          ? products
          : products
              .where((element) => element.category == event.category)
              .toList();
      emit(_Success(newProducts));
    });
  }
}
