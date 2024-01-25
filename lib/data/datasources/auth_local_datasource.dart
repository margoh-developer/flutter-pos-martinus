import 'package:CashierPOS/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', authResponseModel.toJson());
  }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  Future<AuthResponseModel> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');

    return AuthResponseModel.fromJson(authData!);
  }

  Future<bool> isAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');

    return authData != null;
  }

  Future<void> saveMidtransServerKey(String serverKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('server_key', serverKey);
  }

  //get midtrans server key
  Future<String> getMitransServerKey() async {
    final prefs = await SharedPreferences.getInstance();
    final serverKey = prefs.getString('server_key');
    return serverKey ?? '';
  }

  Future<String> setTableQty() async {
    final prefs = await SharedPreferences.getInstance();
    final tableQty = prefs.getString('table_qty');
    return tableQty ?? '';
  }

  Future<void> saveBaseURL(String baseURL) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('base_url', baseURL);
  }

  //get midtrans server key
  Future<String> getBaseURL() async {
    final prefs = await SharedPreferences.getInstance();
    final baseURL = prefs.getString('base_url');
    return baseURL ?? '';
  }
}
