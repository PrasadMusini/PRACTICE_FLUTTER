import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class FindAppVersion extends StatefulWidget {
  const FindAppVersion({Key? key}) : super(key: key);

  @override
  State<FindAppVersion> createState() => _FindAppVersionState();
}

class _FindAppVersionState extends State<FindAppVersion> {
  late Future<String> futureAppVersion;
  int selectedIndex = 0;
  late List<Widget> pages;
// https://play.google.com/store/apps/details?id=com.calibrage.hairfixingzone&pcampaignid=web_share
// https://play.google.com/store/apps/details?id=com.calibrage.hairfixingzone&pcampaignid=web_share

  @override
  void initState() {
    super.initState();
    futureAppVersion = getAppVersionFromStore();
    // getAppVersion();
    checkForUpdate();
    pages = [
      homePage(),
      itemsPage(),
      const ProfilePage(),
    ];
  }

  Future<String> getAppVersionFromStore() async {
    final newVersion = NewVersionPlus(
      iOSId: 'com.calibrage.hairfixingzone',
      androidId: 'com.calibrage.hairfixingzone',
      androidPlayStoreCountry: "en_IN",
      androidHtmlReleaseNotes: true,
    );
    final appVersion = await newVersion.getVersionStatus();
    // print('playstore localVersion: ${appVersion?.localVersion}');
    // print('playstore storeVersion: ${appVersion?.storeVersion}');
    print(
        'playstore originalStoreVersion: ${appVersion?.originalStoreVersion}');
    print('playstore appStoreLink: ${appVersion?.appStoreLink}');
    print('playstore releaseNotes: ${appVersion?.releaseNotes}');
    return appVersion?.releaseNotes ?? "No release note found";
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // print('Flutter App Name: ${packageInfo.appName}');
    // print('Flutter Package Name: ${packageInfo.packageName}');
    print('Flutter Version: ${packageInfo.version}');
    print('Flutter Build Number: ${packageInfo.buildNumber}');
  }

  void checkForUpdate() async {
    final newVersion = NewVersionPlus(
      iOSId: 'com.calibrage.hairfixingzone',
      androidId: 'com.calibrage.hairfixingzone',
      androidPlayStoreCountry: "en_IN",
      androidHtmlReleaseNotes: true,
    );
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String title = packageInfo.appName;
    String currentVersion = packageInfo.version;
    final appVersion = await newVersion.getVersionStatus();
    String? storeVersion = appVersion?.originalStoreVersion;
    String? releaseNotes = appVersion?.releaseNotes;
    String? appStoreLink = appVersion?.appStoreLink;

    print('currentVersion: $currentVersion | storeVersion: $storeVersion');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool condition = prefs.getBool('isUpdateDialogShown') ?? false;
    // prefs.setBool('isUpdateDialogShown', isUpdateDialogShown);
    // if (currentVersion == storeVersion) {
    if (!condition) {
      if (compareVersions(currentVersion, storeVersion!)) {
        print('up to date');
        showDialogForUpdate(
            title: 'up to date',
            description: releaseNotes,
            link: appStoreLink,
            currentVersion: currentVersion,
            storeVersion: storeVersion);
      }
    }
  }

  bool compareVersions(String currentVersion, String storeVersion) {
    List<String> currentParts = currentVersion.split('.');
    List<String> storeParts = storeVersion.split('.');

    for (int i = 0; i < currentParts.length; i++) {
      int currentNum = int.parse(currentParts[i]);
      int storeNum = int.parse(storeParts[i]);

      if (currentNum < storeNum) {
        return true; // An update is available
      } else if (currentNum > storeNum) {
        return false; // Current version is newer
      }
    }

    return false; // Versions are the same
  }

