// import 'package:flutter/material.dart';
// import 'package:homzy1/auth.dart';
// import 'package:homzy1/req_model.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:homzy1/screens/reqList.dart';
// import 'package:homzy1/screens/register.dart';
// import 'package:homzy1/widget/button.dart';
//
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
//
// import 'package:homzy1/req_model.dart';
// import 'package:homzy1/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:homzy1/user_model.dart';
//
// import 'package:homzy1/screens/otp_screen.dart';
// import 'package:homzy1/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'package:flutter/material.dart';
// class ReqList extends StatefulWidget {
//   @override
//   _ReqListState createState() => _ReqListState();
// }
//
// class _ReqListState extends State<ReqList> {
//   late Future<List<ReqModel>> _reqListFuture;
//   late FirebaseFirestore _firebaseFirestore;
//
//   @override
//   void initState() {
//     super.initState();
//     _firebaseFirestore = FirebaseFirestore.instance;
//     _reqListFuture = getReqListFromFirestore();
//   }
//
//   Future<List<ReqModel>> getReqListFromFirestore() async {
//     final querySnapshot = await _firebaseFirestore.collection("request").get();
//
//     final List<ReqModel> reqList = [];
//     for (final docSnapshot in querySnapshot.docs) {
//       final reqModel = ReqModel.fromMap(docSnapshot.data());
//       reqList.add(reqModel);
//       print(reqModel.name);
//       print("reqModel.name");
//     }
//
//     return reqList;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final ap = Provider.of<AuthProvider>(context,listen: false);
//     return FutureBuilder<List<ReqModel>>(
//       future: _reqListFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         if (snapshot.hasError) {
//           print(snapshot.error);
//           return Center(child: Text("Error: ${snapshot.error}"));
//         }
//
//         List<ReqModel> reqList = snapshot.data!;
//         return Scaffold(
//           body: ListView.builder(
//             itemCount: reqList.length,
//             itemBuilder: (context, index) {
//               final reqModel = reqList[index];
//               return
//
//
//
//                 ListTile(
//
//
//
//
//                 title: Text(reqModel.name),
//                 subtitle: Text(reqModel.desc),
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(reqModel.reqPic ?? "https://example.com/default-image.jpg"),
//                   ),
//
//
//                   onTap: () {
//             ap.move(reqModel.uid);
//               print(reqModel.uid);
//             Navigator.of(context).pop();
//               // setState(() {
//               //   ReqList();
//               // });
//                 },
//               );
//
//
//
//
//
//
//             },
//           ),
//         );
//
//
//         // return ListView.builder(
//         //   itemCount: reqList.length,
//         //   itemBuilder: (context, index) {
//         //     final reqModel = reqList[index];
//         //     return ListTile(
//         //
//         //       title: Text(reqModel.name),
//         //
//         //       subtitle: Text(reqModel.bio),
//         //       onTap: () {
//         //         // do something when the list item is tapped
//         //       },
//         //     );
//         //   },
//         // );
//       },
//     );
//
// }
//
//
//
// }
//
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});
// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
// //
// //   @override
// //
// //   Widget build(BuildContext context) {
// //     final ap = Provider.of<AuthProvider>(context,listen: false);
// //     ap.getReqListFromFirestore();
// //     final name=(ap.userModel.name);
// //     final email=(ap.userModel.email);
// //     final bio=(ap.userModel.bio);
// //     final phone=(ap.userModel.phoneNumber);
// //     final pic=(ap.userModel.profilePic);
// //     final uid=(ap.userModel.uid);
// //     final date=(ap.userModel.createdAt);
// //
// //   return FutureBuilder<List<ReqModel>>(
// //     future: _reqListFuture,
// //     builder: (context, snapshot) {
// //       if (snapshot.connectionState == ConnectionState.waiting) {
// //         return Center(child: CircularProgressIndicator());
// //       }
// //
// //       if (snapshot.hasError) {
// //         return Center(child: Text("Error: ${snapshot.error}"));
// //       }
// //
// //       List<ReqModel> reqList = snapshot.data!;
// //
// //       return ListView.builder(
// //         itemCount: reqList.length,
// //         itemBuilder: (context, index) {
// //           final reqModel = reqList[index];
// //           return ListTile(
// //             title: Text(reqModel.name),
// //             subtitle: Text(reqModel.bio),
// //             leading: CircleAvatar(
// //               backgroundImage: NetworkImage(reqModel.reqPic),
// //             ),
// //             onTap: () {
// //               // do something when the list item is tapped
// //             },
// //           );
// //         },
// //       );
// //     },
// //   );
// //   }
// // }
// // // //     MaterialApp(
// // // //       title: 'Scrollable Horizontal Containers Example',
// // // //       home: Scaffold(
// // // //         appBar: AppBar(
// // // //           title: Text('Scrollable Horizontal Containers'),
// // // //         ),
// // // //         body: Padding(
// // // //           padding: EdgeInsets.only(top: 20.0),
// // // //           child: SafeArea(
// // // //             child: SingleChildScrollView(
// // // //               child: Column(
// // // //                 children: [
// // // //                   for i in name:
// // // //                   NewWidget(name: name),
// // // //                   // SizedBox(
// // // //                   //   height: 20,
// // // //                   // ),
// // // //                   // Container(
// // // //                   //   height: 150,
// // // //                   //   color: Colors.yellow,
// // // //                   //   padding: EdgeInsets.all(10),
// // // //                   //   child: Column(
// // // //                   //     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   //     children: [
// // // //                   //       Flexible(
// // // //                   //         flex: 1,
// // // //                   //         child: Row(
// // // //                   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   //           children: [
// // // //                   //             Expanded(
// // // //                   //               child: Text(
// // // //                   //                 name,
// // // //                   //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //               ),
// // // //                   //             ),
// // // //                   //             SizedBox(width: 100),
// // // //                   //             Text(
// // // //                   //               'Time :: 11 : 20 ',
// // // //                   //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //             ),
// // // //                   //           ],
// // // //                   //         ),
// // // //                   //       ),
// // // //                   //       SizedBox(height: 50),
// // // //                   //       Row(
// // // //                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   //         children: [
// // // //                   //           Expanded(
// // // //                   //             child: Text(
// // // //                   //              uid,
// // // //                   //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //             ),
// // // //                   //           ),
// // // //                   //           SizedBox(
// // // //                   //             width: 100,
// // // //                   //           ),
// // // //                   //           Text(
// // // //                   //             bio,
// // // //                   //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //           ),
// // // //                   //         ],
// // // //                   //       ),
// // // //                   //     ],
// // // //                   //   ),
// // // //                   // ),
// // // //                   // SizedBox(
// // // //                   //   height: 20,
// // // //                   // ),
// // // //                   // Container(
// // // //                   //   height: 150,
// // // //                   //   color: Colors.yellow,
// // // //                   //   padding: EdgeInsets.all(10),
// // // //                   //   child: Column(
// // // //                   //     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   //     children: [
// // // //                   //       Flexible(
// // // //                   //         flex: 1,
// // // //                   //         child: Row(
// // // //                   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   //           children: [
// // // //                   //             Expanded(
// // // //                   //               child: Text(
// // // //                   //                 'NAMe :::: adskjhdkjfhadsgdjkhahdgdghudfgdhjkgdshgdfydbhbdjhfgaueghdfkasdfghdkhdg',
// // // //                   //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //               ),
// // // //                   //             ),
// // // //                   //             SizedBox(width: 100),
// // // //                   //             Text(
// // // //                   //               'Time :: 11 : 20 ',
// // // //                   //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //             ),
// // // //                   //           ],
// // // //                   //         ),
// // // //                   //       ),
// // // //                   //       SizedBox(height: 50),
// // // //                   //       Row(
// // // //                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   //         children: [
// // // //                   //           Expanded(
// // // //                   //             child: Text(
// // // //                   //               'Address :: i am fron the hisar Haryana ',
// // // //                   //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //             ),
// // // //                   //           ),
// // // //                   //           SizedBox(
// // // //                   //             width: 100,
// // // //                   //           ),
// // // //                   //           Text(
// // // //                   //             'Price ::: 250',
// // // //                   //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //           ),
// // // //                   //         ],
// // // //                   //       ),
// // // //                   //     ],
// // // //                   //   ),
// // // //                   // ),
// // // //                   // SizedBox(
// // // //                   //   height: 20,
// // // //                   // ),
// // // //                   // Container(
// // // //                   //   height: 150,
// // // //                   //   color: Colors.yellow,
// // // //                   //   padding: EdgeInsets.all(10),
// // // //                   //   child: Column(
// // // //                   //     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   //     children: [
// // // //                   //       Flexible(
// // // //                   //         flex: 1,
// // // //                   //         child: Row(
// // // //                   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   //           children: [
// // // //                   //             Expanded(
// // // //                   //               child: Text(
// // // //                   //                 'NAMe :::: adskjhdkjfhadsgdjkhahdgdghudfgdhjkgdshgdfydbhbdjhfgaueghdfkasdfghdkhdg',
// // // //                   //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //               ),
// // // //                   //             ),
// // // //                   //             SizedBox(width: 100),
// // // //                   //             Text(
// // // //                   //               'Time :: 11 : 20 ',
// // // //                   //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //             ),
// // // //                   //           ],
// // // //                   //         ),
// // // //                   //       ),
// // // //                   //       SizedBox(height: 50),
// // // //                   //       Row(
// // // //                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   //         children: [
// // // //                   //           Expanded(
// // // //                   //             child: Text(
// // // //                   //               'Address :: i am fron the hisar Haryana ',
// // // //                   //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //             ),
// // // //                   //           ),
// // // //                   //           SizedBox(
// // // //                   //             width: 100,
// // // //                   //           ),
// // // //                   //           Text(
// // // //                   //             'Price ::: 250',
// // // //                   //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                   //           ),
// // // //                       //    ],
// // // //                     //    ),
// // // //                       //],
// // // //                   //  ),
// // // //                 //  ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // // class NewWidget extends StatelessWidget {
// // //   const NewWidget({
// // //     Key? key,
// // //     required this.name,
// // //   }) : super(key: key);
// // //
// // //   final String name;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       height: 150,
// // //       color: Colors.yellow,
// // //       padding: EdgeInsets.all(10),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Flexible(
// // //             flex: 1,
// // //             child: Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 Expanded(
// // //                   child: Text(
// // //                     name,
// // //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                   ),
// // //                 ),
// // //                 SizedBox(width: 100),
// // //                 Text(
// // //                   name,
// // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           SizedBox(height: 50),
// // //           Row(
// // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //             children: [
// // //               Expanded(
// // //                 child: Text(
// // //                   name,
// // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                 ),
// // //               ),
// // //               SizedBox(
// // //                 width: 100,
// // //               ),
// // //               Text(
// // //                 'Price ::: 250',
// // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// // // // body: Padding(
// // // //   padding: EdgeInsets.only(top: 20.0),
// // // //   child: SafeArea(
// // // //     child: SingleChildScrollView(
// // // //       child: Column(
// // // //         children: [
// // // //           Container(
// // // //             height: 150,
// // // //             color: Colors.yellow,
// // // //             padding: EdgeInsets.all(10),
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 Flexible(
// // // //                   flex : 1,
// // // //                   child: Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                     children: [
// // // //                       Text(
// // // //                         'Name',
// // // //                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                       ),
// // // //                       Text(
// // // //                         'Time',
// // // //                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //                 //   SizedBox(height: 10),
// // // //                 // Text(
// // // //                 //   'Address',
// // // //                 //   style: TextStyle(fontSize: 16),
// // // //                 // ),
// // // //                 SizedBox(height: 50),
// // // //
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       'Address',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                     Text(
// // // //                       'Price',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //     SizedBox(
// // // //       height: 20,
// // // //     ),
// // // //
// // // //     Container(
// // // //       height: 150,
// // // //       color: Colors.yellow,
// // // //       padding: EdgeInsets.all(10),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Row(
// // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //             children: [
// // // //               Text(
// // // //                 'Name',
// // // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //               ),
// // // //               Text(
// // // //                 'Time',
// // // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //        //   SizedBox(height: 10),
// // // //           // Text(
// // // //           //   'Address',
// // // //           //   style: TextStyle(fontSize: 16),
// // // //           // ),
// // // //           SizedBox(height: 50),
// // // //
// // // //           Row(
// // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //             children: [
// // // //               Text(
// // // //                 'Address',
// // // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //               ),
// // // //               Text(
// // // //                 'Price',
// // // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     ),
// // // //           SizedBox(
// // // //             height: 20,
// // // //           ),
// // // //           Container(
// // // //             height: 150,
// // // //             color: Colors.yellow,
// // // //             padding: EdgeInsets.all(10),
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       'Name',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                     Text(
// // // //                       'Time',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 //   SizedBox(height: 10),
// // // //                 // Text(
// // // //                 //   'Address',
// // // //                 //   style: TextStyle(fontSize: 16),
// // // //                 // ),
// // // //                 SizedBox(height: 50),
// // // //
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       'Address',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                     Text(
// // // //                       'Price',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //           SizedBox(
// // // //             height: 20,
// // // //           ),
// // // //
// // // //           Container(
// // // //             height: 150,
// // // //             color: Colors.yellow,
// // // //             padding: EdgeInsets.all(10),
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       'Name',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                     Text(
// // // //                       'Time',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 //   SizedBox(height: 10),
// // // //                 // Text(
// // // //                 //   'Address',
// // // //                 //   style: TextStyle(fontSize: 16),
// // // //                 // ),
// // // //                 SizedBox(height: 50),
// // // //
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       'Address',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                     Text(
// // // //                       'Price',
// // // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //
// // //           SizedBox(
// // //             height: 20,
// // //           ),
// // //
// // //           Container(
// // //             height: 150,
// // //             color: Colors.yellow,
// // //             padding: EdgeInsets.all(10),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Text(
// // //                       'Name',
// // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                     ),
// // //                     Text(
// // //                       'Time',
// // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 //   SizedBox(height: 10),
// // //                 // Text(
// // //                 //   'Address',
// // //                 //   style: TextStyle(fontSize: 16),
// // //                 // ),
// // //                 SizedBox(height: 50),
// // //
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Text(
// // //                       'Address',
// // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                     ),
// // //                     Text(
// // //                       'Price',
// // //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //     ],
// // //       ),
// // // //
// // // //     ),
// // // //   ),
// // // // ),
