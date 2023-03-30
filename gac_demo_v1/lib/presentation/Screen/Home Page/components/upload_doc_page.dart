import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Models/upload_doc_model.dart';
import 'package:gac_demo_v1/Repository/product_repo.dart';

import '../../../../Models/get_qr_code_model.dart';
import '../../../../Utils/constants.dart';
import '../../../../Utils/size_config.dart';
import '../../../Widgets/Buttons/custom_button.dart';
import '../../../Widgets/camera_tile.dart';

class UploadDocumentPage extends StatefulWidget {
  final String grnNumber, idGrn;
  final Function() navigator;

  const UploadDocumentPage(
      {Key? key,
      required this.grnNumber,
      required this.idGrn,
      required this.navigator})
      : super(key: key);

  @override
  State<UploadDocumentPage> createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  String? img1;
  ProdRepo? prodRepo;
  late bool isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
    print(widget.grnNumber);
    prodRepo = ProdRepo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('OMG REF : ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 5)),
                  Text(widget.grnNumber,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 5)),
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeHorizontal * 4),
              const Text(
                'Use Camera',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              SizedBox(height: SizeConfig.blockSizeHorizontal * 4),
              CameraTile(
                  isDocPage: true,
                  imageUrl: (val) {
                    print(val);
                    setState(() {
                      img1 = val;
                    });
                  }),
              SizedBox(height: SizeConfig.blockSizeHorizontal * 9),
              addImageApi()!,
            ],
          ),
        ),
      ),
    );
  }

  Widget? addImageApi() {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 7,
          right: SizeConfig.blockSizeHorizontal * 7),
      child: CustomButton(
          textSize: 18,
          isLoading: isLoading,
          height: SizeConfig.blockSizeHorizontal * 15,
          width: MediaQuery.of(context).size.width,
          backgroundColor: Constants.primaryColor,
          borderColor: Constants.primaryColor,
          title: 'Submit',
          titleColor: Constants.secondaryColor,
          onPressed: () {
            uploadImageApi();
          }),
    );
  }

  uploadImageApi() async {
    setState(() {
      isLoading = true;
    });
    Response? response = await prodRepo!.sendDocImage(widget.idGrn, [img1!]);
    print(response!.statusMessage!);
    if (response.statusMessage == 'OK') {
      UploadDocModel uploadDocModel = UploadDocModel.fromJson(response.data);
      if (uploadDocModel.status == true) {
        widget.navigator();
      }
    }
    setState(() {
      isLoading = false;
    });
  }
}
