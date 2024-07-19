import 'package:flutter/material.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/screens/status_item.dart';

class ActiveOrders extends StatelessWidget {
  const ActiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return StatusItem(
              index: index,
              itemCount: 10,
              orderStatus: 'Active',
            );
          },
        ),
      ),
    );
  }
}

// class StatusItem extends StatefulWidget {
//   final int index;
//   final int itemCount;
//   final String orderStatus;
//   const StatusItem({
//     super.key,
//     required this.index,
//     required this.itemCount,
//     required this.orderStatus,
//   });

//   @override
//   State<StatusItem> createState() => _StatusItemState();
// }

// class _StatusItemState extends State<StatusItem> {
//   bool isIntialState = true;
//   bool likeStatus = false;

//   Row cancelBtn() {
//     return Row(
//       children: [
//         Expanded(
//           child: CustomBtn(
//             onPressed: () {},
//             verticalPadding: 15,
//             // horizontalPadding: 30,
//             borderColor: Colors.grey.shade700,
//             radius: 8,
//             backgroundColor: Colors.white,
//             child: const Text(
//               'Cancel',
//               style: Styles.txStyF12FWbFFpCb,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Container completeBtn() {
//     return Container(
//       color: Colors.grey,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 30,
//       ),
//       alignment: Alignment.center,
//       child: Row(
//         children: [
//           Expanded(
//             child: CustomBtn(
//               onPressed: () {},
//               verticalPadding: 15,
//               horizontalPadding: 30,
//               borderColor: Colors.grey.shade700,
//               radius: 8,
//               backgroundColor: Colors.white,
//               child: const Text(
//                 'Re-Order',
//                 style: Styles.txStyF12FWbFFpCb,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: 10,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Container(
//                   // height: size.width * 0.5,
//                   height: 0.48.sw,
//                   // height: 0.5.sw,
//                   // padding: EdgeInsets.only(top: 0.02.sh),
//                   decoration: BoxDecoration(
//                     // color: Colors.grey.shade400,

//                     border: (widget.itemCount - 1) == widget.index
//                         ? null
//                         : Border(
//                             bottom: BorderSide(
//                               color: Colors.grey.withOpacity(0.3),
//                               width: 0.5,
//                             ),
//                           ),
//                   ),
//                   child: Stack(
//                     children: [
//                       Positioned.fill(
//                         child: Container(
//                           // padding: const EdgeInsets.symmetric(vertical: 20),
//                           padding: EdgeInsets.only(top: 0.02.sh),

//                           child: Row(
//                             children: [
//                               Container(
//                                 // width: size.width * 0.42,
//                                 width: 0.425.sw,
//                                 // height: size.width * 0.4,

//                                 height: 0.19.sh,
//                                 clipBehavior: Clip.antiAlias,
//                                 // padding: const EdgeInsets.symmetric(horizontal: 5),
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey.shade300,
//                                     borderRadius: BorderRadius.circular(16)),
//                                 child: Stack(
//                                   children: [
//                                     Positioned.fill(
//                                       child: Image.asset(
//                                         Assets.images.dragon.path,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     Positioned(
//                                       top: 10,
//                                       right: 8,
//                                       child: LikeBtn(
//                                         onTap: (bool isLiked) {
//                                           setState(() {
//                                             likeStatus = !likeStatus;
//                                           });
//                                           return Future.value(!isLiked);
//                                         },
//                                         likeBuilder: (isLiked) {
//                                           return Icon(
//                                             likeStatus
//                                                 ? Icons.favorite_rounded
//                                                 : Icons.favorite_border_rounded,
//                                             color: likeStatus
//                                                 ? Colors.red
//                                                 : Colors.black,
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 12)
//                                           .copyWith(left: 0.03.sw),
//                                   alignment: Alignment.topLeft,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'StatusItem Name',
//                                         style: Styles.txStyF12FWbFFpCb.copyWith(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       Text(
//                                         '\$123.00',
//                                         style: Styles.txStyF12FWbFFpCb.copyWith(
//                                             fontSize: 14.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                       const SizedBox(
//                                         height: 4,
//                                       ),
//                                       Text(
//                                         'This text exceeds the maximum number of lines. The text will be truncated, and an "Expand" button will appear, replacing the default "Read more" button. The text and "Expand" button are styled with a custom font size and color. The text is blue with a font size of 16.0, and the "Expand" button is red with a font size of some. The AnimatedReadMoreText widget is a Flutter package that provides a user-friendly and visually appealing way to present lengthy text content. It dynamically adapts text length based on a predefined maximum line count, ensuring optimal readability on various screen sizes.',
//                                         maxLines: 4,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: Styles.txStyF12FWbFFpCb.copyWith(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                           fontSize: 11.sp,
//                                         ),
//                                       ),
//                                       const Spacer(),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons
//                                                     .star_border_purple500_outlined,
//                                                 size: 14,
//                                               ),
//                                               Text(
//                                                 '4.5',
//                                                 style: Styles.txStyF12FWbFFpCb
//                                                     .copyWith(
//                                                   fontWeight: FontWeight.normal,
//                                                   color: Colors.black,
//                                                   fontSize: 10.sp,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Text(
//                                             '10 - 15min',
//                                             style: Styles.txStyF12FWbFFpCb
//                                                 .copyWith(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10.sp,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 if (widget.orderStatus.toLowerCase() == 'active') ...[
//                   cancelBtn(),
//                 ] else ...[
//                   completeBtn(),
//                 ],
//                 const SizedBox(height: 15),
//                 if ((widget.itemCount - 1) == widget.index)
//                   const SizedBox()
//                 else
//                   Divider(
//                     color: Colors.grey.withOpacity(0.3),
//                     height: 0.5,
//                   ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
