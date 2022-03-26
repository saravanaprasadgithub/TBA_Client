import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/app_Development/app_form1.dart';
import 'package:first_app/app_Development/app_form2.dart';
import 'package:first_app/app_Development/app_form3.dart';
import 'package:first_app/app_Development/app_form4.dart';
import 'package:first_app/landing_page.dart';
import 'package:flutter/material.dart';

class App_Menu extends StatefulWidget {
  const App_Menu({Key? key}) : super(key: key);
  @override
  State<App_Menu> createState() => _App_MenuState();
}

class _App_MenuState extends State<App_Menu> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Press Logout Icon to Exit'),));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('App Development',style: TextStyle(fontSize: 20),),
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
            child: Center(child: Text('App Development Service Requirements',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.deepPurple),)),
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
              leading: Icon(Icons.qr_code_outlined,color: Colors.white,), title: Text("App Details Form1",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const appForm1()),);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.screen_rotation_outlined,color: Colors.white,), title: Text("App Details Form2",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const appForm2()),);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.book_outlined,color: Colors.white,), title: Text("App Details Form3",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const appForm3()),);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.assignment_outlined,color: Colors.white,), title: Text("App Details Form4",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const appForm4()),);
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
