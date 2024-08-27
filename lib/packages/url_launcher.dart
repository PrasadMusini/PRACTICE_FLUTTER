import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatelessWidget {
  UrlLauncher({
    super.key,
  });

  final Uri facebookProfileUrl = Uri.parse(
      'https://www.facebook.com/share/AwYhQxCNtf7Q33gS/?mibextid=qi2Omg');
  final Uri instaProfileUrl = Uri.parse(
      'https://www.instagram.com/cristiano?igsh=MTdwaDUybmo0ZW1kdw==');
  final Uri url = Uri.parse('https://pub.dev/packages/url_launcher/example');
  final Uri mapUrl =
      Uri.parse('https://maps.app.goo.gl/hLaCq569kKC6QzGy5'); // Map URL

  final String whatsappPhoneNumber = '9553624970';
  final String whatsappMessage =
      'Hello, this is a WhatsApp message from my Flutter app!';
  final String emailRecipient = 'durgaprasad.musini@calibrage.in';
  final String emailSubject = 'Flutter App Email';
  final String emailBody = 'This is the email body from my Flutter app.';

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _sendWhatsAppMessage(String phone, String message) async {
    final Uri whatsappUri = Uri.parse(
        'whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}');
    await launchUrl(whatsappUri);
  }

  Future<void> _sendEmail(String email, String subject, String body) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );
    await launchUrl(emailUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Launcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _launchInBrowser(facebookProfileUrl);
              },
              child: const Text('Open Facebook Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                _launchInBrowser(instaProfileUrl);
              },
              child: const Text('Open Instagram Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                _launchInBrowser(url);
              },
              child: const Text('Open Web URL'),
            ),
            ElevatedButton(
              onPressed: () {
                _makePhoneCall('111111111111');
              },
              child: const Text('Make Call'),
            ),
            ElevatedButton(
              onPressed: () {
                _sendWhatsAppMessage(whatsappPhoneNumber, whatsappMessage);
              },
              child: const Text('Send WhatsApp Message'),
            ),
            ElevatedButton(
              onPressed: () {
                _sendEmail(emailRecipient, emailSubject, emailBody);
              },
              child: const Text('Send Email'),
            ),
            ElevatedButton(
              onPressed: () {
                _launchInBrowser(mapUrl);
              },
              child: const Text('Open Map Location'),
            ),
          ],
        ),
      ),
    );
  }
}
