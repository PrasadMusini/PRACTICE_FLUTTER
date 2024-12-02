import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppVersionFromPlayStore extends StatefulWidget {
  const AppVersionFromPlayStore({super.key});

  @override
  _AppVersionFromPlayStoreState createState() =>
      _AppVersionFromPlayStoreState();
}

class _AppVersionFromPlayStoreState extends State<AppVersionFromPlayStore> {
  late Future<String> future;

  @override
  void initState() {
    super.initState();
    future = fetchAppVersionFromPlayStore();
  }

// https://play.google.com/store/apps/details?id=com.calibrage.hairfixingzone&pcampaignid=web_share
// https://play.google.com/store/apps/details?id=com.calibrage.hairfixingzone
// https://play.google.com/store/apps/details?id=com.calibrage.hairfixingzone&hl=en
  Future<String> fetchAppVersionFromPlayStore() async {
    const packageName =
        "com.calibrage.hairfixingzone"; // Replace with your package
    const url =
        "https://play.google.com/store/apps/details?id=com.calibrage.hairfixingzone&hl=en";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final versionMatch =
            RegExp(r'Current Version.*?>([\d.]+)<').firstMatch(response.body);
        if (versionMatch != null) {
          return versionMatch.group(1) ?? "Unknown";
        } else {
          print("Error fetching app version: Failed to parse version");
          throw Exception('Failed to parse version');
        }
      } else {
        throw Exception('Failed to load page');
      }
    } catch (e) {
      print("Error fetching app version: $e");
      throw Exception('Error fetching app version: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Version Check')),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(
              child: Text('Play Store Version: ${snapshot.data}'),
            );
          }
        },
      ),
    );
  }
}
