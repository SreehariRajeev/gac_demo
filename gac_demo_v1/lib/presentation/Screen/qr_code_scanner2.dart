import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gac_demo_v1/presentation/Screen/qrcode_response_page.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScanner2 extends StatefulWidget {
  QRCodeScanner2({Key? key}) : super(key: key);

  @override
  State<QRCodeScanner2> createState() => _QRCodeScanner2State();
}

class _QRCodeScanner2State extends State<QRCodeScanner2> {
  final MobileScannerController mobileScannerController =
      MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Mobile Scanner'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: mobileScannerController.torchState,
                builder: (context, state, child) {
                  switch (state) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => mobileScannerController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: mobileScannerController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => mobileScannerController.switchCamera(),
            ),
          ],
        ),
        body: GestureDetector(
          child: MobileScanner(
            allowDuplicates: false,
            controller: mobileScannerController,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                log('Failed to scan Barcode');
              } else {
                log(barcode.rawValue!);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            QRCodeResponsePage(grnNumber: barcode.rawValue!)));
              }
            },
          ),
        ));
  }

  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }
}
