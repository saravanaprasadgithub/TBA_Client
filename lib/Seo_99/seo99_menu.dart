import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/Seo_99/seo99_form.dart';
import 'package:first_app/landing_page.dart';
import 'package:flutter/material.dart';

class SEO99_Menu extends StatefulWidget {
  const SEO99_Menu({Key? key}) : super(key: key);
  @override
  State<SEO99_Menu> createState() => _SEO99_MenuState();
}

class _SEO99_MenuState extends State<SEO99_Menu> {
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
          title: Text('SEO-99 Service Requirements',style: TextStyle(fontSize: 20),),
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
              child: Center(child: Text('SEO Service Requirements',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.deepPurple),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("TBA appreciates your onboarding with us. We need some requirements to implement a Search Engine Optimization service.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
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
                leading: Icon(Icons.qr_code_outlined,color: Colors.white,), title: Text("SEO Form",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SEO99_form()),);
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
