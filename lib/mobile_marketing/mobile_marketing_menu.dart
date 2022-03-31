import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/landing_page.dart';
import 'package:first_app/mobile_marketing/mobile_market_form1.dart';
import 'package:first_app/mobile_marketing/mobile_market_form2.dart';
import 'package:first_app/mobile_marketing/mobile_market_form3.dart';
import 'package:first_app/mobile_marketing/mobile_market_form4.dart';
import 'package:flutter/material.dart';

class MobileMarketing_Menu extends StatefulWidget {
  const MobileMarketing_Menu({Key? key}) : super(key: key);
  @override
  State<MobileMarketing_Menu> createState() => _MobileMarketing_MenuState();
}

class _MobileMarketing_MenuState extends State<MobileMarketing_Menu> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Press Logout Icon to Exit'),));
    return WillPopScope(
      onWillPop: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainMenu()),);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Mobile Marketing',style: TextStyle(fontSize: 20),),
          centerTitle: true,
          actions: [
            IconButton(
              icon:Icon(Icons.logout),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainMenu()),);
              },
            )
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: Image.asset('assets/logo.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Mobile Marketing Requirements',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.deepPurple),)),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text("TBA appreciates your onboarding with us. We need some requirements to create an effective app for your business.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
            // ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.deepPurple,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage('assets/logo2.png'),
                    fit: BoxFit.contain,
                  ),
                  // color: Colors.white
                ),
                accountName: Text("",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                accountEmail:Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Text(user.email!,style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w500),),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.qr_code_outlined,color: Colors.white,), title: Text("Mobile Market Form1",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const mobile_Form1()),);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.screen_rotation_outlined,color: Colors.white,), title: Text("Mobile Market Form2",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const mobile_Form2()),);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.book_outlined,color: Colors.white,), title: Text("Mobile Market Form3",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const mobile_Form3()),);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.assignment_outlined,color: Colors.white,), title: Text("Mobile Market Form4",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const mobile_Form4()),);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
