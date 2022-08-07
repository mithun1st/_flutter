import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scanner extends StatefulWidget {
  final String routeName = 'sca';
  @override
  State<StatefulWidget> createState() {
    return ScannerState();
  }
}

//------------
class ScannerState extends State {
  final QRkey = GlobalKey(debugLabel: 'xxxxxxx');
  QRViewController? controller;
  Barcode? bc;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void scanQR() {}

  Widget QRwidget1(BuildContext context) {
    return QRView(
      key: QRkey,
      overlay: QrScannerOverlayShape(
        overlayColor: Colors.green,
        borderRadius: 4,
        borderLength: 50,
        borderWidth: 12,
        borderColor: Colors.red,
      ),
      onQRViewCreated: (ctrl) {
        print(ctrl.getFlashStatus());
        setState(() {
          this.controller = ctrl;
          controller!.scannedDataStream.listen((event) {
            print(event.code);
          });
        });
      },
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            width: 400,
            color: Colors.yellow,
            child: QRwidget1(context),
          ),
          Text(bc == null ? 'Scan Please' : '${bc?.code}'),
          ElevatedButton(
            onPressed: () => scanQR(),
            child: const Text('click'),
          ),
        ],
      ),
    );
  }
}
