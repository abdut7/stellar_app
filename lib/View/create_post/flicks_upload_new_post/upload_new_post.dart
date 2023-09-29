// import 'package:base_project/Settings/SColors.dart';
// import 'package:flutter/material.dart';
//
// class FlicksUploadNewPost extends StatefulWidget {
//   const FlicksUploadNewPost({Key? key}) : super(key: key);
//
//   @override
//   State<FlicksUploadNewPost> createState() => _FlicksUploadNewPostState();
// }
//
// class _FlicksUploadNewPostState extends State<FlicksUploadNewPost> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: SColors.color11,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {},
//         ),
//         title: Text(
//           'New Post',
//           style: TextStyle(color: SColors.color12),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Share',
//               style: TextStyle(
//                 color: SColors.color12,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   CircleAvatar(
//                     backgroundImage: NetworkImage('userProvider.getUser.photoUrl,'),
//                     radius: 30,
//                     backgroundColor: Colors.grey,
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.4,
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: TextField(
//                         decoration: const InputDecoration(
//                             hintText: "Type a caption", border: InputBorder.none),
//                         maxLines: 4,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 100.0,
//                     width: 100.0,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                           fit: BoxFit.fill,
//                           alignment: FractionalOffset.topCenter,
//                           image: NetworkImage("https://via.placeholder.com/82x82"),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Divider(thickness: 1,color: SColors.color9,),
//             ),
//             SizedBox(height: 8,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Add Location',
//                     style: TextStyle(fontSize: 16, color: Colors.black),
//                   ),
//                   Container(
//                     height: 30,
//                     decoration: ShapeDecoration(
//                       color: Color(0xFF9FC4E8),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                     ),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Text(
//                           'Dubai, United Arab Emrites',
//                           style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Divider(thickness: 1,color: SColors.color9,),
//             ),
//             SizedBox(height: 10,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Text(
//                 'Tag People',
//                 style: TextStyle(
//                   color: Color(0xFF00338E),
//                   fontSize: 12,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w400,
//                   height: 0,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,),
//             // Adding the ListView.builder for horizontal scrolling containers
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   children: List.generate(
//                     3, (index) {
//                       return Container(
//                         width: 112,
//                         height: 26,
//                         margin: EdgeInsets.all(8),
//                         decoration: ShapeDecoration(
//                           color: Color(0xFF9FC4E8),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(7),
//                           ),
//                         ),
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Text(
//                               'abdul',
//                               style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Divider(thickness: 1,color: SColors.color9,),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Add Music',
//                     style: TextStyle(
//                       color: Color(0xFF00338E),
//                       fontSize: 12,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Container(
//                     width: 104,
//                     height: 26,
//                     decoration: ShapeDecoration(
//                       color: Color(0xFF9FC4E8),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
//                     ),
//                     child:  Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Text(
//                           'Music , Artist',
//                           style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Divider(thickness: 1,color: SColors.color9,),
//             ),
//             SizedBox(height: 20,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Text(
//                 'Advance Setting',
//                 style: TextStyle(
//                   color: Color(0xFF00338E),
//                   fontSize: 12,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w400,
//                   height: 0,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Likes and Views',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w600,
//                       height: 0,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Nearby Visibility', style: TextStyle(color: SColors.color3, fontSize: 14, fontWeight: FontWeight.w500,),),
//                       IgnorePointer(ignoring: true,
//                         child: Switch(value: false, onChanged: (bool newValue) {}, activeColor: SColors.color11,),),
//                     ],
//                   ),
//                 ],
//
//               ),
//
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
