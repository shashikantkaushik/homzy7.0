import 'package:flutter/material.dart';
import 'package:homzy1/auth.dart';
import 'package:homzy1/req_model.dart';
import 'package:homzy1/booked_model.dart';
import 'package:homzy1/user_model.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RequestScreen extends StatefulWidget {
   const RequestScreen({super.key, required int MyUID});
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
  @override
  Widget build(BuildContext context) {

    final ap = Provider.of<AuthProvider>(context, listen: false);
    // void saveBookReq({
    //   required BuildContext context,
    //   required BookModel bookModel,
    //   required Function onSuccess,
    // }) async {
    //   _isLoading = true;
    //   notifyListeners();
    //   try {


    //     bookModel.acceptedAt = DateTime.now().millisecondsSinceEpoch.toString();
    //     bookModel.proPhoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
    //     bookModel.proUid = _firebaseAuth.currentUser!.phoneNumber!;
    //     bookModel.upi=ap.userModel.upi;
    //     bookModel.proPic=ap.userModel.profilePic;
    //     bookModel.userUid=ap.reqModel.userUid;
    //     bookModel.userName=ap.reqModel.userName;
    //     bookModel.userPhoneNumber=ap.reqModel.userPhoneNumber;
    //     bookModel.createdAt=ap.reqModel.createdAt;
    //     bookModel.reqPic=ap.reqModel.reqPic!;
    //     bookModel.desc=ap.reqModel.desc;
    //     _bookModel = bookModel;
    //
    //     // uploading to database
    //     await _firebaseFirestore
    //         .collection("book")
    //         .doc(_uid)
    //         .set(reqModel.toMap())
    //         .then((value) {
    //       onSuccess();
    //       _isLoading = false;
    //       notifyListeners();
    //     });
    //   } on FirebaseAuthException catch (e) {
    //     showSnackBar(context, e.message.toString());
    //     _isLoading = false;
    //     notifyListeners();
    //   }
    // }



    // final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: _firebaseFirestore.collection("request").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            List<ReqModel> reqList = [];
            for (final docSnapshot in snapshot.data!.docs) {
              final data = docSnapshot.data();
              final reqModel = ReqModel.fromMap(data);
              reqList.add(reqModel);
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
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Text(

                            'Pending Requests: $len',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16),
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
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      userName,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        height: 5),
                                                    Text(
                                                      work,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 10),
                                            // Add some space between the two columns
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .end,
                                              children: const [
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
                                        const SizedBox(
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
                                                    const Text(
                                                      'Service',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        height: 5),
                                                    Text(
                                                      work ?? "upload work",
                                                      style: const TextStyle(
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
                                            const SizedBox(width: 10),
                                            // Add some space between the two columns
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: const [
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
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                //    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                                                child: const Divider(
                                                  color: Colors.black,
                                                  height: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                // color: Colors.red,
                                                height: 100,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    const Icon(Icons
                                                        .location_on,
                                                        color: Colors
                                                            .white,
                                                        size: 30),
                                                    const SizedBox(
                                                        width: 10),
                                                    Text(
                                                      address,
                                                      style: const TextStyle(
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
                                          child: SizedBox(
                                            // color: Colors.red,
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                const Icon(Icons
                                                    .location_on,
                                                    color: Colors
                                                        .white,
                                                    size: 30),
                                                const SizedBox(
                                                    width: 10),
                                                Text(
                                                  userPhoneNumber,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors
                                                        .white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
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
                                                          child: const Text(
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
                                            const SizedBox(width: 10),
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
                                                        print("call");
                                                        storeData(userPic: userPic,userName: userName,userPhoneNumber: userPhoneNumber,userUid: userUid,createdAt: createdAt,desc: desc,reqPic: reqPic);
                                                        print("end");
                                                       // ap.move(reqList[index].userUid);
                                                        print(reqList[index].userUid);
                                                      },
                                                      child: const Text(
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
                                    ), // Add padding to the row
                                  ),

                                ),
                                const SizedBox(height: 20),
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

  void storeData({
  required userPic,
    required userUid,
    required userName,
    required userPhoneNumber,
    required createdAt,
    required reqPic,
    required desc
}) async {
    print("call1");
    final ap = Provider.of<AuthProvider>(context, listen: false);
    print("call11");
    BookModel bookModel = BookModel(

      proPhoneNumber: ap.userModel.phoneNumber,
      proUid: ap.userModel.uid,
      upi: ap.userModel.upi,
      userPic: userPic,
      proPic: ap.userModel.profilePic,
      userUid: userUid,
      userName: userName,
      proName: ap.userModel.name,
      userPhoneNumber: userPhoneNumber,
      createdAt: createdAt,
      reqPic: reqPic,
      desc: desc,
      acceptedAt: '',
    );
    print("call13");
    ap.saveBookReq(

      context: context,
      bookModel: bookModel,
      onSuccess: () {
        print("success book");
      },
    );
  }

}








