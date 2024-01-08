import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fic1_pos_flutter_martinus/core/constants/variables.dart';
import 'package:fic1_pos_flutter_martinus/data/datasources/auth_local_datasource.dart';
import 'package:fic1_pos_flutter_martinus/data/models/request/product_request_model.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/add_product_response_model.dart';

import 'package:fic1_pos_flutter_martinus/data/models/response/product_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModels>> getProducts() async {
    // return http.Response('Login', 200);
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/api/products'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData.token}',
    });
    // log(response.body);
    if (response.statusCode == 200) {
      return right(ProductResponseModels.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, AddProductResponseModel>> addProduct(
      ProductRequestModel productRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData.token}'
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse('${Variables.baseUrl}/api/products'));

    print(productRequestModel.toMap());
    request.fields.addAll(productRequestModel.toMap());

    request.files.add(await http.MultipartFile.fromPath(
        'image', productRequestModel.image.path));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      return right(AddProductResponseModel.fromJson(body));
    } else {
      return left(body);
    }

    // log(response.body);
    // if (response.statusCode == 200) {
    //   return right(ProductResponseModels.fromJson(response.body));
    // } else {
    //   return left(response.body);
    // }
  }
}
