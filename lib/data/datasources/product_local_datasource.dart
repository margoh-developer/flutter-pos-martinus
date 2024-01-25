import 'package:CashierPOS/data/models/response/product_response_model.dart';
import 'package:CashierPOS/presentation/order/models/order_model_local.dart';
import 'package:sqflite/sqflite.dart';

import '../../presentation/home/models/order_item.dart';
import '../../presentation/order/models/order_model.dart';
import '../models/request/order_request_model.dart';

class ProductLocalDatasource {
  ProductLocalDatasource._init();

  static final ProductLocalDatasource instance = ProductLocalDatasource._init();

  final String tableProducts = 'products';

  static Database? _database;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      // onUpgrade: _upgradeDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableProducts(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          product_id INTEGER,
          name TEXT,
          description TEXT,
          price INTEGER,
          stock INTEGER,
          image TEXT,
          category TEXT,
          is_best_seller INTEGER,
          is_sync INTEGER DEFAULT 0
          )
          ''');

    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nominal INTEGER,
        total_price INTEGER,
        payment_method TEXT,
        total_item INTEGER,
        id_kasir INTEGER,
        nama_kasir TEXT,
        transaction_time TEXT,
        is_sync INTEGER DEFAULT 0,
        tableNumber INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE order_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_order INTEGER,
        id_product INTEGER,
        quantity INTEGER,
        price INTEGER,
        tableNumber INTEGER
      )
    ''');
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    // Anda dapat menambahkan logika pembaruan versi database di sini
    // Contoh:
    if (oldVersion < 2) {
      // Tambahkan logika untuk versi 2 di sini
      // await db
      //     .execute('ALTER TABLE $tableProducts ADD COLUMN product_id INTEGER');
      // await db.execute('ALTER TABLE orders ADD COLUMN transaction_time TEXT');
    }

    // dan seterusnya...

    // Pastikan untuk meningkatkan versi database
    await db.setVersion(newVersion);
  }

//save order
  Future<int> saveOrder(OrderModel order) async {
    final db = await instance.database;
    int id = await db.insert('orders', order.toMapForLocal());
    for (var orderItem in order.orders!) {
      await db.insert('order_items', orderItem.toMapForLocal(id));
    }
    return id;
  }

//get order by isSync = 0
  Future<List<OrderModel>> getOrderByIsSync() async {
    final db = await instance.database;
    final result = await db.query('orders', where: 'is_sync = 0');

    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  //get order item by id order
  Future<List<OrderItem>> getOrderItemByOrderId(int idOrder) async {
    final db = await instance.database;
    final result = await db.query('order_items', where: 'id_order = $idOrder');

    return result.map((e) => OrderItem.fromMap(e)).toList();
  }

  //get order item by id order
  Future<List<OrderItemModel>> getOrderItemByOrderIdLocal(int idOrder) async {
    final db = await instance.database;
    final result = await db.query('order_items', where: 'id_order = $idOrder');

    return result.map((e) => OrderItem.fromMapLocal(e)).toList();
  }

  Future<List<OrderItem>> convertOrderItemModeltoOrderItem(
      List<OrderItemModel> orderItemModels, int tableNumber) async {
    final db = await instance.database;
    List<OrderItem> orderItems = [];

    for (var orderItem in orderItemModels) {
      var product = await db.query('products',
          where: 'product_id = ${orderItem.productId}');
      print(product);

      if (product.isNotEmpty) {
        var firstProductMap = product.first;
        var firstProduct = Product.fromMap(firstProductMap);
        orderItems.add(OrderItem(
          product: firstProduct,
          quantity: orderItem.quantity,
          tableNumber: tableNumber,
        ));
      }
    }
    print(orderItems);
    return orderItems;
  }

  //update isSync order by id
  Future<int> updateIsSyncOrderById(int id) async {
    final db = await instance.database;
    return await db.update('orders', {'is_sync': 1},
        where: 'id = ?', whereArgs: [id]);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('pos1b.db');
    return _database!;
  }

  //remove all dataproduct
  Future<void> removeAllProduct() async {
    final db = await instance.database;
    await db.delete(tableProducts);
  }

  //insert data product
  Future<Product> insertProduct(Product product) async {
    final db = await instance.database;
    int id = await db.insert(tableProducts, product.toMap());
    return product.copyWith(id: id);
  }

  //update single product
  Future<int> updateProduct(Product product) async {
    final db = await instance.database;
    int rowsAffected = await db.update(
      tableProducts,
      product.toLocalMap(),
      where: 'product_id = ?',
      whereArgs: [product.productId],
    );
    return rowsAffected;
  }

  Future<int?> findIdByProductId(String productId) async {
    final db = await instance.database;

    // Lakukan query untuk mencari id berdasarkan product_id
    List<Map<String, dynamic>> result = await db.query(
      tableProducts,
      columns: ['id'],
      where: 'product_id = ?',
      whereArgs: [productId],
    );
    print(result);
    // Jika hasil ditemukan, kembalikan id
    if (result.isNotEmpty) {
      return result.first['id'] as int?;
    } else {
      // Jika tidak ada hasil ditemukan, kembalikan null
      return null;
    }
  }

  //insert data product form list product
  Future<void> insertAllProduct(List<Product> products) async {
    final db = await instance.database;
    // for (int i = products.length - 1; i >= 0; i--) {
    //   final product = products[i];
    //   await db.insert(tableProducts, product.toMap());
    // }
    // for (int i = 0; i < products.length; i++) {
    //   final product = products[i];
    //   await db.insert(tableProducts, product.toMap());
    // }
    for (var product in products) {
      await db.insert(tableProducts, product.toLocalMap());
    }
  }

  //get all local Products
  Future<List<Product>> getAllProduct() async {
    final db = await instance.database;
    final result = await db.query(tableProducts);
    print(result);
    // final result = await db.query(tableProducts, orderBy: 'id DESC');
    return result.map((e) => Product.fromMapLocal(e)).toList();
  }

  //get all orders
  Future<List<OrderModel>> getAllOrder() async {
    final db = await instance.database;
    final result = await db.query('orders', orderBy: 'id DESC');
    // print(result);
    // List<OrderModel> orders = [];

    // for (var orderMap in result) {
    //   OrderModel order = OrderModel.fromLocalMap(orderMap);
    //   print(order);
    //   List<OrderItem> orderItems = await getOrderItemByOrderId(order.id!);
    //   order.orders = orderItems;
    //   orders.add(order);
    // }
    // print(orders);
    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
    // return orders;
  }
}
