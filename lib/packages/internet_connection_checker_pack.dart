// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

class CheckConnection extends StatefulWidget {
  const CheckConnection({Key? key}) : super(key: key);

  @override
  State<CheckConnection> createState() => _CheckConnectionState();
}

class _CheckConnectionState extends State<CheckConnection> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  late Future<List<dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    getConnectivity();
    futureData = getData();
  }

  Future<void> getConnectivity({void Function()? onConnection}) async {
    subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;

        if (!isDeviceConnected && isAlertSet == false) {
          // showDialogBox();
          // onConnection?.call();
          // isAlertSet = true;
          // showDialogBox();
          print('111');
        } else {
          print('222');
          setState(() {
            futureData = getData();
          });
          // isAlertSet = false;
        }
      },
    );
  }

  Future<bool> checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    bool isDeviceConnected = await InternetConnectionChecker().hasConnection;

    return isDeviceConnected &&
        (result.first == ConnectivityResult.mobile ||
            result.first == ConnectivityResult.wifi);
  }

  Future<List<dynamic>> getData() async {
    try {
      final jsonresponse = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      print('jsonresponse.statusCode: ${jsonresponse.statusCode}');
      if (jsonresponse.statusCode == 200) {
        final response = jsonDecode(jsonresponse.body);
        return response as List<dynamic>;
      } else {
        throw Exception('Failed to load data');
      }
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please check you are connection',
          ),
        ),
      );
      throw Exception(
        'Please check you are connection',
      );
    } catch (e) {
      print('catch: $e');
      rethrow;
    }
  }

  Future<List<dynamic>> getData2() async {
    try {
      final jsonresponse = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      print('jsonresponse.statusCode: ${jsonresponse.statusCode}');
      if (jsonresponse.statusCode == 200) {
        Navigator.pop(context);
        final response = jsonDecode(jsonresponse.body);
        return response as List<dynamic>;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('catch: $e');
      rethrow;
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Connectivity Checker'),
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString().replaceFirst('Exception: ', ''),
              ),
            );
          } else {
            final data = snapshot.data as List<dynamic>;
            if (data.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]['title']),
                      trailing: Text(data[index]['id'].toString()),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('No Data'),
              );
            }
          }
        },
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  // showDialogBox();
                  setState(() => futureData = getData2());
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
