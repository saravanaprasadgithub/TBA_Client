import 'package:first_app/Social_Media_Management/social_media_menu.dart';
import 'package:first_app/app_Development/app_menu.dart';
import 'package:first_app/login.dart';
import 'package:first_app/search_engine_marketing/search_engine_menu.dart';
import 'package:first_app/website_Development/web_menu.dart';
import 'package:flutter/cupertino.dart';
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
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple,
          title: Text('Texas Business Analytics ',style: TextStyle(fontSize: 20),),
          centerTitle: true,
          actions: [
            IconButton(
              icon:Icon(Icons.logout),
              onPressed: (){
                // showExitPopup();
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
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0
          ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Web_Menu()),);
                        },
                        icon: Icon(Icons.web_rounded,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Website',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const App_Menu()),);
                        },
                        icon: Icon(Icons.mobile_friendly_outlined,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Mobile App',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchEngine_Menu()),);
                        },
                        icon: Icon(Icons.search_rounded,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Search Engine',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SocialMedia_Menu()),);
                        },
                        icon: Icon(Icons.facebook,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Social Media',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.business,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Reputation',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.add_business_outlined,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Creative Services',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.paypal_outlined,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Pay-Per-Click',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.vpn_lock_rounded,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('SEO',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.book_outlined,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Content Marketing',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.phone_android_outlined,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Mobile Marketing',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.mail_outline_rounded,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Email Marketing',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.token_outlined,color: Colors.deepPurple,size: 40,),
                      ),
                    ),
                    SizedBox(height: 5,),
                    FittedBox(child: Text('Digital 360°',style: TextStyle(fontSize: 16,),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