  Future<dynamic> showDialogForUpdate(
      {String? title,
      String? description,
      String? link,
      String? currentVersion,
      String? storeVersion}) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return updateCard(
            title: title,
            currentVersion: currentVersion,
            storeVersion: storeVersion,
            description: description,
            link: link);
      },
    );
  }

  Widget updateCard(
      {required String? title,
      String? description,
      String? currentVersion,
      String? storeVersion,
      String? link}) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Placeholder
            Image.network(
              'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              'A new version of Hair Fixing Zone is available! Version $storeVersion is now available\nyou have $currentVersion. Would you like to update it now?',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            // Description
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'What\'s new',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              '$description',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            // Update Now Button
            Row(
              children: [
                customBtn(
                  'CANCEL',
                  onPressed: () {
                    showUpdateDialog();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 12),
                customBtn('UPDATE NOW', onPressed: () {
                  launchInBrowser(Uri.parse(link!));
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find App Version"),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.redAccent[800],
        onTap: onItemTapped,
      ),
    );
  }

  Widget homePage() {
    return SafeArea(
      child: FutureBuilder(
        future: futureAppVersion,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            final data = snapshot.data as String;
            return Center(
              child: Text(data),
            );
          }
        },
      ),
    );
  }

  Widget itemsPage() => Expanded(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
            title: Text('Item $index'),
          ),
        ),
      ));

  Widget item(String title, bool appUpdate) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: const Icon(Icons.info),
        title: Text(title),
        tileColor: Colors.grey[300],
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }

  void onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  void showUpdateDialog({bool isUpdateDialogShown = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isUpdateDialogShown', isUpdateDialogShown);
  }

  Widget customBtn(String text, {required void Function()? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<bool> futureUpdate;

  @override
  void initState() {
    super.initState();
    futureUpdate = checkForUpdate();
  }

  List<String> profileOptions = [
    'Edit Profile',
    'App Updates',
    'Help & Feedback',
    'Privacy Policy',
    'Terms & Conditions',
    'Rate Us',
    'Settings',
    'Delete Account',
    'Logout',
  ];

  Future<bool> checkForUpdate({bool isClickedOnAppDates = false}) async {
    final newVersion = NewVersionPlus(
      iOSId: 'com.calibrage.hairfixingzone',
      androidId: 'com.calibrage.hairfixingzone',
      androidPlayStoreCountry: "en_IN",
      androidHtmlReleaseNotes: true,
    );
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String title = packageInfo.appName;
    String currentVersion = packageInfo.version;
    final appVersion = await newVersion.getVersionStatus();
    String? storeVersion = appVersion?.originalStoreVersion;
    String? releaseNotes = appVersion?.releaseNotes;
    String? appStoreLink = appVersion?.appStoreLink;
    print('currentVersion: ${compareVersions(currentVersion, storeVersion!)}');
    if (isClickedOnAppDates) {
      showDialogForUpdate(
          title: 'up to date',
          description: releaseNotes,
          link: appStoreLink,
          currentVersion: currentVersion,
          storeVersion: storeVersion);
    }
    return compareVersions(currentVersion, storeVersion);
  }

  bool compareVersions(String currentVersion, String storeVersion) {
    List<String> currentParts = currentVersion.split('.');
    List<String> storeParts = storeVersion.split('.');

    for (int i = 0; i < currentParts.length; i++) {
      int currentNum = int.parse(currentParts[i]);
      int storeNum = int.parse(storeParts[i]);

      if (currentNum < storeNum) {
        return true; // An update is available
      } else if (currentNum > storeNum) {
        return false; // Current version is newer
      }
    }

    return false; // Versions are the same
  }

  Future<dynamic> showDialogForUpdate(
      {String? title,
      String? description,
      String? link,
      String? currentVersion,
      String? storeVersion}) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return updateCard(
            title: title,
            currentVersion: currentVersion,
            storeVersion: storeVersion,
            description: description,
            link: link);
      },
    );
  }

  Widget updateCard(
      {required String? title,
      String? description,
      String? currentVersion,
      String? storeVersion,
      String? link}) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Placeholder
            Image.network(
              'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              'A new version of Hair Fixing Zone is available! Version $storeVersion is now available\nyou have $currentVersion. Would you like to update it now?',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            // Description
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'What\'s new',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              '$description',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            // Update Now Button
            Row(
              children: [
                customBtn(
                  'CANCEL',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 12),
                customBtn('UPDATE NOW', onPressed: () {
                  launchInBrowser(Uri.parse(link!));
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Widget customBtn(String text, {required void Function()? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: futureUpdate,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              bool condition = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                  itemCount: profileOptions.length,
                  itemBuilder: (context, index) {
                    return item(
                        profileOptions[index], index == 1 ? condition : false);
                  },
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget item(String title, bool appUpdate) {
    if (appUpdate) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListTile(
          leading: const Icon(Icons.info),
          title: Text(title),
          tileColor: Colors.grey[300],
          onTap: () {
            checkForUpdate(isClickedOnAppDates: true);
          },
          trailing: const Icon(
            Icons.circle,
            size: 16,
            color: Colors.green,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListTile(
          leading: const Icon(Icons.info),
          title: Text(title),
          tileColor: Colors.grey[300],
          trailing: const Icon(Icons.arrow_right),
        ),
      );
    }
  }
}
/* 
class UpdateCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? currentVersion;
  final String? storeVersion;
  final String? link;
  const UpdateCard(
      {Key? key,
      required this.title,
      this.description,
      this.link,
      this.currentVersion,
      this.storeVersion})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Placeholder
            Image.network(
              'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              'A new version of Hair Fixing Zone is available! Version $storeVersion is now available\nyou have $currentVersion. Would you like to update it now?',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            // Description
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'What\'s new',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              '$description',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            // Update Now Button
            Row(
              children: [
                customBtn(
                  'CANCEL',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 12),
                customBtn('UPDATE NOW', onPressed: () {
                  launchInBrowser(Uri.parse(link!));
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customBtn(String text, {required void Function()? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
 */