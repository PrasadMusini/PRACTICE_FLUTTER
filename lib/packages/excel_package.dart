import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_flutter/main.dart';

class ExcelPack extends StatefulWidget {
  const ExcelPack({super.key});

  @override
  State<ExcelPack> createState() => _ExcelPackState();
}

class _ExcelPackState extends State<ExcelPack> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _generateExcel() async {
    if (_formKey.currentState!.validate()) {
      var excel = Excel.createExcel();
      Sheet sheetObject = excel['Sheet1'];

      // Adding headers
      sheetObject.cell(CellIndex.indexByString("A1")).value =
          const TextCellValue("Pet Name");
      sheetObject.cell(CellIndex.indexByString("B1")).value =
          const TextCellValue("Pet Age");
      sheetObject.cell(CellIndex.indexByString("C1")).value =
          const TextCellValue("Pet Email");
      sheetObject.cell(CellIndex.indexByString("D1")).value =
          const TextCellValue("Pet Address");

      // Adding user data
      sheetObject.cell(CellIndex.indexByString("A2")).value =
          TextCellValue(_nameController.text);
      sheetObject.cell(CellIndex.indexByString("B2")).value =
          TextCellValue(_ageController.text);
      sheetObject.cell(CellIndex.indexByString("C2")).value =
          TextCellValue(_emailController.text);
      sheetObject.cell(CellIndex.indexByString("D2")).value =
          TextCellValue(_addressController.text);

      // Save the file
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/sample_excel_file.xlsx';
      final file = File(path);
      file.writeAsBytesSync(excel.save()!);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Excel file saved at $path')));

      print('Excel file saved at $path');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Excel Generator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateExcel,
                child: const Text('Generate Excel File'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: goToOpenFileXPack,
                child: const Text('Go to open file x pack'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToOpenFileXPack() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OpenFileXPack(),
      ),
    );
  }
}
