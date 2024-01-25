import 'package:CashierPOS/data/datasources/auth_local_datasource.dart';
import 'package:CashierPOS/data/datasources/auth_remote_datasource.dart';
import 'package:CashierPOS/data/models/request/order_request_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';

class OrderRemoteDatasource {
  Future<bool> sendOrder(OrderRequestModel orderRequestModel) async {
    final url = Uri.parse('${Variables.baseUrl}/api/orders');
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    print(orderRequestModel.toJson());
    final response = await http.post(url,
        body: orderRequestModel.toJson(), headers: headers);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
