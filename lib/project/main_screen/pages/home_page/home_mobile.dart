import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/project/common_utilities/common_widgets.dart/custom_btn.dart';
import 'package:practice_flutter/project/navigation/router.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //MARK: Header
                    header(),

                    const SizedBox(height: 15),
                    //MARK: Search bar
                    GestureDetector(
                        onTap: () {
                          print('search');
                          context.goNamed(Routes.screenSearch.name);
                        },
                        child: searchBar()),

                    const SizedBox(height: 15),

                    //MARK: Special offers
                    specialOffers(),

                    const SizedBox(height: 15),

                    //MARK: Most Orders
                    mostOrdered(),

                    const SizedBox(height: 15),
                    //MARK: Menu
                    menu(),
                  ],
                ),
              ),
              tellUs(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Row tellUs() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tell us what you are looking for!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                    'Lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dipiscing elit'),
                CustomBtn(
                  onPressed: () {
                    // GoRouter.of(context)
                    //     .pushReplacement('/new-screen');
                    // while (context.canPop()) {
                    //   context.pop();
                    // }

                    // while (GoRouter.of(context).canPop()) {
                    //   GoRouter.of(context).pop();
                    // }
                    // context.pushReplacement(Routes.testScreen.path);
                  },
                  backgroundColor: Colors.black,
                  radius: 12,
                  horizontalPadding: 20,
                  child: const Text('Tell us'),
                )
              ],
            ),
          ),
        ),
        const Expanded(
            flex: 2,
            child: Center(
              child: Icon(Icons.home),
            ))
      ],
    );
  }

  Column menu() {
    return Column(children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Menu Items'),
          Text('See all'),
        ],
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Container(
                  width: 145,
                  height: 160,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Stack(
                    children: [
                      Positioned(
                        top: 8,
                        right: 6,
                        child: Icon(Icons.favorite_border),
                      )
                    ],
                  ),
                ),
                const Column(
                  children: [
                    Text('Item Name'),
                    Text(
                      'description',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'description',
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_border_purple500_outlined,
                              size: 14,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          '10 - 15min',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    ]);
  }

  Column mostOrdered() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Most Ordered items'),
            Text('See all'),
          ],
        ),
        Container(
          height: 180,
          color: Colors.grey.shade200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                // padding: const EdgeInsets.symmetric(horizontal: 4),
                margin: const EdgeInsets.only(right: 8),
                width: 150,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Stack(
                        children: [
                          Positioned(
                            top: 8,
                            right: 6,
                            child: Icon(Icons.favorite_border),
                          )
                        ],
                      ),
                    ),
                    const Text('Item Name'),
                    const Text(
                      'description',
                      style: TextStyle(fontSize: 10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_border_purple500_outlined,
                              size: 14,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          '10 - 15min',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column specialOffers() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Special Offers'),
            Text('See all'),
          ],
        ),
        Container(
          width: double.infinity,
          height: 140,
          color: Colors.grey,
          alignment: AlignmentDirectional.bottomStart,
          child: const Text('Special deals'),

          // child: CarouselSlider(
          //   options: CarouselOptions(
          //     autoPlay: true,
          //     aspectRatio: 2.0,
          //     enlargeCenterPage: true,
          //   ),
          //   items: imageSliders,
          // ),
        ),
      ],
    );
  }

  Hero searchBar() {
    return Hero(
      tag: 'tag-search',
      child: Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.grey.shade100,
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: const Row(
          children: [
            Text('Search for '),
            // animatedSlideText(),
            Spacer(),
            Icon(Icons.search),
            VerticalDivider(),
            Icon(Icons.format_align_left_sharp),
          ],
        ),
      ),
    );
  }

  Expanded animatedSlideText() {
    return Expanded(
      child: AnimatedTextField(
        readOnly: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        animationType: Animationtype.slide,
        hintTexts: const [
          '"One"',
          '"Two"',
          '"Three"',
        ],
        hintTextStyle: const TextStyle(color: Colors.black),
      ),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: Image.asset(Assets.images.googleLogo.path),
            ),
            const SizedBox(width: 10),
            const Text('User Name'),
          ],
        ),
        const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Icon(Icons.card_travel_outlined),
            ),
            SizedBox(width: 20),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Icon(Icons.notifications_paused_sharp),
            ),
          ],
        ),
      ],
    );
  }
}


/*   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(
            onPressed: () {
              SharedPrefsHelper.setLoginStatus();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SigninMobile()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const Center(
        child: Text('Main Screen'),
      ),
    );
  } 
}*/
