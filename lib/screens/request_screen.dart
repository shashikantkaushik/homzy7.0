import 'package:flutter/material.dart';
import 'package:homzy1/screens/homeScreen.dart';
import 'package:homzy1/screens/respose.dart';
import 'package:flutter/material.dart';
import 'package:homzy1/auth.dart';
import 'package:homzy1/req_model.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceRequest extends StatefulWidget {
  @override
  _ServiceRequestState createState() => _ServiceRequestState();
}

class _ServiceRequestState extends State<ServiceRequest> {
  late FirebaseFirestore _firebaseFirestore;

  @override
  void initState() {
    super.initState();
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {

    final ap = Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),

        title: Text('Service Requests'),

      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _firebaseFirestore.collection("request").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          print("sdg23hfd");
          List<ReqModel> reqList = [];
          for (final docSnapshot in snapshot.data!.docs) {
            print("s34dghfd");
            final data = docSnapshot.data();
            if (data != null) {
              final reqModel = ReqModel.fromMap(data as Map<String, dynamic>);
              reqList.add(reqModel);
            }
          }

          return ListView.builder(
            itemCount: reqList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RequestScreen(MyUID:index)),
                  );
                },
                child: ListTile(
                  title: Text(reqList[index].work),
                  subtitle: Text(reqList[index].desc),
                  trailing: Icon(Icons.arrow_forward),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
