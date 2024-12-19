import 'package:flutter/material.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  void displayBottomSheet({required Widget child}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // height: 400,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 100,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: child,
              ),
              /* Expanded(
                child: child,
              ), */
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            searchAndFilter(),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 22,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        displayBottomSheet(
                          child: Container(
                            height: 200,
                            color: Colors.greenAccent,
                            child: const Center(
                              child: Text('Bottom Sheet'),
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                          Text('Name $index'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row searchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.search, color: Colors.grey.shade400),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
            onPressed: () {
              displayBottomSheet(
                child: Container(
                  height: 400,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('From filter'),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.filter)),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {},
      ),
      title: const Text('Title'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Expanded(
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.black26,
              title:
                  Text('This is very big text, displaying on listtile $index'),
              trailing: const Icon(Icons.chevron_right),
            );
          },
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Title'),
      actions: [
        IconButton(
          icon: const Icon(Icons.notification_important_rounded),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () {},
        ),
      ],
    );
  }
}
