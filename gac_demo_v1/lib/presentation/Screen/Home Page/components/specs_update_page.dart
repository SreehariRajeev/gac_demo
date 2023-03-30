import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Models/line_check_model/line_check_model.dart';

import '../../../../Models/line_check_payloadModel.dart';
import '../../../../Repository/product_repo.dart';

class SpecUpdatesPage extends StatefulWidget {
  SpecUpdatesPage({Key? key, required this.grnID}) : super(key: key);
  final String grnID;
  @override
  State<SpecUpdatesPage> createState() => _SpecUpdatesPageState();
}

class _SpecUpdatesPageState extends State<SpecUpdatesPage> {
  int package = 1;
  String cargoref = "PRE-12000001-001";
  bool isDoubleChecked = false;
  LineCheckModel? lineCheckPayloadModel;
  //TODO: TEMP DATA
  var data;
  ProdRepo prodRepo = ProdRepo();
  bool isLoading = false;
  @override
  void initState() {
    isLoading = true;
    getDataForPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data["cargo_data"].length,
                        itemBuilder: (context, index) {
                          package = index + 1;
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Package: ${package}',
                                  style: tstyle,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'CARGO REF: ${data["cargo_data"][index]["cargo_number"]}',
                                  style: tstyle,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Material(
                                          elevation: 6,
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              specItemList!.specItems[index]
                                                  .length = val;
                                            },
                                            decoration: const InputDecoration(
                                              hintText: 'LENGTH',
                                              hintStyle:
                                                  TextStyle(fontSize: 12),
                                              suffixText: 'CMS',
                                              contentPadding: EdgeInsets.all(4),
                                              suffixStyle:
                                                  TextStyle(fontSize: 12),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Material(
                                          elevation: 6,
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              specItemList!
                                                  .specItems[index].width = val;
                                            },
                                            decoration: const InputDecoration(
                                              hintText: 'WIDTH',
                                              hintStyle:
                                                  TextStyle(fontSize: 12),
                                              suffixText: 'CMS',
                                              contentPadding: EdgeInsets.all(4),
                                              suffixStyle:
                                                  TextStyle(fontSize: 12),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Material(
                                          elevation: 6,
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              specItemList!.specItems[index]
                                                  .height = val;
                                            },
                                            decoration: const InputDecoration(
                                              hintText: 'HEIGHT',
                                              hintStyle:
                                                  TextStyle(fontSize: 12),
                                              suffixText: 'CMS',
                                              contentPadding: EdgeInsets.all(4),
                                              suffixStyle:
                                                  TextStyle(fontSize: 12),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Material(
                                          elevation: 6,
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              specItemList!.specItems[index]
                                                  .weight = val;
                                            },
                                            decoration: const InputDecoration(
                                              hintText: 'WEIGHT',
                                              hintStyle:
                                                  TextStyle(fontSize: 12),
                                              suffixText: 'KG',
                                              contentPadding: EdgeInsets.all(4),
                                              suffixStyle:
                                                  TextStyle(fontSize: 12),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Material(
                                          elevation: 6,
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              specItemList!.specItems[index]
                                                  .location = val;
                                            },
                                            decoration: const InputDecoration(
                                              hintText: 'Storage Location',
                                              hintStyle:
                                                  TextStyle(fontSize: 12),
                                              contentPadding: EdgeInsets.all(4),
                                              suffixStyle:
                                                  TextStyle(fontSize: 12),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //TODO: REMOVE TEMP FN
                                        specItemList!.specItems[index]
                                            .qrImgdata = 'null';
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(Icons.camera_alt_outlined),
                                          Text('SCAN QR CODE'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  'ALL DETAILS DOUBLE CHECKED AND VERIFIED',
                                  style: tstyle,
                                  textAlign: TextAlign.center,
                                ),
                                Center(
                                    child: Checkbox(
                                  value: isDoubleChecked,
                                  onChanged: (val) {
                                    setState(() {
                                      isDoubleChecked = val!;
                                    });
                                  },
                                )),
                              ],
                            ),
                          );
                        }),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            updateSpecs();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isDoubleChecked ? Colors.black : Colors.grey),
                          child: const Text('TRANSFER TO DM TEAM'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  updateSpecs() async {
    var response = await prodRepo.postSpecUpdate(
        data["cargo_data"].length, widget.grnID, specItemList!);
    log(response);
  }

  getDataForPage() async {
    var response = await prodRepo.getLineItem(widget.grnID);
    log(response["cargo_data"].length.toString());
    data = response;
    specModelGenerator(response["cargo_data"].length);
    // lineCheckPayloadModel = LineCheckModel.fromJson(response);
    // log(lineCheckPayloadModel!.cargoData.length.toString());
    setState(() {
      isLoading = false;
    });
  }

  SpecItemList? specItemList;

  specModelGenerator(var count) {
    List<SpecItem> sList = [];
    for (int i = 0; i < count; i++) {
      sList.add(SpecItem(
          cargoNumber: 'cargoNumber',
          height: 'height',
          location: 'location',
          length: 'length',
          qrImgdata: 'qrImgdata',
          weight: 'weight',
          width: 'width'));
    }
    specItemList = SpecItemList(specItems: sList);
  }

  TextStyle tstyle = const TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
}

class SpecItemList {
  SpecItemList({required this.specItems});
  List<SpecItem> specItems = [];
}

class SpecItem {
  SpecItem(
      {required this.cargoNumber,
      required this.height,
      required this.location,
      required this.length,
      required this.qrImgdata,
      required this.weight,
      required this.width});
  String cargoNumber;
  String height;
  String weight;
  String width;
  String length;
  String location;
  String qrImgdata;
}
