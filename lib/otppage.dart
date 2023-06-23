import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController a = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    String number="";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios,
          color: Colors.black,), onPressed: () { Navigator.pop(context); },),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
          Container(margin: const EdgeInsets.all(20),
            child: TextField(
              controller: a,
              textAlign: TextAlign.center,
              // onChanged: (item),
              // number=item,
              decoration:  const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
                  labelText: "Phone Number" ,
                  labelStyle: TextStyle(color: Colors.black)),
            ),
          ),
          const SizedBox(height: 30,
          ),
          Pinput(
            validator: (s) {
              return s == '2222' ? null : 'Pin is incorrect';
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),

          const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){

          }, child: const Text("Login"))
        ],
      ),
    );
  }
}
