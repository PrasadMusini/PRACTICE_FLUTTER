import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

class Testscreen extends StatefulWidget {
  final int index;
  final int itemCount;
  const Testscreen({
    super.key,
    required this.index,
    required this.itemCount,
  });

  @override
  State<Testscreen> createState() => _Testscreen();
}

class _Testscreen extends State<Testscreen> {
  bool isInitialState = true;
  bool likeStatus = false;
  List<bool> likeStatusList = List<bool>.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 0.4255.sw,
              margin: const EdgeInsets.only(right: 20),
              color: Colors.grey.shade400,
              child: DisplayItem(
                isLiked: likeStatusList[index],
                onTap: (bool isLiked) async {
                  setState(() {
                    likeStatusList[index] = !isLiked;
                  });
                  return !isLiked;
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DisplayItem extends StatelessWidget {
  const DisplayItem({super.key, required this.isLiked, required this.onTap});

  final bool isLiked;
  final Future<bool?> Function(bool)? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 0.425.sw,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/dragon.png', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
              // Like button
              Positioned(
                top: 8,
                right: 5,
                child: LikeButton(
                  size: 30,
                  isLiked: isLiked,
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Color.fromARGB(255, 0, 154, 54),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.black,
                    );
                  },
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ),
        // Content box
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Item Name',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text(
                'salad',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'This is a description, ensuring optimal readability on various screen sizes.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star_border_purple500_outlined,
                          size: 14),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '10 - 15min',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
