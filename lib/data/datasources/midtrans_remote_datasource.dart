import 'dart:convert';

import 'package:fic1_pos_flutter_martinus/data/datasources/auth_local_datasource.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/qris_response_model.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/qris_status_response_model.dart';
import 'package:http/http.dart' as http;


class MidtransRemoteDataSource {
  String generateBasicAuthHeader(String serverKey) {
    final base64 = base64Encode(utf8.encode(serverKey));
    final authHeader = 'Basic $base64';
    return authHeader;
  }

  Future<QrisResponseModel> generateQRCode(
      String orderId, int grossAmount) async {
    final serverKey = await AuthLocalDataSource().getMitransServerKey();
    final headers = {
      'Accept': 'application/json',
      'Authorization': generateBasicAuthHeader(serverKey),
      'Content-Type': 'application/json'
    };

    final body = jsonEncode({
      "payment_type": "gopay",
      "transaction_details": {"order_id": orderId, "gross_amount": grossAmount}
    });

    final response = await http.post(
      Uri.parse("https://api.sandbox.midtrans.com/v2/charge"),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return QrisResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to generate QR code');
    }
  }

  Future<QrisStatusResponseModel> checkPaymentStatus(String orderId) async {
    final serverKey = await AuthLocalDataSource().getMitransServerKey();
    final headers = {
      'Accept': 'application/json',
      'Authorization': generateBasicAuthHeader(serverKey),
      'Content-Type': 'application/json'
    };

    final response = await http.get(
      Uri.parse('https://api.sandbox.midtrans.com/v2/$orderId/status'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return QrisStatusResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to check payment status');
    }
  }
}
