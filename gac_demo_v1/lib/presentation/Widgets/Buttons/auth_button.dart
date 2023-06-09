import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../Utils/size_config.dart';

class AuthButton extends StatelessWidget {
  final Function() onPressed;
  final Color? color;
  final bool? isLoading;
  final String title;
  final double width, height, textSize;

  AuthButton(
      {this.color,
      required this.title,
      required this.onPressed,
      required this.height,
      required this.width,
      required this.textSize,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: (isLoading!)
            ? SpinKitThreeBounce(
                color: Colors.white,
                size: textSize,
              )
            : Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: textSize,
                    fontWeight: FontWeight.w700),
              ),
      ),
    );
  }
}
