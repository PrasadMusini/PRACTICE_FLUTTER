import 'package:flutter/material.dart';
import 'package:practice_flutter/packages/flutter_local_notifiy/notification_service.dart';

class DisplayNotifcations extends StatelessWidget {
  const DisplayNotifcations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  NotificationService.showNotification(
                      title: 'test title', body: 'test body');
                },
                child: const Text('Show Notification'))
          ],
        ),
      ),
    );
  }
}
