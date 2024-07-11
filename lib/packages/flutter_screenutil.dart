import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Design')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 0.8.sw, // 80% of screen width
              height: 200.h, // 200 logical pixels based on design size
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Responsive Container',
                  style: TextStyle(
                      fontSize:
                          24.sp), // 24 logical pixels based on design size
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.1.sw), // 10% of screen width
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Responsive TextField',
                  labelStyle: TextStyle(fontSize: 18.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(0.6.sw,
                    50.h), // 60% of screen width and 50 logical pixels height
              ),
              child: Text(
                'Responsive Button',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
