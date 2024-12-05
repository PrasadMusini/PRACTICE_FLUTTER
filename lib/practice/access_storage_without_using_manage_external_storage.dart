import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

class FileDownloader extends StatefulWidget {
  const FileDownloader({super.key});

  @override
  State<FileDownloader> createState() => _FileDownloaderState();
}

class _FileDownloaderState extends State<FileDownloader> {
  final String url =
      'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';

  final String originPath = '/sdcard/Download/Prasad/test_dir';

  Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      final String versionString = Platform.version.split(" ").last;
      final int sdkVersion =
          int.tryParse(versionString.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;

      if (sdkVersion >= 33) {
        // For Android 13 (API level 33) and above
        final PermissionStatus mediaLibrary =
            await Permission.mediaLibrary.request();

        if (mediaLibrary.isGranted) {
          showSnackbar('Media permissions granted.');
        } else {
          showSnackbar('Media permissions denied.');
        }
      } else {
        // For Android 12 (API level 32) and below
        final PermissionStatus storageStatus =
            await Permission.storage.request();
        if (storageStatus.isGranted) {
          showSnackbar('Storage permission granted.');
        } else {
          showSnackbar('Storage permission denied.');
        }
      }
    } else {
      showSnackbar('Storage permissions are not required for this platform.');
    }
  }

  Future<void> downloadPdfFile() async {
    try {
      String directoryPath = originPath;
      Directory directory = Directory(directoryPath);

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final String savePath = p.join(
          directory.path, 'test_${DateTime.now().millisecondsSinceEpoch}.pdf');
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final File file = File(savePath);
        await file.writeAsBytes(response.bodyBytes);
        print('File downloaded to: $savePath');
        showSnackbar('File downloaded to: $savePath');
      } else {
        showSnackbar(
            'Failed to download file. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('catch: $e');
      rethrow;
    }
  }

  Future<void> openDownloadDirectory() async {
    try {
      String directoryPath = originPath;
      Directory directory = Directory(directoryPath);

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      await OpenFile.open(directoryPath);
    } catch (e) {
      print('openDownloadDirectory: $e');
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Downloader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*  ElevatedButton(
              onPressed: requestPermissions,
              child: const Text('Request Storage Permissions'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: downloadPdfFile,
              child: const Text('Download PDF File'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: openDownloadDirectory,
              child: const Text('Open Download Directory'),
            ), */
            ElevatedButton(
                onPressed: createDirectoryBasedOnPlatform,
                child: const Text('Create Directory'))
          ],
        ),
      ),
    );
  }

  Future<void> createDirectoryBasedOnPlatform() async {
    try {
      if (Platform.isAndroid) {
        Directory downloadsDirectory = Directory('/sdcard/Download/MyApp');
        if (!await downloadsDirectory.exists()) {
          await downloadsDirectory.create(recursive: true);
          print("Directory created in Android Downloads.");
        } else {
          print("Directory already exists in Android Downloads.");
        }
      } else if (Platform.isIOS) {
        Directory appDocDirectory = await getApplicationDocumentsDirectory();
        Directory myAppDirectory = Directory('${appDocDirectory.path}/MyApp');
        if (!await myAppDirectory.exists()) {
          await myAppDirectory.create(recursive: true);
          print("Directory created in iOS Documents.");
        } else {
          print("Directory already exists in iOS Documents.");
        }
      } else {
        print("Unsupported platform.");
      }
    } catch (e) {
      print("Error creating directory: $e");
    }
  }
}
