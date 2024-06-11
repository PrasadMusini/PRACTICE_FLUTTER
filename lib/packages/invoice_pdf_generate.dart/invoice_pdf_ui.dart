import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:practice_flutter/packages/invoice_pdf_generate.dart/file_handle_api.dart';
import 'pdf_invoice_api.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoicePdfGenerater extends StatefulWidget {
  const InvoicePdfGenerater({super.key});

  @override
  State<InvoicePdfGenerater> createState() => _InvoicePdfGeneraterState();
}

class _InvoicePdfGeneraterState extends State<InvoicePdfGenerater> {
  PdfColor themeColor = PdfColors.black;
  pw.Font font = pw.Font.courier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                hintText: 'Select Theme color',
              ),
              items: const [
                DropdownMenuItem(
                  value: PdfColors.black,
                  child: Text('Black'),
                ),
                DropdownMenuItem(
                  value: PdfColors.grey900,
                  child: Text('Dark Grey'),
                ),
                DropdownMenuItem(
                  value: PdfColors.green,
                  child: Text('Green'),
                ),
                DropdownMenuItem(
                  value: PdfColors.blue,
                  child: Text('Blue'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  themeColor = value as PdfColor;
                });
              },
            ),

            // Choose Font
            DropdownButtonFormField(
              decoration: const InputDecoration(
                hintText: 'Select Font',
              ),
              items: const [
                DropdownMenuItem(
                  value: pw.Font.courier,
                  child: Text('Courier'),
                ),
                DropdownMenuItem(
                  value: pw.Font.helvetica,
                  child: Text('Helvetica'),
                ),
                DropdownMenuItem(
                  value: pw.Font.times,
                  child: Text('Times'),
                ),
                DropdownMenuItem(
                  value: pw.Font.zapfDingbats,
                  child: Text('ZapfDingbats'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    font = value();
                  });
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                // generate pdf file
                final pdfFile = await PdfInvoiceApi.generate(
                  themeColor,
                  pw.Font.courier(),
                );

                // opening the pdf file
                FileHandleApi.openFile(pdfFile);
              },
              child: const Text('Generate Invoice'),
            ),
          ],
        ),
      ),
    );
  }
}
