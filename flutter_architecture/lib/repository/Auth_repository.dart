import 'package:flutter_architecture/data/network/BaseApiServices.dart';
import 'package:flutter_architecture/data/network/NetApiServices.dart';
import 'package:flutter_architecture/resources/App_url.dart';
import 'package:flutter_architecture/view_model/auth_view_model.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetApiServices();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerUrlEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
