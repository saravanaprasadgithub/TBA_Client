import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/landing_page.dart';
import 'package:first_app/reputation_management/reputation_form1.dart';
import 'package:first_app/reputation_management/reputation_form2.dart';
import 'package:first_app/reputation_management/reputation_form3.dart';
import 'package:first_app/reputation_management/reputation_form4.dart';
import 'package:flutter/material.dart';

class ReputationManagement_Menu extends StatefulWidget {
  const ReputationManagement_Menu({Key? key}) : super(key: key);
  @override
  State<ReputationManagement_Menu> createState() => _ReputationManagement_MenuState();
}

class _ReputationManagement_MenuState extends State<ReputationManagement_Menu> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Press Logout Icon to Exit'),));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Reputation Management Requirements',style: TextStyle(fontSize: 20),),
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
            child: Center(child: Text('Reputation Management Requirements',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.deepPurple),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("TBA appreciates your onboarding with us. We need some requirements to create an effective website for your business.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
          ),
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
              leading: Icon(Icons.qr_code_outlined,color: Colors.white,), title: Text("Reputation Management Form1",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReputaionManagement_form1()),);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.screen_rotation_outlined,color: Colors.white,), title: Text("Reputation Management Form2",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReputaionManagement_form2()),);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.book_outlined,color: Colors.white,), title: Text("Reputation Management Form3",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReputaionManagement_form3()),);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.assignment_outlined,color: Colors.white,), title: Text("Reputation Management Form4",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReputaionManagement_form4()),);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
