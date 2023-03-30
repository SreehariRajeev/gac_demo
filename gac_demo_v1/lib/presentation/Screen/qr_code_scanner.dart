import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Utils/size_config.dart';
import 'package:gac_demo_v1/presentation/Screen/qrcode_response_page.dart';
import 'package:qr_scanner_plus/qr_scanner_plus.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String? qrValue;
  bool _isInitialized = false;
  BarcodeScanner barcodeScanner = BarcodeScanner();

  CameraController? _controller;
  QRViewController? _qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qrValue = '';
    checkCameraPermission();
    availableCameras().then((cameras) {
      if (cameras.length > 0) {
        _controller = CameraController(cameras[0], ResolutionPreset.medium);
        _controller!.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrController = controller;
    });
    controller.scannedDataStream.listen((scanData) {});
  }

  double _zoom = 1.0;

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _zoom = details.scale.clamp(1.0, 3.0);
    });
  }

  void _onQRViewTapDown(TapDownDetails details) {
    if (_qrController != null) {
      _qrController!.toggleFlash();
    }
  }

// TODO: implement build
}

Future<void> checkCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    await Permission.camera.request();
  }
}
