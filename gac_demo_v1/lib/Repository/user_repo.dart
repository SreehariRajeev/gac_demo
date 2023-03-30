import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gac_demo_v1/Utils/api_calls.dart';
import 'package:gac_demo_v1/Utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/login_model.dart';

class UserRepo {
  ApiCalls apiCalls = ApiCalls();

  Future<Response?> loginUser(String userName, String password) async {
    Map<String, String> headers = {};

    Map<String, dynamic> data = {'username': userName, 'password': password};
    print(data);
    Response? response =
        await apiCalls.postQuery(Constants.apiLogin, headers, data, 'loginApi');
    print(response!.data);
    return response;
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("isLoggedIn") ?? false;
  }

  setUserLogIn(bool isLoggedIn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool("isLoggedIn", isLoggedIn);
  }

  Future<LoginResponse?> getLoginResponse() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("UserDetails") == null) {
      return null;
    } else {
      String? userResponse = pref.getString("UserDetails");
      print('getLoginResponse  ======   $userResponse ');
      return LoginResponse.fromJson(json.decode(userResponse!));
    }
  }

  storeLoginResponse(LoginResponse userData) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(userData);
    pref.setString("UserDetails", userProfileJson);
  }
}
