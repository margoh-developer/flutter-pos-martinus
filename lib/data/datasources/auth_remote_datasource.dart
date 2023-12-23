import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fic1_pos_flutter_martinus/core/constants/variables.dart';
import 'package:fic1_pos_flutter_martinus/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    // return http.Response('Login', 200);
    final response =
        await http.post(Uri.parse('${Variables.baseUrl}/api/login'), body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(json.decode(response.body)));
    } else {
      return left(response.body);
    }
  }
}
