import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gac_demo_v1/Models/login_model.dart';
import 'package:gac_demo_v1/Repository/user_repo.dart';
import 'package:gac_demo_v1/Utils/api_calls.dart';
import 'package:gac_demo_v1/Utils/constants.dart';
import 'package:gac_demo_v1/presentation/Screen/Home%20Page/components/specs_update_page.dart';

import '../presentation/Screen/Home Page/components/line_item_check_page.dart';

class ProdRepo {
  UserRepo userRepo = UserRepo();
  String? token;
  ApiCalls apiCalls = ApiCalls();

  Future<Response?> createNewReceipt(
      String customerName,
      String pieces,
      String supplier,
      String po_number,
      String consignee,
      bool no_damage,
      bool link_check_required) async {
    //TODO: Save login token in cache using SharedPrefernce rather than calling the api to get Token.
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;

    Map<String, String> headers = {"Authorization": "Token $token"};

    Map<String, dynamic> data = {
      'customer': customerName,
      'pieces': pieces,
      'supplier': supplier,
      'po_number': po_number,
      'consignee': consignee,
      'no_damage': no_damage,
      'link_check_required': link_check_required,
    };

    print(data);

    Response? response = await apiCalls.postQuery(
        Constants.apiCreateReceipt, headers, data, 'createNewReceiptApi');

    print(response!.statusCode);
    print(response!.statusMessage);
    return response;
  }

  Future<Response?> sendExternalImage(
    String iD,
    List<String> imageList,
  ) async {
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;

    Map<String, String> headers = {"Authorization": "Token $token"};

    Map<String, dynamic> body = {
      "grns": iD,
      "image_files": [
        await MultipartFile.fromFile(imageList[0], filename: 'image-1'),
        await MultipartFile.fromFile(imageList[1] != null ? imageList[1] : '',
            filename: 'image-2'),
        await MultipartFile.fromFile(imageList[2] != null ? imageList[2] : '',
            filename: 'image-3'),
        await MultipartFile.fromFile(imageList[3] != null ? imageList[3] : '',
            filename: 'image-4'),
        await MultipartFile.fromFile(imageList[4] != null ? imageList[4] : '',
            filename: 'image-5'),
        await MultipartFile.fromFile(imageList[5] != null ? imageList[5] : '',
            filename: 'image-6'),
      ]
    };

    FormData formData = FormData.fromMap(body);

    print(body);

    Response? response = await apiCalls.postQuery(
        Constants.apiSendImage, headers, formData, 'createNewReceiptApi');

    print(response!.statusCode);
    print(response!.statusMessage);
    return response;
  }

  Future<Response?> getReceiptSummary(String grnId) async {
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;

    Map<String, String> headers = {"Authorization": "Token $token"};
    Map<String, dynamic> query = {};
    Response? response = await apiCalls.getQuery(
        "${Constants.apiReceiptSummary}+?grns=${grnId}",
        headers,
        query,
        'receipt-summary',
        false,
        true,
        true);
    return response;
  }

  searchItems(String serachKeyword) async {
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;

    Map<String, String> headers = {"Authorization": "Token $token"};
    Map<String, dynamic> query = {};

    Response? response = await apiCalls.getQuery(
        "${Constants.search}$serachKeyword",
        headers,
        query,
        'apiName',
        false,
        true,
        true);

    return response!.data;
  }

  Future<Response?> postQrApi(String id) async {
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;
    Map<String, String> headers = {"Authorization": "Token $token"};
    Map<String, dynamic> data = {"grns": id};
    print(data);
    Response? response = await apiCalls.postQuery(
        "${Constants.apiQrCode}", headers, data, 'postQrCode');

    return response;
  }

  Future<Response?> getQrCode(String grnId) async {
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;

    Map<String, String> headers = {"Authorization": "Token $token"};
    Map<String, dynamic> query = {};
    Response? response = await apiCalls.getQuery(
        "${Constants.apiQrCode}?grns=${grnId}",
        headers,
        query,
        'get_qr_code',
        false,
        true,
        true);
    return response;
  }

  Future<Response?> sendDocImage(
    String iD,
    List<String> imageList,
  ) async {
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;

    Map<String, String> headers = {"Authorization": "Token $token"};

    Map<String, dynamic> body = {
      "grns": iD,
      "image_files": [
        await MultipartFile.fromFile(imageList[0], filename: 'image-1'),
      ]
    };

    FormData formData = FormData.fromMap(body);

    print(body);

    Response? response = await apiCalls.postQuery(
        Constants.apiSendDocImage, headers, formData, 'sendDocImage');

    return response;
  }

