// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MyProducts extends StatefulWidget {
//   const MyProducts({super.key});

//   @override
//   State<MyProducts> createState() => _MyProductsState();
// }

// class _MyProductsState extends State<MyProducts> {

  
//   late Future<List<ProductList>> apiData;
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//         canPop: true,
//         onPopInvoked: (didPop) {},
//         child: Consumer(
//           builder: (context, viewCollectionProvider, _) => Scaffold(
//             appBar: _appBar(),
//             body: FutureBuilder(
//               future: apiData,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator.adaptive(),
//                   );
//                 } else if (snapshot.hasError) {
//                   return const Center(
//                     child: Text(
//                       'Collection is empty',
//                       // style: CommonStyles.txSty_12b_fb,
//                     ),
//                   );
//                 } else {
//                   if (snapshot.hasData) {
//                     // List<ListResult> data = snapshot.data!;
//                     List<type> data = ;
//                     return Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // search bar
//                           _searchBarAndFilter(),

//                           // list of cards
//                           if (viewCollectionProvider.providerData.isNotEmpty)
//                             Expanded(
//                               child: ListView.builder(
//                                 itemCount: data.length,
//                                 itemBuilder: ((context, index) {
//                                   return Product();
//                                 }),
//                               ),
//                             )
//                           // no results
//                           else
//                             const Expanded(
//                               child: SizedBox(
//                                 width: double.infinity,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.all(5.0),
//                                       child: Text(
//                                         'No collection found!',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     );
//                   } else {
//                     return const Center(
//                       child: Text(
//                         'No data available',
//                       ),
//                     );
//                   }
//                 }
//               },
//             ),
//           ),
//         ));
//   }

//   AppBar _appBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: const Color(0xFFf7ebff), // CommonUtils.primaryColor,
//       title: const Text(
//         'Products',
//         style: TextStyle(color: Colors.white, fontSize: 16.0),
//       ),
//       centerTitle: true,
//       leading: IconButton(
//         icon: const Icon(
//           Icons.arrow_back,
//           color: Color(0xFF662e91), // CommonUtils.primaryTextColor
//         ),
//         onPressed: () {},
//       ),
//       actions: const [
//         Padding(
//           padding: EdgeInsets.only(left: 20),
//           child: Icon(Icons.logout),
//         ),
//       ],
//     );
//   }

//   Widget _searchBarAndFilter() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: SizedBox(
//               height: 45,
//               child: TextField(
//                 // onChanged: (input) => filterRecordsBasedOnPartyName(input),
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.only(top: 5, left: 12),
//                   hintText: 'Collection Search',
//                   // hintStyle: CommonStyles.txSty_14bs_fb,
//                   suffixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(
//                         color: Color.fromARGB(96, 141, 140, 140)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide:
//                         const BorderSide(color: Color.fromARGB(95, 19, 19, 19)),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           GestureDetector(
//             onTap: () {
//               showModalBottomSheet(
//                 isScrollControlled: true,
//                 context: context,
//                 builder: (context) => Padding(
//                   padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).viewInsets.bottom,
//                   ),
//                   // child: const FilterBottomSheet(),
//                 ),
//               );
//             },
//             child: const SizedBox(
//               height: 45,
//               width: 45,
//               // decoration: viewProvider.filterStatus
//               //     ? CommonUtils.borderForAppliedFilter
//               //     : CommonUtils.borderForFilter,
//               child: Center(
//                 child: Icon(
//                   Icons.filter_alt_sharp,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
