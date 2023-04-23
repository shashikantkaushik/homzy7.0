import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


import 'package:flutter/gestures.dart';
import 'package:flutter_linkify/flutter_linkify.dart';


class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members Who Contirbuted',style: TextStyle(fontSize: 22,color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(

        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // Text('Homzy : Everything you need',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontFamily: ),textAlign: TextAlign.center,),
            // SizedBox(height: 16,),
            //
            // Text(' Service At Your Doorstep',style: TextStyle(color: Colors.grey.shade700,fontSize: 18),textAlign: TextAlign.center,),
            // SizedBox(height: 20,),
            // //Text('Its Not Just An Application but a vision to meet every customer',style: TextStyle(color: Colors.black,fontSize: 19),textAlign: TextAlign.center,),
            //buildProfileImage()
            SizedBox(height: 40,),

            Text('Mentor/Guide',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Row(
              children: [
                //SizedBox(width: 10,),
                buildProfileImage(),
                Text('  Dr. Suraj Srivastava',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
               
              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [

                  ],
                ),
                SizedBox(height: 2,),

                SizedBox(height: 2,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(

                          child: Icon(Icons.email,size: 25,color: Colors.red,)),
                       

                    ),
                    Text("surajsriengg@gmail.com")
                  ],
                ),

                SizedBox(height: 15,),
                Divider(height: 15,color: Colors.grey,thickness: 4,indent: 65.0,endIndent: 65.0,)
              ,  SizedBox(height: 15,),// buildSocioalIcon(FontAwesomeIcons.github),
                // SizedBox(width: 12,),
              ],
            ),
            SizedBox(height: 14,),
            Text('Team Workers',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Row(
              children: [
                buildProfileImage1(),
                Text('  Shashi Kant',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(FontAwesomeIcons.github,size: 25,color: Colors.black,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik"),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    buildSocioalIcon(FontAwesomeIcons.linkedin),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik"),
                  ],
                ),
                SizedBox(height: 2,),

                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(Icons.email,size: 25,color: Colors.red,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik4@gmail.com"),
                  ],
                ),
              ],
            ),

            SizedBox(height: 15,),
            Divider(height: 15,color: Colors.grey,thickness: 4,indent: 65.0,endIndent: 65.0,)
            ,SizedBox(height: 15,),
            Row(
              children: [
                buildProfileImage2(),
                Text('  Ankit Dhatterwal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(FontAwesomeIcons.github,size: 25,color: Colors.black,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik"),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    buildSocioalIcon(FontAwesomeIcons.linkedin),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik"),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(Icons.email,size: 25,color: Colors.red,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik4@gmail.com"),
                  ],
                ),
              ],
            ),


            SizedBox(height: 15,),
            Divider(height: 15,color: Colors.grey,thickness: 4,indent: 65.0,endIndent: 65.0,)
            ,SizedBox(height: 15,),
            Row(
              children: [

                buildProfileImage3(),
                Text('  Khushi Srivastava',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(FontAwesomeIcons.github,size: 25,color: Colors.black,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik"),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    buildSocioalIcon(FontAwesomeIcons.linkedin),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik"),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(Icons.email,size: 25,color: Colors.red,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik4@gmail.com"),
                  ],
                ),
              ],
            ),


            SizedBox(height: 15,),
            Divider(height: 15,color: Colors.grey,thickness: 4,indent: 65.0,endIndent: 65.0,)
            ,SizedBox(height: 15,),
            Row(
              children: [

                buildProfileImage4(),
                Text('  Apoorv Aggrwal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
              ],
            ),
            SizedBox(height: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(FontAwesomeIcons.github,size: 25,color: Colors.black,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik"),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    buildSocioalIcon(FontAwesomeIcons.linkedin),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik"),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(Icons.email,size: 25,color: Colors.red,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text("shashikantkaushik4@gmail.com"),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget buildProfileImage() => CircleAvatar(
    backgroundColor: Colors.grey.shade800,

    backgroundImage: AssetImage('assets/download.jpg'),
  );
  Widget buildProfileImage1() => CircleAvatar(
    backgroundColor: Colors.grey.shade800,

    backgroundImage: AssetImage('assets/shashi.jpg'),
  );
  Widget buildProfileImage2() => CircleAvatar(
    backgroundColor: Colors.grey.shade800,

    backgroundImage: AssetImage('assets/ankit.jpeg'),
  );
  Widget buildProfileImage3() => CircleAvatar(
    backgroundColor: Colors.grey.shade800,

    backgroundImage: AssetImage('assets/khushi.jpeg'),
  );
  Widget buildProfileImage4() => CircleAvatar(
    backgroundColor: Colors.grey.shade800,

    backgroundImage: AssetImage('assets/apoorv.jpg'),
  );
}
Widget buildSocioalIcon(IconData icon)=> CircleAvatar(
  //radius: 25,
  backgroundColor: Colors.white,
  child: Center(child: Icon(icon,size: 25,color: Colors.blue,),),
);

//
// class Hyperlink extends StatelessWidget {
//   //const Hyperlink({Key? key}) : super(key: key);
// final String text;
// Hyperlink(this.text);
//   //const Hyperlink({super.key, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return RichText(text: TextSpan(
//       text: text,
//       style: TextStyle(color:Colors.blue),
//       recognizer: TapGestureRecognizer()..onTap=(){
//         launch(text);
//       }
//     ),
//     );
//   }
// }
//
//
