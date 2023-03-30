import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Utils/constants.dart';

import '../../../Models/login_model.dart';
import '../../../Repository/user_repo.dart';
import '../../../Utils/size_config.dart';
import '../../Widgets/Buttons/auth_button.dart';
import '../../Widgets/Dialogs/info_dialog.dart';
import '../Landing page/landing_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String username, password;
  final focusNode1 = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late bool toggle, isLoading;
  UserRepo userRepo = UserRepo();
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toggle = false;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 40,
              ),
              const Center(
                child: Text(
                  'GAC',
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 25,
              ),
              enterUsername2(),
              // enterUsername()!,
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 6,
              ),
              enterPassword2(),
              // enterPassword()!,
              loginButton()!
            ],
          ),
        ),
      ),
    );
  }

  Widget enterUsername2() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeVertical * 3.5,
        right: SizeConfig.blockSizeVertical * 3.5,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 6,
        child: TextFormField(
          controller: userNameCtrl,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          validator: (val) => val!.isNotEmpty ? null : 'Invalid Username',
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            hintText: 'Username',
            hintStyle: TextStyle(
              color: Constants.primaryColor,
              fontSize: 16,
            ),
            isDense: true,
          ),
          onSaved: (value) => password = value!.trim(),
        ),
      ),
    );
  }

  Widget? enterUsername() {
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
            username = v;
            FocusScope.of(context).requestFocus(focusNode1);
          },
          validator: (val1) => val1!.isNotEmpty ? null : 'Invalid Username',
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
              hintText: 'Username',
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
          onSaved: (input) => username = input!.trim(),
        ),
      ),
    );
  }

  Widget enterPassword2() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.blockSizeVertical * 3.5,
        right: SizeConfig.blockSizeVertical * 3.5,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 6,
        child: TextFormField(
          controller: passwordCtrl,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          obscureText: true,
          validator: (val) => val!.isNotEmpty ? null : 'Invalid Password',
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Constants.primaryColor,
              fontSize: 16,
            ),
            isDense: true,
          ),
          onSaved: (value) => password = value!.trim(),
        ),
      ),
    );
  }

  Widget? enterPassword() {
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
            username = v;
            FocusScope.of(context).requestFocus(focusNode1);
          },
          validator: (val1) => val1!.isNotEmpty ? null : 'Invalid Password',
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
              hintText: 'Password',
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
          onSaved: (input) => password = input!.trim(),
        ),
      ),
    );
  }

  Widget? loginButton() {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4.5),
      child: AuthButton(
          color: Constants.primaryColor,
          title: 'Login',
          onPressed: () {
            loginApi();
          },
          height: SizeConfig.blockSizeVertical * 7,
          width: SizeConfig.blockSizeVertical * 17,
          textSize: 18,
          isLoading: isLoading),
    );
  }

  loginApi() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      FocusScope.of(context).requestFocus(FocusNode());

      Response? response =
          await userRepo.loginUser(userNameCtrl.text, passwordCtrl.text);
      log(response!.statusCode.toString());
      log(response.statusMessage.toString());

      LoginResponse loginResponse;

      loginResponse = LoginResponse.fromJson(response.data);

      if (loginResponse.status == true) {
        await userRepo.setUserLogIn(true);
        LoginResponse loginResponse1 = LoginResponse.fromJson(response.data);
        await userRepo.storeLoginResponse(loginResponse1);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const LandingPage()),
            (Route<dynamic> route) => false);
      } else if (loginResponse.status == false) {
        showDialog(
            context: context,
            builder: (_) {
              return InfoDialog(
                  message: 'Wrong Credentials!',
                  subtext: response.data['error_description'],
                  ok: () {
                    Navigator.pop(context, true);
                    return true;
                  });
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
}
