import 'package:demo/presentation/screen/qr_scanner_demo/qr_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  QRScannerController controller1 = Get.put(QRScannerController());

  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String scannedCode = "";
  bool qrCodeOnOff = false;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedCode = scanData.code!;
        qrCodeOnOff = false;
      });
      print("Scanned data: ${scanData.code}");
      // You can now use scanData.code for your own purposes, such as navigating to a specific page.
    });
  }

  Future<void> scanBarcode() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
          "#004297", "Cancel", true, ScanMode.DEFAULT);
      setState(() {
        scannedCode = barcode;
        qrCodeOnOff = false;
      });
      print("Scanned barcode: $barcode");
    } catch (e) {
      print("Error scanning barcode: $e");
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            qrCodeOnOff == true
                ? Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: QRView(
                      key: qrKey,
                      overlay: QrScannerOverlayShape(borderRadius: 20),
                      onQRViewCreated: _onQRViewCreated,
                    ),
                  ).paddingAll(10)
                : InkWell(
                    onTap: () {
                      setState(() {
                        qrCodeOnOff = !qrCodeOnOff;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            const BoxShadow(color: Colors.white, blurRadius: 2)
                          ]),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.qr_code_scanner_outlined,
                            size: 30,
                          ).paddingSymmetric(horizontal: 6),
                          const Text(
                            "Scan QR",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ),
                  ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    const BoxShadow(color: Colors.white, blurRadius: 2)
                  ]),
              child: InkWell(
                onTap: () {
                  scanBarcode();
                },
                child: const Center(
                  child: Text(
                    "Scan Barcode",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ).paddingAll(10),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: ListTile(
                title: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 00),
                  child: Text(
                    "Show QR/Bar Code Value",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                subtitle: Text("$scannedCode"),
              ),
            ),
            // Center(
            //     child: Text(
            //   // textAlign: TextAlign.center,
            //   "Show QR/Bar Code Value:\n $scannedCode",
            //   style: const TextStyle(
            //       color: Colors.black,
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold),
            // )).paddingAll(10),
          ],
        ),
      ),
    );
  }
}
