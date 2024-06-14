import 'package:flutter/material.dart';

class PopScopeWid extends StatelessWidget {
  const PopScopeWid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Page101(),
        '/page102': (context) => const Page102(),
        '/page103': (context) => const Page103(),
      },
    );
  }
}

class Page101 extends StatelessWidget {
  const Page101({super.key});

  @override
  Widget build(BuildContext context) {
    //! When user clicked on device back button instead of poping page, will get controll the navigation using PopScope
    //! make canPop false to prevent the back navigation and perform navigation in onPopInvoked
    //! onPopInvoked will get called when user clicked on device back button
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        print('xxx: PopScope called');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Page103()));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Page 101'),
        ),
        body: const Center(
          child: Text('Page 101'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/page102');
          },
          child: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}

class Page102 extends StatelessWidget {
  const Page102({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 102'),
      ),
      body: const Center(
        child: Text('Page 102'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/page103');
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class Page103 extends StatelessWidget {
  const Page103({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 103'),
      ),
      body: const Center(
        child: Text('Page 103'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
