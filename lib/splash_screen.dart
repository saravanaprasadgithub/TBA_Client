import 'dart:async';
import 'package:first_app/login.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);
  @override
  State<splash_screen> createState() => _splash_screenState();
}
class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => login()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.only(top:100),
               child: Center(child: Image.asset('assets/TBA-Logo.gif')),
             ),//gif image
             Padding(
               padding: const EdgeInsets.only(top: 150.0),
               child: CircularProgressIndicator(
                 color: Colors.deepPurple,
               ),
             ),
           ],
      ),
    );
  }
}
