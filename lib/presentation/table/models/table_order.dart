// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../home/models/order_item.dart';

class TableOrder {
  final int tableNumber;
  final List<OrderItem> orders;

  TableOrder({
    required this.tableNumber,
    required this.orders,
  });

  TableOrder copyWith({
    int? tableNumber,
    List<OrderItem>? orders,
  }) {
    return TableOrder(
      tableNumber: tableNumber ?? this.tableNumber,
      orders: orders ?? this.orders,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tableNumber': tableNumber,
      'orders': orders.map((x) => x.toMap()).toList(),
    };
  }

  factory TableOrder.fromMap(Map<String, dynamic> map) {
    return TableOrder(
      tableNumber: map['tableNumber'] as int,
      orders: List<OrderItem>.from(
        (map['orders'] as List<int>).map<OrderItem>(
          (x) => OrderItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TableOrder.fromJson(String source) =>
      TableOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TableOrder(tableNumber: $tableNumber, orders: $orders)';

  @override
  bool operator ==(covariant TableOrder other) {
    if (identical(this, other)) return true;

    return other.tableNumber == tableNumber && listEquals(other.orders, orders);
  }

  @override
  int get hashCode => tableNumber.hashCode ^ orders.hashCode;
}
