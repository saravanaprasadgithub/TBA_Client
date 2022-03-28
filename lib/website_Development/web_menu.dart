import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/landing_page.dart';
import 'package:first_app/website_Development/web_content_form.dart';
import 'package:first_app/website_Development/web_graphics_form.dart';
import 'package:first_app/website_Development/web_technical_form.dart';
import 'package:flutter/material.dart';

class Web_Menu extends StatefulWidget {
  const Web_Menu({Key? key}) : super(key: key);
  @override
  State<Web_Menu> createState() => _Web_MenuState();
}

class _Web_MenuState extends State<Web_Menu> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Press Logout Icon to Exit'),));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Website Development',style: TextStyle(fontSize: 20),),
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
            child: Center(child: Text('Website Development Requirements',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.deepPurple),)),
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
