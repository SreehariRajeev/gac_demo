import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gac_demo_v1/Utils/constants.dart';
import 'package:gac_demo_v1/Utils/size_config.dart';

import '../../../../Models/extranal_image_model.dart';
import '../../../../Models/qr_code_model.dart';
import '../../../../Models/receipt_summary.dart';
import '../../../../Repository/product_repo.dart';
import '../../../Widgets/Buttons/custom_button.dart';
import '../../../Widgets/Dialogs/info_dialog.dart';

class ReceiptSummaryPage extends StatefulWidget {
  final String iD;
  final Function() navigator;

  const ReceiptSummaryPage(
      {Key? key, required this.iD, required this.navigator})
      : super(key: key);

  @override
  State<ReceiptSummaryPage> createState() => _ReceiptSummaryPageState();
}

class _ReceiptSummaryPageState extends State<ReceiptSummaryPage> {
  late bool isLoading;
  ProdRepo? prodRepo;
  ReceiptSummary? receiptSummary;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    prodRepo = ProdRepo();
    receiptSummary = ReceiptSummary();
    receiptSummaryApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading != true
            ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 10,
                    ),
                    textRow('NUMBER OF PACKAGES',
                        receiptSummary!.grnsData!.pieces.toString()),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    textRow('CUSTOMER', receiptSummary!.grnsData!.customer!),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    textRow('SUPPLIER', receiptSummary!.grnsData!.supplier!),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    textRow('PO Number', receiptSummary!.grnsData!.poNumber!),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    textRow('CONSIGNEE', receiptSummary!.grnsData!.consignee!),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    textRow(
                        'DATE OF RECEIPT', receiptSummary!.grnsData!.created!),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    textRow('TIME OF RECEIPT',
                        receiptSummary!.grnsData!.createdTime!),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    textRow(
                        'PRELABEL USER', receiptSummary!.grnsData!.consignee!),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    textRow(
                        'DAMAGES',
                        receiptSummary!.grnsData!.noDamage == true
                            ? 'NOTHING VISIBLE'
                            : 'VISIBLE'),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    SizedBox(
                        child:
                            textRow('PICTURES', 'FRESHLY TAKEN AND\n ASSIGNED')),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 12,
                    ),
                    newReceiptApiButton()!
                  ],
                ),
            )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please wait a moment',
                    style:
                        TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
                  ),
                  SpinKitThreeBounce(
                    color: Constants.primaryColor,
                  ),
                ],
              )),
      ),
    );
  }

  Widget textRow(String heading, String response) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 4,
          right: SizeConfig.blockSizeHorizontal * 4),
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.blockSizeHorizontal * 4),
          ),
          Text(
            ' : ',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.blockSizeHorizontal * 4),
          ),
          Text(
            response,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.blockSizeHorizontal * 4),
          ),
        ],
      ),
    );
  }

  Widget? newReceiptApiButton() {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 7,
          right: SizeConfig.blockSizeHorizontal * 7),
      child: CustomButton(
          textSize: 18,
          isLoading: false,
          height: SizeConfig.blockSizeHorizontal * 15,
          width: MediaQuery.of(context).size.width,
          backgroundColor: Constants.primaryColor,
          borderColor: Constants.primaryColor,
          title: 'Generate Qr Code',
          titleColor: Constants.secondaryColor,
          onPressed: () {
            postQrCodeApi();
          }),
    );
  }

  postQrCodeApi() async {
    setState(() {
      isLoading = true;
    });

    Response? response = await prodRepo!.postQrApi(widget.iD);
    QrCodeModel? qrCodeModel = QrCodeModel.fromJson(response!.data);
    print(qrCodeModel.status);
    if (qrCodeModel.status == true ||
        qrCodeModel.status == false ||
        qrCodeModel.reason == 'QR already generated') {
      widget.navigator();
    }
    setState(() {
      isLoading = false;
    });
  }

  receiptSummaryApi() async {
    setState(() {
      isLoading = true;
    });
    print('calling fn');
    Response? response = await prodRepo!.getReceiptSummary(widget.iD);
    receiptSummary = ReceiptSummary.fromJson(response!.data);
    print(receiptSummary!.status);
    if (receiptSummary!.status == true) {
      print(response.data);
    } else if (receiptSummary!.status == false) {
      showDialog(
          context: context,
          builder: (_) {
            return InfoDialog(
              message: 'Wrong Credentials!',
              subtext: response.data['error_description'],
              ok: () {
                Navigator.pop(context, true);
                return true;
              },
              isLoading: isLoading,
            );
          });
    } else {
      print(response.data);
      showDialog(
          context: context,
          builder: (_) {
            return InfoDialog(
              message: 'Authentication failed!',
              subtext: 'Please try again',
              ok: () {
                Navigator.pop(context, true);
                return true;
              },
            );
          });
    }
    setState(() {
      isLoading = false;
    });
  }
}
