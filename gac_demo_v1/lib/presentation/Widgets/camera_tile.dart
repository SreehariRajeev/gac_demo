import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import '../../Utils/size_config.dart';

class CameraTile extends StatefulWidget {
  final bool isDocPage;
  Function(String) imageUrl;

  CameraTile({Key? key, required this.imageUrl, required this.isDocPage})
      : super(key: key);

  @override
  State<CameraTile> createState() => _CameraTileState();
}

class _CameraTileState extends State<CameraTile> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 1,
          right: SizeConfig.blockSizeHorizontal * 1,
          top: SizeConfig.blockSizeHorizontal * 1),
      child: InkWell(
        child: widget.isDocPage == false
            ? Container(
                height: SizeConfig.blockSizeHorizontal * 30,
                width: SizeConfig.blockSizeHorizontal * 30,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                child: _imageFile != null
                    ? _previewImage()
                    : Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1.5,
                            bottom: SizeConfig.blockSizeVertical * 1.5),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[200]),
                          child: Icon(
                            Icons.add,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
              )
            : Container(
                height: SizeConfig.blockSizeHorizontal * 100,
                width: SizeConfig.blockSizeHorizontal * 80,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                child: _imageFile != null
                    ? _previewImage()
                    : Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1.5,
                            bottom: SizeConfig.blockSizeVertical * 1.5),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[200]),
                          child: Icon(
                            Icons.add,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
              ),
        onTap: () {
          cameraTapped();
        },
      ),
    );
  }

  void cameraTapped() async {
    try {
      _picker
          .pickImage(source: ImageSource.camera, imageQuality: 50)
          .then((value) {
        print('image url');
        print('${value!.path}');
        setState(() {
          _imageFile = value;
        });
        if (value.path != null) {
          widget.imageUrl(value.path);
        } else {
          widget.imageUrl == null;
        }
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }

  Widget _previewImage() {
    if (_imageFile != null) {
      return Container(
        height: SizeConfig.blockSizeVertical * 20,
        width: SizeConfig.blockSizeVertical * 20,
        child: Image.file(
          File(_imageFile!.path),
          fit: BoxFit.fill,
        ),
      );
    } else {
      return Container();
    }
  }
}
