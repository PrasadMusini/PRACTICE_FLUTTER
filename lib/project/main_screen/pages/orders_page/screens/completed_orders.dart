// import 'package:flutter/material.dart';
// import 'package:practice_flutter/project/common_utilities/styles.dart';

// class CompletedOrders extends StatelessWidget {
//   const CompletedOrders({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Completed Orders',
//           style: Styles.txStyF12FWbFFsCb.copyWith(
//             fontSize: 22,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_flutter/project/main_screen/pages/orders_page/screens/status_item.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

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
              orderStatus: 'Completed',
            );
          },
        ),
      ),
    );
  }
}
