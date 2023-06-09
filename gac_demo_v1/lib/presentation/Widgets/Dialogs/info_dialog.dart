import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/size_config.dart';
import '../Buttons/custom_button.dart';

class InfoDialog extends StatelessWidget {
  final String message;
  final String? subtext;
  final Function() ok;
  final bool? isLoading;

  // ignore: use_key_in_widget_constructors
  const InfoDialog(
      {required this.message, required this.ok, this.subtext, this.isLoading});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 5),
                  child: Text(
                    message,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                (subtext != null)
                    ? Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeHorizontal * 5),
                        child: Text(
                          subtext!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: Color.fromRGBO(34, 34, 34, 1),
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 5),
                  child: CustomButton(
                    isLoading: isLoading!,
                    title: 'OK',
                    borderColor: Constants.primaryColor,
                    backgroundColor: Constants.primaryColor,
                    titleColor: Colors.white,
                    onPressed: () {
                      ok();
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
