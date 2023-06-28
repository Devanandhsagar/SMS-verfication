import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phonenuberlogin/profile.dart';
class Homepage extends StatefulWidget {
  String phoneid;
  Homepage({super.key, required this.phoneid});

  @override
  State<Homepage> createState() => _HomepageState(phoneid);
}

class _HomepageState extends State<Homepage> {
  String phoneid;
  _HomepageState(this.phoneid);
  String name="";
  String email="";
  String number="";
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(appBar: AppBar(title: const Text("Homepage")),
      body: Container(color: Colors.grey,
        child: Center(
          child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(phoneid).get(),
              builder: ((context,snapshot){
                if (snapshot.connectionState == ConnectionState.done){
                  Map<String, dynamic>data=snapshot.data!.data() as Map<String,dynamic>;
                  name=data['name'];
                  email=data['email'];
                  number=('+91 ${data['phone_number']}');
                   return TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => profilepage(calldataname:name,calldataemail:email, phone:number,),));
                  }, child: const Text('Profile data'),);
                  return Text('Welcome to ${data['name']}',style: const TextStyle(color: Colors.black87,),
                  );
                }
                return const Text('Loading');
              })
          ),
        ),
      ),
    );
  }
}
