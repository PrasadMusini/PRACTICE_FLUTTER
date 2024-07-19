import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_btn.dart';
import 'package:practice_flutter/project/common_utilities/styles.dart';
import 'package:practice_flutter/project/navigation/router.dart';
import 'package:practice_flutter/project/theme/them_provider.dart';
import 'package:practice_flutter/project/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class ProfileMobile extends StatefulWidget {
  const ProfileMobile({super.key});

  @override
  State<ProfileMobile> createState() => _ProfileMobileState();
}

class _ProfileMobileState extends State<ProfileMobile> {
  final ScrollController _scrollController = ScrollController();
  bool _showMoreIcon = false;
  bool _isSwitch = false;

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

    themeProvider.dispose();
    super.dispose();
  }

  late ThemeProvider themeProvider;
  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: const Color(0XFFf0f4f7),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) => CustomScrollView(
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
                title: header(themeProvider),
                background: Material(
                  color: themeProvider.isDarkTheme
                      ? selectedItemBg2
                      : selectedItemBgLight,
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
                    optionCard(
                      title: 'Change Theme',
                      trillingIcon: SizedBox(
                        width: 70,
                        height: 25,
                        child: Switch(
                          value: _isSwitch,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.white,
                          activeColor: Colors.grey.shade300,
                          activeTrackColor: Colors.grey,
                          onChanged: (bool value) {
                            // setState(() {
                            // _isSwitch = value;
                            // });
                            _isSwitch = !_isSwitch;
                            themeProvider.changeTheme();
                          },
                        ),
                      ),
                    ),
                    optionCard(
                        title: 'Edit Profile',
                        onTap: () {
                          context.goNamed(Routes.screenProfileOption.name,
                              pathParameters: {'title': 'Edit Profile'});
                        }),
                    optionCard(
                        title: 'How to order',
                        onTap: () {
                          context.goNamed(Routes.screenProfileOption.name,
                              pathParameters: {'title': 'How to order'});
                        }),
                    optionCard(
                        title: 'Terms & Conditions',
                        onTap: () {
                          context.goNamed(Routes.screenProfileOption.name,
                              pathParameters: {'title': 'Terms & Conditions'});
                        }),
                    const SizedBox(height: 10),
                    optionCard(
                        title: 'Cancel Orders and Policies',
                        onTap: () {
                          context.goNamed(Routes.screenProfileOption.name,
                              pathParameters: {
                                'title': 'Cancel Orders and Policies'
                              });
                        }),
                    optionCard(
                        title: 'About Us',
                        onTap: () {
                          context.goNamed(Routes.screenProfileOption.name,
                              pathParameters: {'title': 'About Us'});
                        }),
                    optionCard(
                        title: 'Contact Us',
                        onTap: () {
                          context.goNamed(Routes.screenProfileOption.name,
                              pathParameters: {'title': 'Contact Us'});
                        }),
                    const SizedBox(height: 150),
                    logoutBtn(),
                  ],
                ),
              ),
            ),
          ],
        ),
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

  GestureDetector optionCard({
    required String title,
    void Function()? onTap,
    Widget trillingIcon = const Icon(
      Icons.arrow_right_rounded,
      color: Colors.black,
    ),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: themeProvider.isDarkTheme ? primaryDark : primaryLight,
              border: Border(
                  bottom: BorderSide(
                      color: themeProvider.isDarkTheme
                          ? selectedItemBg1
                          : selectedItemBgLight))),
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(15, 15, 5, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.txStyF12FW3FFsCb.copyWith(
                  fontSize: 13,
                  color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
                ),
              ),
              trillingIcon,
            ],
          )),
    );
  }

  Widget header(ThemeProvider themeProvider) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor:
              themeProvider.isDarkTheme ? primaryLight : primaryDark,
          child: Text(
            'Z',
            style: TextStyle(
              color: themeProvider.isDarkTheme ? primaryDark : primaryLight,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Starting Title',
          style: TextStyle(
            color: themeProvider.isDarkTheme ? primaryLight : primaryDark,
          ),
        ),
        const Spacer(),
        if (_showMoreIcon) const Icon(Icons.more_vert),
        // SizedBox(width: 10),
      ],
    );
  }
}
