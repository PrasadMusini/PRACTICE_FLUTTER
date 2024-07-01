import 'package:digital_signature_flutter/digital_signature_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DigitalSignature extends StatefulWidget {
  const DigitalSignature({Key? key}) : super(key: key);

  @override
  State<DigitalSignature> createState() => _DigitalSignatureState();
}

class _DigitalSignatureState extends State<DigitalSignature> {
  SignatureController? controller;
  Uint8List? signature;
  @override
  void initState() {
    controller = SignatureController(penStrokeWidth: 2, penColor: Colors.black);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Signature'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text('Please put the signature here',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const SizedBox(height: 15),
            Signature(
              height: 200,
              width: 350,
              controller: controller!,
            ),
            buttonWidgets(context)!,
            const SizedBox(height: 30),
            // const Text(viewSignature),
            signature != null
                ? Column(
                    children: [
                      Center(child: Image.memory(signature!)),
                      const SizedBox(height: 10),
                      MaterialButton(
                        color: Colors.green,
                        onPressed: () {},
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  buttonWidgets(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () async {
            if (controller!.isNotEmpty) {
              final sign = await exportSignature();
              setState(() {
                signature = sign;
              });
            } else {
              //showMessage
              // Please put your signature;
            }
          },
          child: const Text("Preview",
              style: TextStyle(fontSize: 20, color: Colors.green)),
        ),
        TextButton(
          onPressed: () {
            controller?.clear();
            setState(() {
              signature = null;
            });
          },
          child: const Text("Cancel",
              style: TextStyle(fontSize: 20, color: Colors.red)),
        ),
      ],
    );
  }

  Future<Uint8List?> exportSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      exportBackgroundColor: Colors.white,
      penColor: const Color.fromARGB(255, 199, 11, 11),
      points: controller!.points,
    );

    final signature = exportController.toPngBytes();

    //clean up the memory
    exportController.dispose();

    return signature;
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
