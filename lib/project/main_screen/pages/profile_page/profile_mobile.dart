import 'package:flutter/material.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_btn.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';

class ProfileMobile extends StatefulWidget {
  const ProfileMobile({super.key});

  @override
  State<ProfileMobile> createState() => _ProfileMobileState();
}

class _ProfileMobileState extends State<ProfileMobile> {
  final ScrollController _scrollController = ScrollController();
  bool _showMoreIcon = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final offset = _scrollController.offset;
      final isCollapsed =
          offset > 80.0; // Assuming 200 - 40 (AppBar's min height)

      if (isCollapsed != _showMoreIcon) {
        setState(() {
          _showMoreIcon = isCollapsed;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf0f4f7),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 140.0,
            floating: false,
            pinned: true,
            excludeHeaderSemantics: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              title: header(),
              background: const Material(
                color: Colors.grey,
              ),
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: false,
            // hasScrollBody: false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  optionCard(title: 'Profile Page'),
                  optionCard(title: 'Profile Page'),
                  optionCard(title: 'Profile Page'),
                  optionCard(title: 'Profile Page'),
                  const SizedBox(height: 10),
                  optionCard(title: 'Profile Page'),
                  optionCard(title: 'Profile Page'),
                  optionCard(title: 'Profile Page'),
                  optionCard(title: 'Profile Page'),
                  const SizedBox(height: 10),
                  Container(height: 150, color: Colors.grey),
                  logoutBtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container logoutBtn() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomBtn(
                      onPressed: () {},
                      verticalPadding: 15,
                      borderColor: Colors.grey.shade700,
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: const Text(
                        'Logout',
                        style: Styles.txStyF12FWbFFpCb,
                      ))),
            ],
          ),
          Text(
            'version: 1.0',
            style: Styles.txStyF12FWbFFpCb.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
                fontSize: 10),
          ),
        ],
      ),
    );
  }

  Container optionCard({required String title}) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              color: Colors.grey.shade300,
            ))),
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(15, 15, 5, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const Icon(
              Icons.arrow_right_rounded, //arrow_forward_ios_rounded
              color: Colors.black,
            )
          ],
        ));
  }

  Widget header() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 14,
          backgroundColor: Colors.black,
          child: Text(
            'Z',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Starting Title',
          style: TextStyle(color: Colors.black),
        ),
        const Spacer(),
        if (_showMoreIcon) const Icon(Icons.more_vert),
        // SizedBox(width: 10),
      ],
    );
  }
}
