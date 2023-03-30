import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Utils/constants.dart';
import 'package:gac_demo_v1/Utils/size_config.dart';
import 'package:gac_demo_v1/presentation/Screen/Home%20Page/components/line_item_check_page.dart';
import 'package:gac_demo_v1/presentation/Screen/Home%20Page/components/new_receipt_page.dart';
import 'package:gac_demo_v1/presentation/Screen/Home%20Page/components/specs_update_page.dart';

import '../../../Repository/product_repo.dart';
import '../../Widgets/Dialogs/info_dialog.dart';
import 'components/add_image_page_1.dart';
import 'components/generate_qr_code_page.dart';
import 'components/receipt_summary_page.dart';
import 'components/tab_design.dart';
import 'components/upload_doc_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.currentTab}) : super(key: key);
  int? currentTab;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext? myContext;

  String? idGrn, statusCode1, grnNumberPage, poNumber;
  TextEditingController? textEditingController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late bool isLoading;
  ProdRepo? prodRepo;
  PageController? _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idGrn = '';
    grnNumberPage = '';
    poNumber = '';
    statusCode1 = '';
    widget.currentTab ??= 0;
    textEditingController = TextEditingController();

    isLoading = false;
    prodRepo = ProdRepo();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    myContext = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const Center(
            child: Text(
          'New GRN',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
        )),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [tabBar(), pageView2()],
            ),
          ],
        ),
      ),
    );
  }

  Widget pageView2() {
    return Expanded(
        child: widget.currentTab == 0
            ? NewReceiptPage(
                mycontext: myContext!,
                navigator: (id) {
                  _pageController!.animateToPage(1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                  setState(() {
                    idGrn = id;
                  });
                },
              )
            : widget.currentTab == 1
                ? AddImagePage1(
                    navigator: () {
                      _pageController!.animateToPage(2,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    id: idGrn!,
                  )
                : widget.currentTab == 2
                    ? ReceiptSummaryPage(
                        navigator: () {
                          _pageController!.animateToPage(3,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        iD: idGrn!,
                      )
                    : widget.currentTab == 3
                        ? GenerateQrCodePage(
                            id: idGrn!,
                            goToNextPage: (grnNumber, poNo) {
                              setState(() {
                                grnNumberPage = grnNumber;
                                poNumber = poNo;
                                print(poNumber);
                              });
                              _pageController!.animateToPage(4,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                          )
                        : widget.currentTab == 4
                            ? UploadDocumentPage(
                                idGrn: idGrn!,
                                grnNumber: grnNumberPage!,
                                navigator: () {
                                  _pageController!.animateToPage(5,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                              )
                            : widget.currentTab == 5
                                ? LineItemCheck(
                                    IdGrn: idGrn!,
                                    poNumber: poNumber!,
                                    grnNum: grnNumberPage!,
                                  )
                                : widget.currentTab == 6
                                    ? SpecUpdatesPage(grnID: idGrn!)
                                    : Container());
  }

  Widget pageView() {
    return Expanded(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            widget.currentTab = index;
          });
          print(index);
        },
        controller: _pageController,
        children: [
          NewReceiptPage(
            mycontext: myContext!,
            navigator: (id) {
              _pageController!.animateToPage(1,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
              setState(() {
                idGrn = id;
              });
            },
          ),
          AddImagePage1(
            navigator: () {
              _pageController!.animateToPage(2,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            id: idGrn!,
          ),
          ReceiptSummaryPage(
            navigator: () {
              _pageController!.animateToPage(3,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
            iD: idGrn!,
          ),
          GenerateQrCodePage(
            id: idGrn!,
            goToNextPage: (grnNumber, poNo) {
              setState(() {
                grnNumberPage = grnNumber;
                poNumber = poNo;
                print(poNumber);
              });
              _pageController!.animateToPage(4,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
          ),
          UploadDocumentPage(
            idGrn: idGrn!,
            grnNumber: grnNumberPage!,
            navigator: () {
              _pageController!.animateToPage(5,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
          ),
          LineItemCheck(
            IdGrn: idGrn!,
            poNumber: poNumber!,
            grnNum: grnNumberPage!,
          ),
          SpecUpdatesPage(grnID: idGrn!)
        ],
      ),
    );
  }

  List<Widget> pages = [];

  Widget tabBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(3, 4),
            blurRadius: 12,
          )
        ]),
        child: Row(
          children: <Widget>[
            TabDesign(
              title: 'New Receipt',
              currentTab: widget.currentTab,
              tabNo: 0,
              color1: (widget.currentTab == 0)
                  ? Colors.white
                  : Constants.primaryColor,
              color2: (widget.currentTab == 0)
                  ? Constants.primaryColor
                  : Colors.white,
              onPressed: () {
                if (widget.currentTab != 0) {
                  widget.currentTab = 0;
                  textEditingController!.text = '';
                  setState(() {});
                  // _pageController!.animateToPage(widget.currentTab!,
                  //     duration: const Duration(milliseconds: 5),
                  //     curve: Curves.decelerate);
                }
              },
              borderRadiusGeometry: (widget.currentTab == 0)
                  ? const BorderRadius.only(topRight: Radius.circular(10))
                  : (widget.currentTab == 1)
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(0),
            ),
            TabDesign(
              title: 'External Image',
              currentTab: widget.currentTab,
              tabNo: 1,
              color1: (widget.currentTab == 1)
                  ? Colors.white
                  : Constants.primaryColor,
              color2: (widget.currentTab == 1)
                  ? Constants.primaryColor
                  : Colors.white,
              onPressed: () {
                if (widget.currentTab != 0) {
                  widget.currentTab = 1;

                  textEditingController!.text = '';
                  setState(() {});

                  // _pageController!.animateToPage(widget.currentTab!,
                  //     duration: const Duration(milliseconds: 5),
                  //     curve: Curves.decelerate);
                }
              },
              borderRadiusGeometry: (widget.currentTab == 1)
                  ? const BorderRadius.only(topRight: Radius.circular(10))
                  : (widget.currentTab == 2)
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(0),
            ),
            TabDesign(
              title: 'Receipt Summary',
              currentTab: widget.currentTab,
              tabNo: 2,
              color1: (widget.currentTab == 2)
                  ? Colors.white
                  : Constants.primaryColor,
              color2: (widget.currentTab == 2)
                  ? Constants.primaryColor
                  : Colors.white,
              onPressed: () {
                if (widget.currentTab != 2) {
                  widget.currentTab = 2;

                  textEditingController!.text = '';
                  setState(() {});
                  // _pageController!.animateToPage(widget.currentTab!,
                  //     duration: const Duration(milliseconds: 5),
                  //     curve: Curves.decelerate);
                }
              },
              borderRadiusGeometry: (widget.currentTab == 2)
                  ? const BorderRadius.only(topRight: Radius.circular(10))
                  : (widget.currentTab == 2)
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(0),
            ),
            TabDesign(
              title: 'Generate Qr Code',
              currentTab: widget.currentTab,
              tabNo: 3,
              color1: (widget.currentTab == 3)
                  ? Colors.white
                  : Constants.primaryColor,
              color2: (widget.currentTab == 3)
                  ? Constants.primaryColor
                  : Colors.white,
              onPressed: () {
                if (widget.currentTab != 3) {
                  widget.currentTab = 3;

                  textEditingController!.text = '';
                  _pageController!.animateToPage(widget.currentTab!,
                      duration: const Duration(milliseconds: 5),
                      curve: Curves.decelerate);
                }
              },
              borderRadiusGeometry: (widget.currentTab == 3)
                  ? const BorderRadius.only(topRight: Radius.circular(10))
                  : (widget.currentTab == 3)
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(0),
            ),
            TabDesign(
              title: 'Upload Documents',
              currentTab: widget.currentTab,
              tabNo: 4,
              color1: (widget.currentTab == 4)
                  ? Colors.white
                  : Constants.primaryColor,
              color2: (widget.currentTab == 4)
                  ? Constants.primaryColor
                  : Colors.white,
              onPressed: () {
                if (widget.currentTab != 4) {
                  widget.currentTab = 4;

                  textEditingController!.text = '';
                  _pageController!.animateToPage(widget.currentTab!,
                      duration: const Duration(milliseconds: 5),
                      curve: Curves.decelerate);
                }
              },
              borderRadiusGeometry: (widget.currentTab == 4)
                  ? const BorderRadius.only(topRight: Radius.circular(10))
                  : (widget.currentTab == 4)
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(0),
            ),
            TabDesign(
              title: 'Line Check Item',
              currentTab: widget.currentTab,
              tabNo: 5,
              color1: (widget.currentTab == 5)
                  ? Colors.white
                  : Constants.primaryColor,
              color2: (widget.currentTab == 5)
                  ? Constants.primaryColor
                  : Colors.white,
              onPressed: () {
                if (widget.currentTab != 5) {
                  widget.currentTab = 5;

                  textEditingController!.text = '';
                  _pageController!.animateToPage(widget.currentTab!,
                      duration: const Duration(milliseconds: 5),
                      curve: Curves.decelerate);
                }
              },
              borderRadiusGeometry: (widget.currentTab == 5)
                  ? const BorderRadius.only(topRight: Radius.circular(10))
                  : (widget.currentTab == 5)
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(0),
            ),
            TabDesign(
              title: 'Specs Update',
              currentTab: widget.currentTab,
              tabNo: 6,
              color1: (widget.currentTab == 6)
                  ? Colors.white
                  : Constants.primaryColor,
              color2: (widget.currentTab == 6)
                  ? Constants.primaryColor
                  : Colors.white,
              onPressed: () {
                if (widget.currentTab != 6) {
                  widget.currentTab = 6;

                  textEditingController!.text = '';
                  _pageController!.animateToPage(widget.currentTab!,
                      duration: const Duration(milliseconds: 5),
                      curve: Curves.decelerate);
                }
              },
              borderRadiusGeometry: (widget.currentTab == 6)
                  ? const BorderRadius.only(topRight: Radius.circular(10))
                  : (widget.currentTab == 6)
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(0),
            ),
            TabDesign(
              title: 'Final Report',
              currentTab: widget.currentTab,
              tabNo: 7,
              color1: (widget.currentTab == 7)
                  ? Colors.white
                  : Constants.primaryColor,
              color2: (widget.currentTab == 7)
                  ? Constants.primaryColor
                  : Colors.white,
              onPressed: () {
                if (widget.currentTab != 7) {
                  widget.currentTab = 7;

                  textEditingController!.text = '';
                  _pageController!.animateToPage(widget.currentTab!,
                      duration: const Duration(milliseconds: 5),
                      curve: Curves.decelerate);
                }
              },
              borderRadiusGeometry: (widget.currentTab == 7)
                  ? const BorderRadius.only(topRight: Radius.circular(10))
                  : (widget.currentTab == 7)
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(0),
            ),
          ],
        ),
      ),
    );
  }
}
