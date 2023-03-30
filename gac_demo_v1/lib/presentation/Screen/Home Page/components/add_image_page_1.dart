import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Repository/product_repo.dart';
import 'package:gac_demo_v1/Utils/size_config.dart';

import '../../../../Utils/constants.dart';
import '../../../Widgets/Buttons/custom_button.dart';
import '../../../Widgets/camera_tile.dart';

class AddImagePage1 extends StatefulWidget {
  final String id;
  final Function() navigator;

  const AddImagePage1({
    Key? key,
    required this.id,
    required this.navigator,
  }) : super(key: key);

  @override
  State<AddImagePage1> createState() => _AddImagePage1State();
}

class _AddImagePage1State extends State<AddImagePage1> {
  String? img1, img2, img3, img4, img5, img6, img7, img8;
  late bool isLoading;
  ProdRepo? prodRepo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
    prodRepo = ProdRepo();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 15,
            ),
            Text(
              'Use Camera',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            SizedBox(height: SizeConfig.blockSizeHorizontal * 15),
            Row(
              children: [
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 2,
                ),
                CameraTile(
                    isDocPage: false,
                    imageUrl: (val) {
                      print(val);
                      setState(() {
                        img1 = val;
                      });
                    }),
                CameraTile(
                    isDocPage: false,
                    imageUrl: (val) {
                      print(val);
                      setState(() {
                        img2 = val;
                      });
                    }),
                CameraTile(
                    isDocPage: false,
                    imageUrl: (val) {
                      print(val);
                      setState(() {
                        img3 = val;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 2,
                ),
                CameraTile(
                    isDocPage: false,
                    imageUrl: (val) {
                      print(val);
                      setState(() {
                        img4 = val;
                      });
                    }),
                CameraTile(
                    isDocPage: false,
                    imageUrl: (val) {
                      print(val);
                      setState(() {
                        img5 = val;
                      });
                    }),
                CameraTile(
                    isDocPage: false,
                    imageUrl: (val) {
                      print(val);
                      setState(() {
                        img6 = val;
                      });
                    }),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 20,
            ),
            addImageApi()!,
          ],
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
            imageSendApi();
          }),
    );
  }

  imageSendApi() async {
    try {
      setState(() {
        isLoading = true;
      });
      Response? response = await prodRepo!.sendExternalImage(widget.id, [
        img1 ?? "null",
        img2 ?? "null",
        img3 ?? "null",
        img4 ?? "null",
        img5 ?? "null",
        img6 ?? "null",
      ]);
      print("${widget.id} id is =====================");
      print(response!.data);
      print(response.statusMessage);
      if (response.statusMessage == 'OK') {
        widget.navigator();
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }
}
