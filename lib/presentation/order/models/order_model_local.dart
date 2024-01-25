// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../data/models/request/order_request_model.dart';
import '../../home/models/order_item.dart';

class OrderModelLocal {
  final int? id;
  final String paymentMethod;
  final int nominalBayar;
  List<OrderItemModel>? orders;
  final int totalQuantity;
  final int totalPrice;
  final int idKasir;
  final String namaKasir;
  final String transactionTime;
  final bool isSync;
  final int? tableNumber;
  OrderModelLocal({
    this.id,
    required this.paymentMethod,
    required this.nominalBayar,
    this.orders,
    required this.totalQuantity,
    required this.totalPrice,
    required this.idKasir,
    required this.namaKasir,
    required this.transactionTime,
    required this.isSync,
    this.tableNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'paymentMethod': paymentMethod,
      'nominalBayar': nominalBayar,
      'orders': orders?.map((x) => x.toMap()).toList(),
      'totalQuantity': totalQuantity,
      'totalPrice': totalPrice,
      'idKasir': idKasir,
      'namaKasir': namaKasir,
      'isSync': isSync,
      'tableNumber': tableNumber,
    };
  }

  //  mominal INTEGER,
  //       payment_method TEXT
  //       total_item INTEGER,
  //       id_kasir INTEGER,
  //       nama_kasir TEXT,
  //       is_sync INTEGER DEFAULT 0

  Map<String, dynamic> toMapForLocal() {
    return {
      'payment_method': paymentMethod,
      'total_item': totalQuantity,
      'nominal': nominalBayar,
      'total_price': totalPrice,
      'id_kasir': idKasir,
      'nama_kasir': namaKasir,
      'is_sync': isSync ? 1 : 0,
      'transaction_time': transactionTime,
      'tableNumber': tableNumber,
    };
  }

  factory OrderModelLocal.fromLocalMap(Map<String, dynamic> map) {
    return OrderModelLocal(
      paymentMethod: map['payment_method'] ?? '',
      nominalBayar: map['nominal']?.toInt() ?? 0,
      // orders: [],
      totalQuantity: map['total_item']?.toInt() ?? 0,
      totalPrice: map['total_price']?.toInt() ?? 0,
      idKasir: map['id_kasir']?.toInt() ?? 0,
      isSync: map['is_sync'] == 1 ? true : false,
      namaKasir: map['nama_kasir'] ?? '',
      id: map['id']?.toInt() ?? 0,
      transactionTime: map['transaction_time'] ?? '',
      tableNumber: map['tableNumber']?.toInt() ?? 0,
    );
  }

  factory OrderModelLocal.fromMap(Map<String, dynamic> map) {
    return OrderModelLocal(
      paymentMethod: map['paymentMethod'] ?? '',
      nominalBayar: map['nominalBayar']?.toInt() ?? 0,
      orders:
          List<OrderItemModel>.from(map['orders']?.map((x) => OrderItemModel.fromMap(x))),
      totalQuantity: map['totalQuantity']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toInt() ?? 0,
      idKasir: map['idKasir']?.toInt() ?? 0,
      isSync: map['isSync'] ?? false,
      namaKasir: map['namaKasir'] ?? '',
      id: map['id']?.toInt() ?? 0,
      transactionTime: map['transactionTime'] ?? '',
      tableNumber: map['tableNumber']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModelLocal.fromJson(String source) =>
      OrderModelLocal.fromMap(json.decode(source));
}
