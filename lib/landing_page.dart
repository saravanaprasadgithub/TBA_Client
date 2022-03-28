import 'package:first_app/Creative_Service/creative_service_menu.dart';
import 'package:first_app/Social_Media_Management/social_media_menu.dart';
import 'package:first_app/app_Development/app_menu.dart';
import 'package:first_app/content_marketing/content_marketing_menu.dart';
import 'package:first_app/email_marketing/email_marketing_menu.dart';
import 'package:first_app/login.dart';
import 'package:first_app/mobile_marketing/mobile_marketing_menu.dart';
import 'package:first_app/pay_per_click/payperclick_menu.dart';
import 'package:first_app/reputation_management/reputation_menu.dart';
import 'package:first_app/search_engine_marketing/search_engine_menu.dart';
import 'package:first_app/seo/seo_menu.dart';
import 'package:first_app/website_Development/web_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple,
          title: Text('Texas Business Analytics ',style: TextStyle(fontSize: 20),),
          centerTitle: true,
          actions: [
            IconButton(
              icon:Icon(Icons.logout),
              onPressed: (){
                logindata!.setBool('login', true);//maintain login data
                Navigator.push(context, MaterialPageRoute(builder: (context) => const login()),);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0
          ),
            scrollDirection: Axis.vertical,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Web_Menu()),);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.web_rounded,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Website',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const App_Menu()),);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.mobile_friendly_outlined,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Mobile App',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchEngine_Menu()),);
                },
                child: Container(
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.search_rounded,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Search Engine',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SocialMedia_Menu()),);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.facebook,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Social Media',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ReputationManagement_Menu()),);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.business,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Reputation',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreativeService_Menu()),);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.add_business_outlined,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Creative Services',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Payperclick_Menu()),);
              },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.payments_outlined,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Pay-Per-Click',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SEO_Menu()),);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.vpn_lock_rounded,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('SEO',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ContentMarketing_Menu()),);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.book_outlined,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Content Marketing',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MobileMarketing_Menu()),);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.phone_android_outlined,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Mobile Marketing',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EmailMarketing_Menu()),);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.mail_outline_rounded,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Email Marketing',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.token_outlined,color: Colors.deepPurple,size: 40,),
                      SizedBox(height: 5,),
                      Text('Digital 360°',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
