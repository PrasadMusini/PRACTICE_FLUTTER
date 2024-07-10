import 'package:flutter/material.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class UpiQrCodeGenerater extends StatefulWidget {
  const UpiQrCodeGenerater({super.key});

  @override
  State<UpiQrCodeGenerater> createState() => _UpiQrCodeGeneraterState();
}

class _UpiQrCodeGeneraterState extends State<UpiQrCodeGenerater> {
  final upiDetailsWithAmount = UPIDetails(
    upiID: "prasadmusini1999@axl",
    payeeName: "with amount",
    amount: 1,
    transactionNote: "One Rupee",
  );
  final upiDetailsWithoutAmount = UPIDetails(
    upiID: "prasadmusini1999@axl",
    payeeName: "without amount",
    transactionNote: "No amount specified",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UPI Payment QRCode Generator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text("UPI Payment QRCode without Amount",
              //     style: TextStyle(fontWeight: FontWeight.bold)),
              // UPIPaymentQRCode(
              //   upiDetails: upiDetailsWithoutAmount,
              //   size: 220,
              //   embeddedImagePath: Assets.images.googleLogo.path,
              //   embeddedImageSize: const Size(60, 60),
              //   eyeStyle: const QrEyeStyle(
              //     eyeShape: QrEyeShape.circle,
              //     color: Colors.black,
              //   ),
              //   dataModuleStyle: const QrDataModuleStyle(
              //     dataModuleShape: QrDataModuleShape.circle,
              //     color: Colors.black,
              //   ),
              // ),
              const SizedBox(height: 30),
              Text(
                "Scan QR to Pay",
                style: TextStyle(color: Colors.grey[600], letterSpacing: 1.2),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("UPI Payment QRCode with Amount",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              UPIPaymentQRCode(
                upiDetails: upiDetailsWithAmount,
                size: 220,
                upiQRErrorCorrectLevel: UPIQRErrorCorrectLevel.high,
              ),
              Text(
                "Scan QR to Pay",
                style: TextStyle(color: Colors.grey[600], letterSpacing: 1.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
