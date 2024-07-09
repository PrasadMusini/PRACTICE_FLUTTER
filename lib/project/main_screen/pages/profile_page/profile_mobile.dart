import 'package:flutter/material.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: const Text("Profile Collapsing Toolbar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: const Center(
          child: Text("Profile Page"),
        ),
      ),
    );

    // @override
    // Widget build(BuildContext context) {
    //   return const Scaffold(
    //     body: Center(
    //       child: Text('Profile Page'),
    //     ),
    //   );
    // }
  }
}
