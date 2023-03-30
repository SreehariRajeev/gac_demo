import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../Utils/constants.dart';
import '../../../../Utils/size_config.dart';

class TabDesign extends StatelessWidget {
  final int? currentTab, tabNo;
  final String? title;
  final BorderRadius? borderRadiusGeometry;

  final Color? color1, color2;
  final Function()? onPressed;

  TabDesign(
      {this.currentTab,
      this.onPressed,
      this.title,
      this.tabNo,
      this.borderRadiusGeometry,
      this.color1,
      this.color2});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return InkWell(
      onTap: () {
        onPressed!();
      },
      borderRadius: borderRadiusGeometry!,
      child: Container(
        height: SizeConfig.blockSizeHorizontal * 15,
        width: SizeConfig.blockSizeHorizontal*40,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: color2,
          border: Border.all(width: 0, color: Colors.transparent),
        ),
        child: Container(
          height: SizeConfig.blockSizeHorizontal * 15,
          width: SizeConfig.blockSizeHorizontal*40,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color1,
            border: Border.all(width: 0, color: color1!),
            borderRadius: borderRadiusGeometry,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
            style: (tabNo == currentTab)
                ? const TextStyle(
                    color: Constants.primaryColor,
                    fontFamily: Constants.fontBold,
                    fontSize: 15)
                : TextStyle(
                    color: Colors.grey[100],
                    fontFamily: Constants.fontRegular,
                    fontSize: 15),
            child: Text(
              title!,
            ),
          ),
        ),
      ),
    );
  }
}
