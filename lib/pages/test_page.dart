/* import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;

class FileDownloader extends StatefulWidget {
  const FileDownloader({super.key});

  @override
  State<FileDownloader> createState() => _FileDownloaderState();
}

class _FileDownloaderState extends State<FileDownloader> {
  final String url =
      'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';

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

  Future<String> getSdCardDirectory() async {
    try {
      String? downloadDirectory;
      if (Platform.isAndroid) {
        final externalStorageFolder = await getExternalStorageDirectory();
        if (externalStorageFolder != null) {
          downloadDirectory = p.join(externalStorageFolder.path, "Downloads");
        }
      } else {
        final downloadFolder = await getDownloadsDirectory();
        downloadDirectory = downloadFolder!.path;
      }
      return downloadDirectory!;
    } catch (e) {
      showSnackbar('Error creating directory: $e');
      rethrow;
    }
  }
  /*  Future<String> getSdCardDirectory() async {
    try {
      final Directory? externalDir = await getExternalStorageDirectory();
      // final Directory? externalDir = await getExternalStorageDirectory();
      if (externalDir == null) {
        throw Exception("No external storage directory found.");
      }

      final String newDirPath = '${externalDir.path}/prasad';
      final Directory newDir = Directory(newDirPath);

      if (!await newDir.exists()) {
        await newDir.create(recursive: true);
        showSnackbar('Directory created at: $newDirPath');
      } else {
        showSnackbar('Directory already exists at: $newDirPath');
      }
      return newDirPath;
    } catch (e) {
      showSnackbar('Error creating directory: $e');
      rethrow;
    }
  } */

  Future<void> downloadPdfFile() async {
    try {
      final String saveDirectory = await getSdCardDirectory();
      final String savePath =
          '$saveDirectory/test_${DateTime.now().millisecondsSinceEpoch}.pdf';

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
      showSnackbar('Download failed: $e');
    }
  }

  Future<void> openDownloadDirectory() async {
    try {
      final String downloadPath = await getSdCardDirectory();
      final result = await OpenFile.open(downloadPath);

      if (result.type != ResultType.done) {
        showSnackbar('Failed to open the directory.');
      }
    } catch (e) {
      showSnackbar('Error: $e');
    }
  }

  /// Show a message in the Snackbar
  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await requestPermissions();
            },
            child: const Text('Create Directory'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: downloadPdfFile,
            child: const Text('Download PDF'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: openDownloadDirectory,
            child: const Text('Open Directory'),
          ),
        ],
      ),
    );
  }
}
 */