import 'package:flutter/material.dart';

class Constants {
  //Base Url

  static const String baseUrl = 'http://sherin925.pythonanywhere.com';

  //Url Slugs

  static const String apiLogin = '/api/user/login/';
  static const String apiCreateReceipt = '/api/user/create-reciept/';
  static const String apiSendImage = '/api/user/external-picture/';
  static const String apiReceiptSummary = '/api/user/reciept-summary/';
  static const String apiQrCode = '/api/user/generate-qrcode/';
  static const String apiSendDocImage = '/api/user/cargo-document/';
  static const String apiGetCargoID = '/api/user/line-check/';
  static const String apiGetQrRes = '/api/user/qr-search/';
  static const String specUpdate = '/api/user/specs-update/';
  static const String search = '/api/user/common-search/?';


//Color Profile

  static const Color primaryColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color secondaryColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color amber = Color.fromRGBO(255, 191, 0, 1);

//font profiles

  static const String fontRegular = 'Oxygen-Regular';
  static const String fontMedium = 'Oxygen-Light';
  static const String fontBold = 'Oxygen-Bold';
}
