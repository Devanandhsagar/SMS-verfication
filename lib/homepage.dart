import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController gmail = TextEditingController();
  String menuname="";
  String menugmail="";
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
              // currentAccountPicture: const FlutterLogo(),
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
                Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
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
            textInputAction: TextInputAction.none,
            onSubmitted: (_) => FocusScope.of(context).nextFocus(),
            decoration: const InputDecoration(border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
                labelText:"Enter your Full name"
            ),
          ),
          const SizedBox(height: 30,),
           TextField(
             controller: number,
             textInputAction: TextInputAction.none,
             onSubmitted: (_) => FocusScope.of(context).nextFocus(),
          decoration: const InputDecoration(border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
              labelText:"Enter your Phone Number"
          ),),
          const SizedBox(height: 30,),
           TextField(
             controller: gmail,
             textInputAction: TextInputAction.none,
             onSubmitted: (_) => FocusScope.of(context).nextFocus(),
          decoration: const InputDecoration(border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
          labelText:"Enter Your Gmail"
          ),),
        const SizedBox(height: 50,),
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(onPressed: () {
            setState(() {
              if (gmail.text=="" && name.text=="" && number.text==""){
                const Text('Enter your data properly');
              }
              menuname=name.text;
              menugmail=gmail.text;
            });
          },child: const Text('Save'),
          ),
        )]
      ),
    );
  }
}
