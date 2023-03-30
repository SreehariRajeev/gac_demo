import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Repository/product_repo.dart';
import 'package:gac_demo_v1/presentation/Screen/Home%20Page/components/specs_update_page.dart';
import 'package:gac_demo_v1/presentation/Widgets/camera_tile.dart';
import 'package:gac_demo_v1/presentation/Widgets/widgets_services/cameraservice.dart';

import '../../../../Models/drop_down_model.dart';
import '../../../../Utils/constants.dart';
import '../../../../Utils/size_config.dart';

class LineItemCheck extends StatefulWidget {
  final String grnNum, poNumber, IdGrn;

  const LineItemCheck(
      {Key? key,
      required this.grnNum,
      required this.poNumber,
      required this.IdGrn})
      : super(key: key);

  @override
  State<LineItemCheck> createState() => _LineItemCheckState();
}

class _LineItemCheckState extends State<LineItemCheck> {
  String? selectedValue;
  List<CargoDatum> items = [];
  String? img1;
  late String pieceNum, consignee;
  final focusNode1 = FocusNode();
  late bool isLineChecked;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<CargoDatum>? _cargoItem;
  List<DropdownMenuItem<CargoDatum>>? _cargoDropItem;
  CargoDatum? selectedItem;
  ProdRepo prodRepo = ProdRepo();
  int? selectedCargoID;
  List<int> listSelectedIDs = [];
  DropDownResult? dropDownResult;
  List<DropdownMenuItem<Object>> dropdownItems = [];
  //ADDED BY HARRY
  List<String> imgPathList = [];
  List<String> noteList = [];
  int? itemCount;
  bool isLoading = false;
  ItemsListModel? itemsListModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLineChecked = false;
    getCargoIdApi();
  }

  @override
  Widget build(BuildContext context) {
    log("ID ${widget.IdGrn}");
    log("GRNUM ${widget.grnNum}");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 4,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
                child: Row(
                  children: [
                    Text('OMG REF : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 5)),
                    Text(widget.grnNum,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 5)),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
                child: Row(
                  children: [
                    Text('PO : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 5)),
                    Text(widget.poNumber,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 5)),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 6,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
                child: Row(
                  children: [
                    Text('Number of Items : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 5)),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 2,
                    ),
                    NumberContainer()!
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 6,
              ),
              Text('Sequence as per supplier paperwork',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeHorizontal * 5)),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 6,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemCount ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Item ${index + 1}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  elevation: 6,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      itemsListModel!.itemModel[index].notes =
                                          value;
                                    },
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        hintText: 'Notes: Discrepencies if any',
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            CameraTile(
                              imageUrl: (val) {
                                setState(() {
                                  itemsListModel!.itemModel[index].imgPath =
                                      val;
                                });
                              },
                              isDocPage: false,
                            ),
                            // IconButton(
                            //   icon: const Icon(
                            //     Icons.camera_alt,
                            //     size: 26,
                            //   ),
                            //   onPressed: () async {
                            //     setState(() {
                            //       isLoading = false;
                            //     });
                            //     // var path = await CameraServices.captureImage();
                            //     // imgPathList.add(path);
                            //     // log("index: $index, img: ${imgPathList.length}");
                            //     // if (imgPathList.length != index + 1) {
                            //     //   log('message');
                            //     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //     //       content: Text(
                            //     //           'Please add image for item ${imgPathList.length + 1}')));
                            //     // } else {
                            //     //   imgPathList[index] =
                            //     //       CameraServices.captureImage();
                            //     // }
                            //   },
                            // ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Material(
                            elevation: 6,
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            child: DropdownButtonFormField(
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                isDense: true,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              // ignore: prefer_const_literals_to_create_immutables
                              items: dropdownItems,
                              onChanged: (val) {
                                ///Temp
                                // selectedCargoID = int.parse(val.toString());
                                // listSelectedIDs.add(selectedCargoID!);
                                // log(listSelectedIDs.toString());
                                itemsListModel!.itemModel[index].id =
                                    val.toString();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              itemCount != 0
                  ? ElevatedButton(
                      onPressed: () {
                        postLineItemCheck();
                      },
                      child: isLoading
                          ? const CircularProgressIndicator.adaptive()
                          : const Text('Update Package Specs'))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  generateItemList(int count) {
    List<ItemModel> iList = [];
    for (int i = 0; i < count; i++) {
      iList.add(ItemModel(
          itemNo: 'itemNo',
          imgPath: 'imgPath',
          notes: 'notes',
          bool: 'bool',
          id: 'id'));
    }
    itemsListModel = ItemsListModel(itemModel: iList);
  }

  postLineItemCheck() async {
    setState(() {
      isLoading = true;
    });
    if (itemsListModel!.itemModel.length == itemCount) {
      try {
        var response =
            prodRepo.postLineItem(itemsListModel!, itemCount!, widget.IdGrn);
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SpecUpdatesPage(grnID: widget.IdGrn)));
      } on Exception catch (e) {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Please add image for item: ${itemCount! - imgPathList.length}')));
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget? NumberContainer() {
    return Container(
      height: SizeConfig.blockSizeHorizontal * 30,
      width: SizeConfig.blockSizeHorizontal * 30,
      decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(4, 4),
                color: Constants.primaryColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: enterPieceNum(),
    );
  }

  Widget? enterPieceNum() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 0,
        right: SizeConfig.blockSizeHorizontal * 0,
      ),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 20,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          textAlign: TextAlign.center,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          autofocus: false,
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                itemCount = 0;
                generateItemList(itemCount!);
              } else {
                itemCount = int.parse(value);
                generateItemList(itemCount!);
              }
            });
          },
          // onFieldSubmitted: (v) {
          //   pieceNum = v;
          //   FocusScope.of(context).requestFocus(focusNode1);
          // },
          validator: (val1) => val1!.isNotEmpty ? null : '',
          style: const TextStyle(color: Constants.secondaryColor, fontSize: 80),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
                top: SizeConfig.screenHeight / 50,
                left: SizeConfig.blockSizeVertical * 2),
            errorStyle: const TextStyle(color: Colors.red),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.red[400]!, width: 0),
            ),
          ),
          onSaved: (input) => pieceNum = input!.trim(),
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.disabled
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey;
    }
    return Constants.primaryColor;
  }

  Widget? lineCheck() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'No Decrepancy',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        Checkbox(
            value: isLineChecked,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            onChanged: (bool? value) {
              setState(() {
                isLineChecked = value!;
                print(value);
              });
            })
      ],
    );
  }

  getCargoIdApi() async {
    var response = await prodRepo.getCargoId(widget.IdGrn);
    // var decoded = jsonDecode(response);
    dropDownResult = DropDownResult.fromJson(response);
    for (int i = 0; i < dropDownResult!.cargoData!.length; i++) {
      var newItem = DropdownMenuItem(
        value: dropDownResult!.cargoData![i].id,
        child: Text("${dropDownResult!.cargoData![i].cargoNumber}"),
      );
      dropdownItems.add(newItem);
    }
    setState(() {});
    // items.add(mapped);
    // log("CARGO ITEMS: $items");
    // final data = jsonDecode(response.data) as List<dynamic>;
    // final newItems = data.map<String>((item) => item.toString()).toList();

    // setState(() {
    //   items = newItems;
    // });
  }

  onChangedCatItem(DropDownResult? selectedDealer) {
    setState(() {
      selectedCargoID = dropDownResult!.cargoData![0].id;
    });
  }

  dropDownElements() async {
    Response? response = await prodRepo.getCargoId(widget.IdGrn);

    var n = json.encode(response!.data);
    _cargoItem = DropDownResult.fromJson(response.data).cargoData;
    buildDropDownItems(_cargoItem!);
  }

  buildDropDownItems(List dealers) {
    _cargoDropItem!.clear();
    for (CargoDatum dealerModel in dealers) {
      _cargoDropItem!.add(
        DropdownMenuItem(
          value: dealerModel,
          child: Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 4),
            child: const Text(
              '',
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget? consigneeName() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeVertical * 3.5,
        right: SizeConfig.blockSizeVertical * 3.5,
      ),
      child: Container(
        width: SizeConfig.blockSizeVertical * 86.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          autofocus: false,
          onFieldSubmitted: (v) {
            consignee = v;
            FocusScope.of(context).requestFocus(focusNode1);
          },
          validator: (val1) => val1!.isNotEmpty ? null : 'Enter Consignee Name',
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
              hintText: 'Note discrepancies if any',
              hintStyle: const TextStyle(
                color: Constants.primaryColor,
                fontSize: 16,
              ),
              contentPadding: EdgeInsets.only(
                  top: SizeConfig.screenHeight / 50,
                  left: SizeConfig.blockSizeVertical * 2),
              errorStyle: const TextStyle(color: Colors.red),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.red[400]!, width: 0),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.red[400]!, width: 0)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0),
              ),
              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.black, width: 0))),
          onSaved: (input) => consignee = input!.trim(),
        ),
      ),
    );
  }
}

