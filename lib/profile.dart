import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class profilepage extends StatefulWidget {
  String phone;
  String calldataemail;
  String calldataname;
   profilepage({super.key, required this.phone,required this.calldataname,required this.calldataemail});
  @override
  State<profilepage> createState() => _profilepageState(phone,calldataname,calldataemail);
  }
class _profilepageState extends State<profilepage> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController gmail = TextEditingController();
  String menuname="";
  String menugmail="";
  String phone;
  String calldataname;
  String calldataemail;
  _profilepageState(this.phone,this.calldataname,this.calldataemail);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Login screen"),

     ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xff764abc)),
              accountName: Text(
                menuname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail:  Text(
                menugmail,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person_rounded,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, 'Login', (route) => false);
              },
            ),
          ],
        ),
      ),

      body:
      Column(
        children: [
          const SizedBox(height: 30,),
           TextField(
            controller:name,
            autofocus: true,
            onChanged: (text){
              name=calldataname as TextEditingController ;
            },
            textInputAction: TextInputAction.none,
            onSubmitted: (_) => FocusScope.of(context).nextFocus(),
            decoration: const InputDecoration(border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
                labelText:"Enter your Full name"
            ),
          ),
          const SizedBox(height: 30,),
           TextField(
             controller: number,
             onChanged: (text){
               name=phone as TextEditingController;
             },
             textInputAction: TextInputAction.none,
             onSubmitted: (_) => FocusScope.of(context).nextFocus(),
          decoration: const InputDecoration(border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
              labelText:"Enter your Phone Number"
          ),),
          const SizedBox(height: 30,),
           TextField(
             controller: gmail,
             onChanged: (text){
               name=calldataemail as TextEditingController;
             },
             textInputAction: TextInputAction.none,
             onSubmitted: (_) => FocusScope.of(context).nextFocus(),
          decoration: const InputDecoration(border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
          labelText:"Enter Your Gmail"
          ),),
        const SizedBox(height: 50,),
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(onPressed: () {
            CollectionReference collRef = FirebaseFirestore.instance.collection('users');
            collRef.doc(phone).set({
              'name':name.text,
              'email':gmail.text,
              'phone_number':number.text,
            });
            setState(() {
              menugmail=gmail.text;
              menuname=name.text;
              menuname=calldataname;
              menugmail=calldataemail;
            });
          },child: const Text('Save'),
          ),
        )]
      ),
    );
  }
}
