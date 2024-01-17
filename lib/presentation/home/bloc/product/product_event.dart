part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.fetch() = _Fetch;
  const factory ProductEvent.fetchByCategory(String category, String search) =
      _FetchByCategory;
  const factory ProductEvent.fetchLocal() = _FetchLocal;
  const factory ProductEvent.addProduct(Product product, XFile image) =
      _AddProduct;

  const factory ProductEvent.editProduct(Product product, [XFile? image]) =
      _EditProduct;
}
