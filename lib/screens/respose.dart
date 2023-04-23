import 'package:flutter/material.dart';
import 'package:homzy1/auth.dart';
import 'package:homzy1/req_model.dart';
import 'package:homzy1/booked_model.dart';
import 'package:homzy1/screens/homeScreen.dart';
import 'package:homzy1/user_model.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RequestScreen extends StatefulWidget {
  final int MyUID;
  const RequestScreen({super.key, required this.MyUID});

  @override
  State<RequestScreen> createState() =>
      _RequestScreenState(

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

                itemCount: 1,
                itemBuilder: (context, index) {
                  var len=reqList.length;

                  var userName = reqList[widget.MyUID].userName;

                  var userPhoneNumber=reqList[widget.MyUID].userPhoneNumber;
                  var userUid=reqList[widget.MyUID].userUid;
                  var work=reqList[widget.MyUID].work;
                  var reqPic=reqList[widget.MyUID].reqPic;
                  var address=reqList[widget.MyUID].address;
                  var createdAt=reqList[widget.MyUID].createdAt;
                  var pin=reqList[widget.MyUID].pin;
                  var desc=reqList[widget.MyUID].desc;
                  var userPic=reqList[widget.MyUID].userPic;
                  return SingleChildScrollView(
                //    shrinkWrap:true,
                  child:    Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children:[
                                                    CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                        '$userPic',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '$userName',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'Service Name',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 10), // Add some space between the two columns
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'ETA',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  '12 min',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
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
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Service',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'Ac Repair',
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 10), // Add some space between the two columns
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Price',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  'Rs.500',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 100,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.location_on, color: Colors.greenAccent, size: 30),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      '$address',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                    margin: EdgeInsets.all(10),// Add padding to the row
                                  ),

                                ),
                              ],
                            ),
                          ),
                          // Divider(
                          //   color: Colors.grey,
                          //   thickness: 2.0,
                          // ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.0), // add padding to the container
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,// align widgets to the left
                              children: [ // add some spacing between widgets
                                Text(
                                  '$desc', // add the description
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Slow or clogged drains occur when something blocks the drain partially or completely. In sinks and showers, hair is often the culprit, but other items, such as a shampoo lid or small toy, may enter the drain and block the pipe. In toilets, the problem often comes when something other than dissolvable waste enters the toilet and gets flushed. Those solid items cannot move through the pipe, so they stay put, making it difficult or impossible for water to flow past the blockage and down the pipes.',style: TextStyle(color: Colors.black),
                              softWrap: true,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Container(
                            height: 300,
                           padding: EdgeInsets.all(16),
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage('$reqPic'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    scrollDirection: Axis.vertical,
                      // Image.asset(
                      //   'assets/images.jpeg',
                      //   height: 400,
                      //   width: double.infinity,
                      //   fit: BoxFit.contain,
                      // ),
                  );
                }


            );
          },
        ),
        persistentFooterButtons: [
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
    );
    },
    child: Text('Back', style: TextStyle(color: Colors.black),),
    style: ElevatedButton.styleFrom(
    minimumSize: Size(140, 50),
    backgroundColor: Colors.grey,
    ),
    ),
    ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
    );
    },
    child: Text('Accept', style: TextStyle(color: Colors.black),),
    style: ElevatedButton.styleFrom(
    minimumSize: Size(140, 50),
    backgroundColor: Colors.green,
    ),
    ),
    ],
    ),
    ),
    ],
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
