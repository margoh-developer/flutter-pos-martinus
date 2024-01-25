import 'package:meta/meta.dart';
import 'dart:convert';

class ProductResponseModels {
  final bool success;
  final String message;
  final List<Product> data;

  ProductResponseModels({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProductResponseModels.fromJson(String str) =>
      ProductResponseModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponseModels.fromMap(Map<String, dynamic> json) =>
      ProductResponseModels(
        success: json["success"],
        message: json["message"],
        data: List<Product>.from(json["data"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Product {
  final int? id;
  final int? productId;
  final String name;
  final String? description;
  final int price;
  final int stock;
  final String category;
  final String? image;
  final bool isBestSeller;
  // final bool isSync;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  Product({
    this.id,
    this.productId,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    required this.category,
    this.image,
    this.isBestSeller = false,
    // this.isSync = true,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        // id: json["id"],
        productId: json["id"],
        name: json["name"],
        description: json["description"] ?? '',
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        image: json["image"] ?? '',
        isBestSeller: json["is_best_seller"] == 1 ? true : false,
        // isSync: json["is_sync"] == null
        //     ? true
        //     : json["is_sync"] == 1
        //         ? true
        //         : false,
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  factory Product.fromMapLocal(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"] ?? '',
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        image: json["image"] ?? '',
        isBestSeller: json["is_best_seller"] == 1 ? true : false,
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "name": name,
        // "description": description,
        "price": price,
        "stock": stock,
        "category": category,
        "image": image,
        "is_best_seller": isBestSeller ? 1 : 0,
        "product_id": id,
        // "is_sync": isSync ? 1 : 0,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toLocalMap() => {
        "name": name,
        "price": price,
        "stock": stock,
        "category": category,
        "image": image,
        "is_best_seller": isBestSeller ? 1 : 0,
        "product_id": productId,
      };

  Product copyWith({
    int? id,
    int? productId,
    String? name,
    String? description,
    int? price,
    int? stock,
    String? category,
    String? image,
    bool? isBestSeller,
    // bool? isSync,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      category: category ?? this.category,
      image: image ?? this.image,
      isBestSeller: isBestSeller ?? this.isBestSeller,
      // isSync: isSync ?? this.isSync,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.stock == stock &&
        other.category == category &&
        other.image == image &&
        other.isBestSeller == isBestSeller &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        stock.hashCode ^
        category.hashCode ^
        image.hashCode ^
        isBestSeller.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