  getCargoId(String grnId) async {
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;

    Map<String, String> headers = {"Authorization": "Token $token"};
    Map<String, dynamic> query = {};
    var response = await apiCalls.getQuery(
      "${Constants.apiGetCargoID}?grns=${grnId}",
      headers,
      query,
      'get_cargo_id',
      false,
      true,
      true,
    );
    log(response!.data.toString());
    return response.data;
  }

  Future<Response?> getQRresposne(String grnNumer) async {
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;

    Map<String, String> headers = {"Authorization": "Token $token"};
    Map<String, dynamic> query = {};
    Response? response = await apiCalls.getQuery(
        "${Constants.apiGetCargoID}?grns=${grnNumer}",
        headers,
        query,
        'get_qrCodeResponse',
        false,
        true,
        true);
    return response;
  }

  // Code added by Harry
  postLineItem(ItemsListModel itemList, var itemCount, var grnID) async {
    List items = await getItemsList(itemCount, itemList);
    List imgList = await generateImageList(itemCount, itemList);
    log(items.toString());
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;
    Map<String, String> headers = {"Authorization": "Token $token"};
    Map<String, dynamic> body = {
      "grns": "$grnID",
      "number_items": "$itemCount",
      "items": """{"items": $items}""",
      "image_list": "$imgList"
    };
    FormData formData = FormData.fromMap(body);
    log(body.toString());
    var response = await apiCalls.postQuery(
        Constants.apiGetCargoID, headers, formData, 'line_check');
    log(response.toString());
    return response!.data;
  }

  generateImageList(var itemCount, ItemsListModel itemsListModel) async {
    List<dynamic> imgList = [];
    for (int i = 0; i < itemCount; i++) {
      var imgFile = itemsListModel.itemModel[i].imgPath == 'imgPath'
          ? ''
          : await MultipartFile.fromFile(itemsListModel.itemModel[i].imgPath!);
      imgList.add(imgFile);
    }
    return imgList;
  }

  getItemsList(var itemCount, ItemsListModel itemListModel) async {
    log(itemListModel.itemModel[0].imgPath.toString());

    List<String> itemList = [];
    for (int i = 0; i < itemCount; i++) {
      itemList.add(
          """{"cargo": ${itemListModel.itemModel[i].id}, "item_data": "${itemListModel.itemModel[i].notes}", "uploaded_file": null, "no_descrepency": "0"}""");
    }
    return itemList;
  }

  getLineItem(var grnId) async {
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;

    Map<String, String> headers = {"Authorization": "Token $token"};
    Map<String, dynamic> query = {};
    var response = await apiCalls.getQuery(
      "${Constants.apiGetCargoID}?grns=$grnId",
      headers,
      query,
      'get_line_item',
      false,
      true,
      true,
    );
    log(response!.data.toString());
    return response.data;
  }

  postSpecUpdate(var itemCount, var grnID, SpecItemList specItemList) async {
    List items = await generateSpecList(itemCount, specItemList);
    log(items.toString());
    LoginResponse? loginResponse = await userRepo.getLoginResponse();
    token = loginResponse!.token;
    Map<String, String> headers = {"Authorization": "Token $token"};
    Map<String, dynamic> body = {
      "grns": "$grnID",
      "items": """{"items": $items}"""
    };
    FormData formData = FormData.fromMap(body);
    var response = await apiCalls.postQuery(
        Constants.specUpdate, headers, formData, 'spec_update');
    log(response.toString());
    return response!.data;
  }

  generateSpecList(var itemCoutm, SpecItemList specItemList) async {
    List<String> itemList = [];
    for (int i = 0; i < itemCoutm; i++) {
      var mFile = specItemList.specItems[i].qrImgdata == 'qrImgdata'
          ? null
          : specItemList.specItems[i].qrImgdata;
      itemList.add(
          """{"cargo_number": ${specItemList.specItems[i].cargoNumber}, "height": "${specItemList.specItems[i].height}", "weight": ${specItemList.specItems[i].weight}, "width": "${specItemList.specItems[i].width}, "length": "${specItemList.specItems[i].length}", "location_qr_code": "$mFile, "location": "${specItemList.specItems[i].location}}""");
    }
    return itemList;
  }
}
