import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/Creative_Service/creative_service_form.dart';
import 'package:first_app/landing_page.dart';
import 'package:flutter/material.dart';

class CreativeService_Menu extends StatefulWidget {
  const CreativeService_Menu({Key? key}) : super(key: key);
  @override
  State<CreativeService_Menu> createState() => _CreativeService_MenuState();
}

class _CreativeService_MenuState extends State<CreativeService_Menu> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Press Logout Icon to Exit'),));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Creative Service Requirements',style: TextStyle(fontSize: 20),),
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
            child: Center(child: Text('Creative Service Requirements',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.deepPurple),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("TBA appreciates your onboarding with us. We need some requirements from you to provide better services.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
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
              leading: Icon(Icons.qr_code_outlined,color: Colors.white,), title: Text("Creative Service Form",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const creative_form()),);
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
