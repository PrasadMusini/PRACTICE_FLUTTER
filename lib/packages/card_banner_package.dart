import 'package:card_banner/card_banner.dart';
import 'package:flutter/material.dart';

class MyCardBanner extends StatelessWidget {
  const MyCardBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 222, 245),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: 8,
        itemBuilder: (context, index) {
          return CardBanner(
            text: "Best Seller",
            position: CardBannerPosition.TOPRIGHT,
            child: foodCard(),
          );
        },
      ),
    );
  }

  Card foodCard() {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Image.network(
          "https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
          height: 200,
          fit: BoxFit.cover,
        ),
        subtitle: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Nulla cillum qui elit adipisicing culpa ad laboris amet laboris velit. Pariatur sit tempor nostrud non duis commodo laboris. Consequat incididunt laborum qui dolore in velit consequat mollit amet. Proident eu et sint veniam sunt fugiat quis fugiat sunt pariatur do enim in.Qui proident veniam aute commodo consectetur id ipsum. Laborum occaecat enim cupidatat deserunt et reprehenderit tempor ipsum elit. Proident enim ullamco aliqua veniam cupidatat mollit voluptate dolore Lorem adipisicing velit. Culpa magna occaecat ipsum ea aliquip in quis sunt cillum ad deserunt nostrud ex non.",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
