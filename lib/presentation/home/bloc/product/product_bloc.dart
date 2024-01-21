// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:fic1_pos_flutter_martinus/data/datasources/product_local_datasource.dart';
import 'package:fic1_pos_flutter_martinus/data/models/request/product_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fic1_pos_flutter_martinus/data/datasources/product_remote_datasource.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/product_response_model.dart';
import 'package:image_picker/image_picker.dart';

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
      print(response);
      response.fold(
        (l) => emit(_Error(l)),
        (r) async {
          // await ProductLocalDatasource.instance.removeAllProduct();
          // await ProductLocalDatasource.instance.insertAllProduct(r.data);
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

      final searchProducts = newProducts
          .where((element) =>
              element.name.toLowerCase().contains(event.search.toLowerCase()))
          .toList();
      emit(_Success(searchProducts));
    });

    on<_AddProduct>((event, emit) async {
      emit(_Loading());
      final requestData = ProductRequestModel(
          name: event.product.name,
          price: event.product.price,
          stock: event.product.stock,
          category: event.product.category,
          image: event.image,
          isBestSeller: event.product.isBestSeller ? 1 : 0);
      final newProduct = await _productRemoteDatasource.addProduct(requestData);

      newProduct.fold(
        (l) => emit(_Error(l)),
        (r) {
          products.add(r.data);
          ProductLocalDatasource.instance.insertProduct(r.data);
          emit(_Success(products));
        },
      );

      // emit(_Success(products));
    });

    on<_EditProduct>((event, emit) async {
      emit(_Loading());
      final requestData;

      if (event.image != null) {
        requestData = ProductRequestModel(
            productId: event.product.id,
            name: event.product.name,
            price: event.product.price,
            stock: event.product.stock,
            category: event.product.category,
            image: event.image,
            isBestSeller: event.product.isBestSeller ? 1 : 0);
      } else {
        requestData = ProductRequestModel(
            productId: event.product.id,
            name: event.product.name,
            price: event.product.price,
            stock: event.product.stock,
            category: event.product.category,
            isBestSeller: event.product.isBestSeller ? 1 : 0);
      }
      print(requestData);

      final updatedProduct =
          await _productRemoteDatasource.editProduct(requestData);

      print(updatedProduct);
      updatedProduct.fold(
        (l) => emit(_Error(l)),
        (r) {
          // products.add(r.data);
          ProductLocalDatasource.instance.updateProduct(r.data);

          emit(_Success(products));
        },
      );
    });
  }
}
