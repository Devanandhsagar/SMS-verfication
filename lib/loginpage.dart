import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  String verification="";
  bool otpcodevisiable=false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30,),
          TextField(
            controller: phoneController,
            autofocus: true,
            decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
                labelText: "Enter Phone Number" ,
                labelStyle: TextStyle(color: Colors.grey)),
          ),
          const SizedBox(height: 30,),
           Visibility(
             visible: otpcodevisiable,
             child: TextField(
               controller: otpController,
               autofocus: true,
              decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
                  labelText: "Enter your OTP Code" ,
                  labelStyle: TextStyle(color: Colors.grey)),
          ),
           ),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            if(otpcodevisiable){
              verifylogin();
            }
            else{
              verifynumber();
            }
          },
              child: Text(otpcodevisiable ? "login" : "Verify"))
        ],
      ),
    );
  }
  void verifynumber(){
     auth.verifyPhoneNumber(phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async{
       await auth.signInWithCredential(credential).then((value){
         if (kDebugMode) {
           print("you are logged in successfully");
         }
       });
        },
        verificationFailed:(FirebaseAuthException exception){
      if (kDebugMode) {
        print(exception.message);
      }
    },
        codeSent: (String verificationID,int? resendToken){
        verification=verificationID;
        otpcodevisiable=true;
        setState(() {

        });
        },
        codeAutoRetrievalTimeout: (String verificationID){

        });
  }

  Future<void> verifylogin() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verification, smsCode: otpController.text);
    await auth.signInWithCredential(credential).then((value) {
      Navigator.pushNamedAndRemoveUntil(context,'home', (route) => false);
    });
  }
 }