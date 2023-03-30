import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../Utils/size_config.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;

  final String title;
  final double? height, width, textSize;

  final Color backgroundColor;
  final Color borderColor;
  final Color titleColor;
  final bool isLoading;

  CustomButton(
      {required this.backgroundColor,
      required this.borderColor,
      required this.title,
      this.height,
      this.width,
      required this.titleColor,
      required this.onPressed,
      required this.isLoading,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: (height != null) ? height : SizeConfig.blockSizeHorizontal * 12,
        width: (width != null) ? width : SizeConfig.blockSizeHorizontal * 20,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 14,
                  color: Colors.black.withOpacity(0.4))
            ],
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: borderColor),
            color: backgroundColor),
        child: (isLoading)
            ? SpinKitThreeBounce(
                color: Colors.white,
                size: textSize!,
              )
            : Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: titleColor,
                  ),
                ),
              ),
      ),
    );
  }
}
