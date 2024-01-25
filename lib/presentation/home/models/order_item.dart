// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../data/models/request/order_request_model.dart';
import '../../../data/models/response/product_response_model.dart';

class OrderItem {
  final Product product;
  int quantity;
  final int tableNumber;

  OrderItem({
    required this.product,
    required this.quantity,
    required this.tableNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
      'tableNumber': tableNumber,
    };
  }

  Map<String, dynamic> toMapForLocal(int orderId) {
    return {
      'id_order': orderId,
      'id_product': product.productId,
      'quantity': quantity,
      'price': product.price,
      'tableNumber': tableNumber
    };
  }

  static OrderItemModel fromMapLocal(Map<String, dynamic> map) {
    return OrderItemModel(
      productId: map['id_product']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
      totalPrice: map['price']?.toInt() ?? 0 * (map['quantity']?.toInt() ?? 0),
      // tableNumber: map['tableNumber']?.toInt() ?? 0,
    );
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    
    return OrderItem(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
      tableNumber: map['tableNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) =>
      OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);

  OrderItem copyWith({
    Product? product,
    int? quantity,
    int? tableNumber,
  }) {
    return OrderItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      tableNumber: tableNumber ?? this.tableNumber,
    );
  }

  @override
  String toString() =>
      'OrderItem(product: $product, quantity: $quantity, tableNumber: $tableNumber)';

  @override
  bool operator ==(covariant OrderItem other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.quantity == quantity &&
        other.tableNumber == tableNumber;
  }

  @override
  int get hashCode =>
      product.hashCode ^ quantity.hashCode ^ tableNumber.hashCode;
}
