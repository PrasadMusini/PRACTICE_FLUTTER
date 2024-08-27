import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/packages/easy_localization/app_local.dart';
import 'package:practice_flutter/packages/easy_localization/locale_keys.dart';

/* void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          AppLocal.teluguLocale,
          AppLocal.englishLocale,
          AppLocal.hindiLocale,
          AppLocal.kannadaLocale
        ],
        path: AppLocal.localePath,
        saveLocale: true,
        fallbackLocale: AppLocal.englishLocale,
        startLocale: AppLocal.englishLocale,
        child: const MyWidget()),
  );
} 

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const EasyHome(),
    );
  }
}
*/

class EasyHome extends StatelessWidget {
  const EasyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.welcome.tr(args: ['Jessy'])),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(tr(LocaleKeys.text1)),
            Text(tr(LocaleKeys.text2)),
            Text(tr(LocaleKeys.text3)),
            ElevatedButton(
                onPressed: () => context.setLocale(AppLocal.teluguLocale),
                child: const Text('Telugu')),
            ElevatedButton(
                onPressed: () => context.setLocale(AppLocal.englishLocale),
                child: const Text('English')),
            ElevatedButton(
                onPressed: () => context.setLocale(AppLocal.hindiLocale),
                child: const Text('Hindi')),
            ElevatedButton(
              onPressed: () => context.setLocale(AppLocal.kannadaLocale),
              child: const Text('Kannada'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Easy2()),
              ),
              child: const Text('To Easy2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Easy2 extends StatelessWidget {
  const Easy2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy2'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(tr(LocaleKeys.text3)),
            Text(tr(LocaleKeys.text2)),
            Text(tr(LocaleKeys.text1)),
            ElevatedButton(
                onPressed: () => context.setLocale(AppLocal.teluguLocale),
                child: const Text('Telugu')),
            ElevatedButton(
                onPressed: () => context.setLocale(AppLocal.englishLocale),
                child: const Text('English')),
            ElevatedButton(
                onPressed: () => context.setLocale(AppLocal.hindiLocale),
                child: const Text('Hindi')),
            ElevatedButton(
              onPressed: () => context.setLocale(AppLocal.kannadaLocale),
              child: const Text('Kannada'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Easy3()),
              ),
              child: const Text('To Easy3'),
            ),
          ],
        ),
      ),
    );
  }
}

class Easy3 extends StatelessWidget {
  const Easy3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy3'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(tr(LocaleKeys.text2)),
            ElevatedButton(
                onPressed: () => context.setLocale(AppLocal.teluguLocale),
                child: const Text('Telugu')),
            ElevatedButton(
                onPressed: () => context.setLocale(AppLocal.englishLocale),
                child: const Text('English')),
            ElevatedButton(
                onPressed: () => context.setLocale(AppLocal.hindiLocale),
                child: const Text('Hindi')),
            ElevatedButton(
              onPressed: () => context.setLocale(AppLocal.kannadaLocale),
              child: const Text('Kannada'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EasyHome()),
              ),
              child: const Text('To Home'),
            ),
          ],
        ),
      ),
    );
  }
}
