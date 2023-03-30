// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.status,
    this.sessionData,
    this.token,
  });

  bool? status;
  SessionData? sessionData;
  String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"] ?? null,
        sessionData: json["session_data"] == null
            ? null
            : SessionData.fromJson(json["session_data"]),
        token: json["token"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? null,
        "session_data": sessionData == null ? null : sessionData!.toJson(),
        "token": token ?? null,
      };
}

class SessionData {
  SessionData({
    this.token,
    this.username,
    this.status,
    this.id,
  });

  String? token;
  String? username;
  String? status;
  int? id;

  factory SessionData.fromJson(Map<String, dynamic> json) => SessionData(
        token: json["token"] ?? null,
        username: json["username"] ?? null,
        status: json["status"] ?? null,
        id: json["id"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "token": token ?? null,
        "username": username ?? null,
        "status": status ?? null,
        "id": id ?? null,
      };
}
