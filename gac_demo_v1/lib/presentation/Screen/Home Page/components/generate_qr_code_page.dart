import 'package:barcode/barcode.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gac_demo_v1/Models/get_qr_code_model.dart';

import '../../../../Repository/product_repo.dart';
import '../../../../Utils/constants.dart';
import '../../../../Utils/size_config.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class GenerateQrCodePage extends StatefulWidget {
  final String id;
  final Function(String grnNumber, String poNumber) goToNextPage;

  const GenerateQrCodePage(
      {Key? key, required this.id, required this.goToNextPage})
      : super(key: key);

  @override
  State<GenerateQrCodePage> createState() => _GenerateQrCodePageState();
}

class _GenerateQrCodePageState extends State<GenerateQrCodePage> {
  late bool isLoading;
  ProdRepo? prodRepo;
  GetQrCodeModel? getQrCodeModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
    prodRepo = ProdRepo();
    getQrCodeModel = GetQrCodeModel();
    getQrCodeApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (!isLoading)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('OMG REF : ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeHorizontal * 5)),
                        Text(getQrCodeModel!.grnsQrCode!.grnsNumber!,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeHorizontal * 5)),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 50,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      getQrCodeModel!.cargoQrCode!.length,
                                  itemBuilder: (context, index) {
                                    return qrCodeWidget(
                                        getQrCodeModel!
                                            .cargoQrCode![index].grns!.qrCode!,
                                        getQrCodeModel!.cargoQrCode![index]
                                            .grns!.grnsNumber!);
                                  })),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    printButtonWidget('Print Cargo Qr Code'),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    getQrCodeModel!.grnsQrCode!.qrCode != null
                        ? Text(
                            'Document QR code',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 6,
                                fontWeight: FontWeight.w600),
                          )
                        : Text(''),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 6,
                    ),
                    getQrCodeModel!.grnsQrCode!.qrCode != null
                        ? Container(
                            height: SizeConfig.blockSizeHorizontal * 30,
                            width: SizeConfig.blockSizeHorizontal * 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        getQrCodeModel!.grnsQrCode!.qrCode!),
                                    fit: BoxFit.fill)),
                          )
                        : Container(
                            color: Colors.grey.shade500,
                            height: SizeConfig.blockSizeHorizontal * 30,
                            width: SizeConfig.blockSizeHorizontal * 30,
                          ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    printButtonWidget('Print Document Qr Code'),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 4,
                          right: SizeConfig.blockSizeHorizontal * 4),
                      child: InkWell(
                        onTap: () {
                          print(getQrCodeModel!.grnsQrCode!.grnsNumber!);
                          widget.goToNextPage(
                              getQrCodeModel!.grnsQrCode!.grnsNumber!,
                              getQrCodeModel!.grnsQrCode!.poNumber!);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: SizeConfig.blockSizeHorizontal * 15,
                          decoration: BoxDecoration(
                              color: Constants.primaryColor,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeHorizontal * 2)),
                          child: Center(
                            child: Text(
                              'Go to next page',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal * 4,
                    ),
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

  Widget qrCodeWidget(String qrCode, String id) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.blockSizeHorizontal * 3,
              bottom: SizeConfig.blockSizeHorizontal * 3),
          child: Container(
            height: SizeConfig.blockSizeHorizontal * 35,
            width: SizeConfig.blockSizeHorizontal * 35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(qrCode), fit: BoxFit.fill)),
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal * 2,
        ),
        Text(
          id,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: SizeConfig.blockSizeHorizontal * 4),
        )
      ],
    );
  }

  Widget printButtonWidget(String name) {
    return InkWell(
      onTap: () {
        _createPdf();
      },
      child: Container(
        height: SizeConfig.blockSizeHorizontal * 15,
        width: SizeConfig.blockSizeHorizontal * 30,
        decoration: BoxDecoration(color: Constants.primaryColor),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.blockSizeHorizontal * 4),
          ),
        ),
      ),
    );
  }

  getQrCodeApi() async {
    setState(() {
      isLoading = true;
    });

    Response? response1 = await prodRepo!.getQrCode(widget.id);
    getQrCodeModel = GetQrCodeModel.fromJson(response1!.data);
    print(getQrCodeModel!.cargoQrCode!.length);
    print(getQrCodeModel!.grnsQrCode!.id);
    setState(() {
      isLoading = false;
    });
  }

  /// create PDF & print it
  void _createPdf() async {
    final doc = pw.Document();
    // MemoryImage images = [];

    /// for using an image from assets
    // final image = await imageFromAssetBundle('assets/image.png');

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a6,
        build: (pw.Context context1) {
          return pw.Center(
              child: pw.ListView.builder(
                  itemCount: getQrCodeModel!.cargoQrCode!.length,
                  itemBuilder: (context1, index) {
                    return pw.Container(
                        /*height: SizeConfig.blockSizeHorizontal * 30,
                        width: SizeConfig.blockSizeHorizontal * 30,
                        child: pw.Image()*/
                        );
                  })); // Center
        },
      ),
    ); // Page

    /// print the document using the iOS or Android print service:
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());

    /// share the document to other applications:
    // await Printing.sharePdf(bytes: await doc.save(), filename: 'my-document.pdf');

    /// tutorial for using path_provider: https://www.youtube.com/watch?v=fJtFDrjEvE8
    /// save PDF with Flutter library "path_provider":
    // final output = await getTemporaryDirectory();
    // final file = File('${output.path}/example.pdf');
    // await file.writeAsBytes(await doc.save());
  }

  pw.Widget _buildQrCodeWithLabel(String label, String qrCodeData) {
    // Generate the QR code image
    final qrCode = Barcode.qrCode();
    return pw.Container();
  }
}
