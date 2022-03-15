import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/content_form.dart';
import 'package:first_app/graphics_form.dart';
import 'package:first_app/login.dart';
import 'package:first_app/technical_form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  SharedPreferences? logindata;
  String? email;

  @override
  void initState() {
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata!.getString('email');
    });
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Texas Business Analytics ',style: TextStyle(fontSize: 20),),
        centerTitle: true,
        actions: [
          IconButton(
            icon:Icon(Icons.logout),
            onPressed: (){
              logindata!.setBool('login', true);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const login()),);
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
            child: Center(child: Text('Website Development Requirements',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.deepPurple),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("TBA appreciates your onboarding with us. We need some requirements to create an effective app for your business.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text("TBA Welcomes You! You're just one step away from a website.!!!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.orange,),textAlign: TextAlign.justify,),
          // ),

        ],
      ),

      drawer: Drawer(
      backgroundColor: Colors.deepPurple,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple
              ),
              accountName: Text("",style: TextStyle(fontSize: 20.0,color: Colors.white),),
              accountEmail:Text(user.email!,style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w500),),
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.qr_code_outlined,color: Colors.white,), title: Text("Technical Side",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const technicalform()),);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.screen_rotation_outlined,color: Colors.white,), title: Text("Creatives & Graphics Side",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const graphicsform()),);
              },
            ),
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.book_outlined,color: Colors.white,), title: Text("Content Side",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const contentform()),);
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
