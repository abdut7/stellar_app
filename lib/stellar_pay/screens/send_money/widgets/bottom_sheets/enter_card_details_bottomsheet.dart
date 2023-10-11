// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:stellar_chat/Settings/SColors.dart';
// void entercarddetailssheet( BuildContext context) {
//   showModalBottomSheet(
//     backgroundColor: Colors.white,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(15.0),
//       ),
//     ),
//     context: context,
//     builder: (BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 60,vertical: 5), child: Divider(thickness: 2,color: Color.fromRGBO(1, 97, 14, 1),),),
//             const SizedBox(height: 25,),
//             Text(
//               'Enter Card Details',
//               style: const TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w900, height: 0,),),
//             const SizedBox(height: 25,),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Name on the Card',
//                     style:  TextStyle(
//                       color: Color(0xFF1D1D1B),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextField(
//                     style:  TextStyle(
//                       color: Color(0xFF1D1D1B),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     cursorColor: Colors.black,
//                   ),
//                   SizedBox(height: 20,),
//                   Text(
//                     'Card Number',
//                     style:  TextStyle(
//                       color: Color(0xFF1D1D1B),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextField(
//                     cursorColor: Colors.black,
//                     style:  TextStyle(
//                       color: Color(0xFF1D1D1B),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20,),
//           ],
//         ),
//       );
//     },
//   );
// }
//
//
//
//
//
