import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Repository/product_repo.dart';
import 'package:gac_demo_v1/Utils/constants.dart';
import 'package:gac_demo_v1/Utils/size_config.dart';
import 'package:gac_demo_v1/presentation/Screen/Home%20Page/home_screen.dart';
import 'package:gac_demo_v1/presentation/Widgets/Buttons/custom_button.dart';

import '../../../../Models/login_model.dart';
import '../../../../Models/new_receipt_model.dart';
import '../../../Widgets/Dialogs/info_dialog.dart';

class NewReceiptPage extends StatefulWidget {
  final BuildContext mycontext;
  final Function(String idGrn) navigator;

  const NewReceiptPage(
      {Key? key, required this.navigator, required this.mycontext})
      : super(key: key);

  @override
  State<NewReceiptPage> createState() => _NewReceiptPageState();
}

class _NewReceiptPageState extends State<NewReceiptPage> {
  late String pieceNum, customerName, pONumber, supplier, consignee;
  final focusNode1 = FocusNode();
  late bool isDamageChecked, isLineChecked, isLoading;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProdRepo? prodRepo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDamageChecked = false;
    isLineChecked = false;
    isLoading = false;
    prodRepo = ProdRepo();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 6,
            ),
            const Text(
              'NUMBER OF PIECES RECEIVED',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 5,
            ),
            NumberContainer()!,
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 2,
            ),
            cargoDamageCheck()!,
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 2,
            ),
            enterCustomerName()!,
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 2,
            ),
            lineCheck()!,
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 2,
            ),
            enterPONumber()!,
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 8,
            ),
            supplierName()!,
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 8,
            ),
            ConsigneeName()!,
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 8,
            ),
            newReceiptApi()!,
            SizedBox(
              height: SizeConfig.blockSizeHorizontal * 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget? NumberContainer() {
    return Container(
      height: SizeConfig.blockSizeHorizontal * 40,
      width: SizeConfig.blockSizeHorizontal * 40,
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
        width: SizeConfig.blockSizeHorizontal * 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          textAlign: TextAlign.center,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          autofocus: false,
          onFieldSubmitted: (v) {
            pieceNum = v;
            FocusScope.of(context).requestFocus(focusNode1);
          },
          validator: (val1) => val1!.isNotEmpty ? null : '',
          style:
              const TextStyle(color: Constants.secondaryColor, fontSize: 100),
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

  Widget? cargoDamageCheck() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'NO VISIBLE CARGO DAMAGE ',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        Checkbox(
            value: isDamageChecked,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            onChanged: (bool? value) {
              setState(() {
                isDamageChecked = value!;
                print(value);
              });
            })
      ],
    );
  }

  Widget? enterCustomerName() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeVertical * 3.5,
        right: SizeConfig.blockSizeVertical * 3.5,
      ),
      child: Container(
        width: SizeConfig.blockSizeVertical * 86.6,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          autofocus: false,
          onFieldSubmitted: (v) {
            customerName = v;
            FocusScope.of(context).requestFocus(focusNode1);
          },
          validator: (val1) => val1!.isNotEmpty ? null : 'Enter Customer Name',
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
              hintText: 'Customer Name',
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
          onSaved: (input) => customerName = input!.trim(),
        ),
      ),
    );
  }

  Widget? lineCheck() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Line Check Required',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
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

  Widget? enterPONumber() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeVertical * 3.5,
        right: SizeConfig.blockSizeVertical * 3.5,
      ),
      child: Container(
        width: SizeConfig.blockSizeVertical * 86.6,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          autofocus: false,
          onFieldSubmitted: (v) {
            pONumber = v;
            FocusScope.of(context).requestFocus(focusNode1);
          },
          validator: (val1) => val1!.isNotEmpty ? null : 'Enter PO Number',
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
              hintText: 'PO Number',
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
          onSaved: (input) => pONumber = input!.trim(),
        ),
      ),
    );
  }

  Widget? supplierName() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeVertical * 3.5,
        right: SizeConfig.blockSizeVertical * 3.5,
      ),
      child: Container(
        width: SizeConfig.blockSizeVertical * 86.6,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          autofocus: false,
          onFieldSubmitted: (v) {
            supplier = v;
            FocusScope.of(context).requestFocus(focusNode1);
          },
          validator: (val1) => val1!.isNotEmpty ? null : 'Enter Supplier Name',
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
              hintText: 'Supplier',
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
          onSaved: (input) => supplier = input!.trim(),
        ),
      ),
    );
  }

  Widget? ConsigneeName() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeVertical * 3.5,
        right: SizeConfig.blockSizeVertical * 3.5,
      ),
      child: Container(
        width: SizeConfig.blockSizeVertical * 86.6,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
              hintText: 'Consignee',
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

  Widget? newReceiptApi() {
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
            newRecptApi();
          }),
    );
  }

  newRecptApi() async {
    setState(() {
      isLoading = true;
    });
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      FocusScope.of(context).requestFocus(FocusNode());

      Response? response = await prodRepo!.createNewReceipt(
          customerName,
          pieceNum,
          supplier,
          pONumber,
          consignee,
          isDamageChecked,
          isLineChecked);
      print(response!.statusCode);
      print(response.statusMessage);

      NewReceiptResponse? _newReptRes;
      _newReptRes = NewReceiptResponse.fromJson(response.data);
      widget.navigator(_newReptRes.data!.id.toString());

      if (_newReptRes.status!) {
        print(response.data);
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}
