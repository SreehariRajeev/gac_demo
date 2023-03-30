import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Repository/user_repo.dart';
import 'package:gac_demo_v1/Utils/constants.dart';
import 'package:gac_demo_v1/Utils/size_config.dart';
import 'package:gac_demo_v1/presentation/Screen/LoginScreen/login_screen.dart';

import 'Landing page/landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserRepo userRepo = UserRepo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToPage();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Constants.secondaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'GAC',
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 0,
              ),
              const Text('        Gallant   Adroit   Collaborative')
            ],
          ),
        ),
      ),
    );
  }

  goToPage() async {
    Future.delayed(const Duration(seconds: 1), () async {
      bool isLoggedIn;
      isLoggedIn = await userRepo.isLoggedIn();
      if (isLoggedIn) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LandingPage()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()),
            (route) => false);
      }
    });
  }
}