// OLD CODE_______________________________________
//   Padding(
//   padding: EdgeInsets.only(
//       left: SizeConfig.blockSizeHorizontal * 4,
//       right: SizeConfig.blockSizeHorizontal * 4),
//   child: Container(
//     // width: MediaQuery.of(context).size.width,
//     // height: SizeConfig.blockSizeHorizontal * 70,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(
//             SizeConfig.blockSizeHorizontal * 2),
//         color: Colors.grey.withOpacity(0.8)),
//     child: Column(
//       children: [
//         lineCheck()!,
//         SizedBox(
//           height: SizeConfig.blockSizeHorizontal * 4,
//         ),
//         ConsigneeName()!,
//         SizedBox(
//           height: SizeConfig.blockSizeHorizontal * 4,
//         ),
//         CameraTile(
//             isDocPage: false,
//             imageUrl: (val) {
//               print(val);
//               setState(() {
//                 img1 = val;
//               });
//             }),
//       ],
//     ),
//   ),
// )
// no of itmes - item no => img, text, bool, id
//

class ItemsListModel {
  ItemsListModel({required this.itemModel});
  List<ItemModel> itemModel = [];
}

class ItemModel {
  ItemModel(
      {required this.itemNo,
      required this.imgPath,
      required this.notes,
      required this.bool,
      required this.id});
  String? itemNo;
  String? imgPath;
  String? notes;
  String? bool;
  String? id;
}
