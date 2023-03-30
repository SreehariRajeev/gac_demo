import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../Models/qr_code_reposne.dart';
import '../../Repository/product_repo.dart';

class QRCodeResponsePage extends StatefulWidget {
  final String grnNumber;

  const QRCodeResponsePage({Key? key, required this.grnNumber})
      : super(key: key);

  @override
  State<QRCodeResponsePage> createState() => _QRCodeResponsePageState();
}

class _QRCodeResponsePageState extends State<QRCodeResponsePage> {
  ProdRepo? prodRepo;
  GetQrResponse? qrResponse;
  late bool? isLoading;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prodRepo = ProdRepo();
    qrResponse = GetQrResponse();
    isLoading = false;
    getQrCodeResponseApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  getQrCodeResponseApi() async {
    setState(() {
      isLoading = true;
    });
    Response? response = await prodRepo!.getQRresposne(widget.grnNumber);
    qrResponse = GetQrResponse.fromJson(response!.data);

    setState(() {
      isLoading = false;
    });
  }
}
