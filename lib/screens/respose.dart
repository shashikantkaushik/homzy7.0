import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:homzy1/screens/respose.dart';
import 'package:flutter/material.dart';
import 'package:homzy1/auth.dart';
import 'package:homzy1/req_model.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RequestScreen extends StatefulWidget {
   RequestScreen({super.key, required int MyUID});
  @override
  State<RequestScreen> createState() => _RequestScreenState(

  );

}

class _RequestScreenState extends State<RequestScreen> {
  late FirebaseFirestore _firebaseFirestore;
  late Future<List<ReqModel>> _reqListFuture;

  @override

  void initState() {
    super.initState();
    _firebaseFirestore = FirebaseFirestore.instance;
  }
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: _firebaseFirestore.collection("request").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            List<ReqModel> reqList = [];
            for (final docSnapshot in snapshot.data!.docs) {
              final data = docSnapshot.data();
              if (data != null) {
                final reqModel = ReqModel.fromMap(data as Map<String, dynamic>);
                reqList.add(reqModel);
              }
            }
            return ListView.builder(
                itemCount: reqList.length,
                itemBuilder: (context, index) {
                  var len=reqList.length;
                  var userName=reqList[index].userName;
                  var userPhoneNumber=reqList[index].userPhoneNumber;
                  var userUid=reqList[index].userUid;
                  var work=reqList[index].work;
                  var reqPic=reqList[index].reqPic;
                  var address=reqList[index].address;
                  var createdAt=reqList[index].createdAt;
                  var pin=reqList[index].pin;
                  var desc=reqList[index].desc;
                  var userPic=reqList[index].userPic;
                  return Container(
                    width: double.infinity,
                    height: 1000,
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Text(

                            'Pending Requests: $len',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius
                                          .circular(10),
                                      color: Colors.blue,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                        reqList[index].userPic ?? 'https://example.com/default.jpg',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      '$userName',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 5),
                                                    Text(
                                                      '$work',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 10),
                                            // Add some space between the two columns
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .end,
                                              children: [
                                                Text(
                                                  'ETA',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    color: Colors
                                                        .white,
                                                  ),
                                                ),
                                                Text(
                                                  '12 min',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    color: Colors
                                                        .white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      'Service',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 5),
                                                    Text(
                                                      '$work' ?? "upload work",
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        color: Colors
                                                            .white,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 10),
                                            // Add some space between the two columns
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  'Price',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    fontSize: 17,
                                                    color: Colors
                                                        .white,
                                                  ),
                                                ),
                                                Text(
                                                  'Rs.500',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    fontSize: 19,
                                                    color: Colors
                                                        .white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: new Container(
                                                //    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                // color: Colors.red,
                                                height: 100,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    Icon(Icons
                                                        .location_on,
                                                        color: Colors
                                                            .white,
                                                        size: 30),
                                                    SizedBox(
                                                        width: 10),
                                                    Text(
                                                      '$address',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),


                                          ],

                                        ),
                                        Expanded(
                                          child: Container(
                                            // color: Colors.red,
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                Icon(Icons
                                                    .location_on,
                                                    color: Colors
                                                        .white,
                                                    size: 30),
                                                SizedBox(
                                                    width: 10),
                                                Text(
                                                  '$userPhoneNumber',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors
                                                        .white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                          Container(
                            child: Image.network(
                              reqList[index].reqPic ?? 'https://example.com/default.jpg',
                            ),
                          ),

                          Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(
                                                            10),
                                                        color: Colors
                                                            .grey,
                                                      ),
                                                      width: 150,
                                                      height: 50,
                                                      child: Center(
                                                        child: ElevatedButton(
                                                          onPressed: (){

                                                          },
                                                          child: Text(
                                                            'Decline',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                              color: Colors
                                                                  .white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 10),
                                            // Add some space between the two columns
                                            Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(10),
                                                    color: Colors
                                                        .green,
                                                  ),
                                                  width: 150,
                                                  height: 50,
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: (){
                                                        ap.move(reqList[index].userUid);
                                                        print(reqList[index].userUid);
                                                      },
                                                      child: Text(
                                                        'Accept',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight
                                                              .bold,
                                                          color: Colors
                                                              .white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16), // Add padding to the row
                                  ),

                                ),
                                SizedBox(height: 20),
                                // Expanded(
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius
                                //           .circular(10),
                                //       color: Colors.blue,
                                //     ),
                                //     child: Column(
                                //       children: [
                                //         Row(
                                //           mainAxisAlignment: MainAxisAlignment
                                //               .spaceBetween,
                                //           children: [
                                //             Row(
                                //               children: [
                                //                 Column(
                                //                   children: [
                                //                     CircleAvatar(
                                //                       backgroundImage: NetworkImage(
                                //                         'https://picsum.photos/200',
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //                 SizedBox(width: 10),
                                //                 Column(
                                //                   crossAxisAlignment: CrossAxisAlignment
                                //                       .start,
                                //                   children: [
                                //                     Text(
                                //                       'John Doe',
                                //                       style: TextStyle(
                                //                         fontWeight: FontWeight
                                //                             .bold,
                                //                         color: Colors
                                //                             .white,
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                         height: 5),
                                //                     Text(
                                //                       'Service Name',
                                //                       style: TextStyle(
                                //                         fontSize: 12,
                                //                         color: Colors
                                //                             .white,
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //             SizedBox(width: 10),
                                //             // Add some space between the two columns
                                //             Column(
                                //               crossAxisAlignment: CrossAxisAlignment
                                //                   .end,
                                //               children: [
                                //                 Text(
                                //                   'ETA',
                                //                   style: TextStyle(
                                //                     fontWeight: FontWeight
                                //                         .bold,
                                //                     color: Colors
                                //                         .white,
                                //                   ),
                                //                 ),
                                //                 Text(
                                //                   '12 min',
                                //                   style: TextStyle(
                                //                     fontWeight: FontWeight
                                //                         .bold,
                                //                     color: Colors
                                //                         .white,
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: 20,
                                //         ),
                                //         Row(
                                //           mainAxisAlignment: MainAxisAlignment
                                //               .spaceEvenly,
                                //           children: [
                                //             Row(
                                //               children: [
                                //                 Column(
                                //                   crossAxisAlignment: CrossAxisAlignment
                                //                       .start,
                                //                   children: [
                                //                     Text(
                                //                       'Service',
                                //                       style: TextStyle(
                                //                         fontSize: 17,
                                //                         // fontWeight: FontWeight.bold,
                                //                         color: Colors
                                //                             .white,
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                         height: 5),
                                //                     Text(
                                //                       'Ac Repair',
                                //                       style: TextStyle(
                                //                         fontSize: 19,
                                //                         color: Colors
                                //                             .white,
                                //                         fontWeight: FontWeight
                                //                             .bold,
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //             SizedBox(width: 10),
                                //             // Add some space between the two columns
                                //             Column(
                                //               crossAxisAlignment: CrossAxisAlignment
                                //                   .start,
                                //               children: [
                                //                 Text(
                                //                   'Price',
                                //                   style: TextStyle(
                                //                     fontWeight: FontWeight
                                //                         .bold,
                                //                     fontSize: 17,
                                //                     color: Colors
                                //                         .white,
                                //                   ),
                                //                 ),
                                //                 Text(
                                //                   'Rs.500',
                                //                   style: TextStyle(
                                //                     fontWeight: FontWeight
                                //                         .bold,
                                //                     fontSize: 19,
                                //                     color: Colors
                                //                         .white,
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: 20,
                                //         ),
                                //         Row(
                                //           mainAxisAlignment: MainAxisAlignment
                                //               .spaceEvenly,
                                //           children: [
                                //             Expanded(
                                //               child: new Container(
                                //                 //    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                                //                 child: Divider(
                                //                   color: Colors.black,
                                //                   height: 15,
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: 10,
                                //         ),
                                //         Row(
                                //           mainAxisAlignment: MainAxisAlignment
                                //               .spaceEvenly,
                                //           children: [
                                //             Expanded(
                                //               child: Container(
                                //                 // color: Colors.red,
                                //                 height: 100,
                                //                 child: Row(
                                //                   mainAxisAlignment: MainAxisAlignment
                                //                       .start,
                                //                   children: [
                                //                     Icon(Icons
                                //                         .location_on,
                                //                         color: Colors
                                //                             .white,
                                //                         size: 30),
                                //                     SizedBox(
                                //                         width: 10),
                                //                     Text(
                                //                       'Location',
                                //                       style: TextStyle(
                                //                         fontSize: 20,
                                //                         color: Colors
                                //                             .white,
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ),
                                //
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: 20,
                                //         ),
                                //         Row(
                                //           mainAxisAlignment: MainAxisAlignment
                                //               .spaceBetween,
                                //           children: [
                                //             Row(
                                //               children: [
                                //                 Column(
                                //                   children: [
                                //                     Container(
                                //                       decoration: BoxDecoration(
                                //                         borderRadius: BorderRadius
                                //                             .circular(
                                //                             10),
                                //                         color: Colors
                                //                             .grey,
                                //                       ),
                                //                       width: 150,
                                //                       height: 50,
                                //                       child: Center(
                                //                         child: Text(
                                //                           'Decline',
                                //                           style: TextStyle(
                                //                             fontSize: 20,
                                //                             fontWeight: FontWeight
                                //                                 .bold,
                                //                             color: Colors
                                //                                 .white,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     )
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //             SizedBox(width: 10),
                                //             // Add some space between the two columns
                                //             Column(
                                //               children: [
                                //                 Container(
                                //                   decoration: BoxDecoration(
                                //                     borderRadius: BorderRadius
                                //                         .circular(10),
                                //                     color: Colors
                                //                         .green,
                                //                   ),
                                //                   width: 150,
                                //                   height: 50,
                                //                   child: Center(
                                //                     child: Text(
                                //                       'Accept',
                                //                       style: TextStyle(
                                //                         fontSize: 20,
                                //                         fontWeight: FontWeight
                                //                             .bold,
                                //                         color: Colors
                                //                             .white,
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 )
                                //               ],
                                //             ),
                                //           ],
                                //         ),
                                //       ],
                                //     ),
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 16,
                                //         vertical: 16), // Add padding to the row
                                //   ),
                                //
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }


            );
          },
        )
    );
  }

        }


