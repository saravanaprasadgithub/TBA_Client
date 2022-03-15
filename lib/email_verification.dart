import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/login.dart';
import 'package:first_app/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class verify_email extends StatefulWidget {
  const verify_email({Key? key}) : super(key: key);

  @override
  State<verify_email> createState() => _verify_emailState();
}

class _verify_emailState extends State<verify_email> {
  TextEditingController Activationcode = TextEditingController();
 bool isEmailVerified = false;
 bool canResendEmail = false;
 Timer? timer;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState(){
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
    sendVerificationEmail();
    timer=Timer.periodic(
      Duration(seconds: 3),
        (_) => checkEmailVerified(),
    );
    }
  }
  void dispose(){
timer?.cancel();
super.dispose();
  }
  Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if(isEmailVerified) timer?.cancel();
  }
  Future sendVerificationEmail() async{
    try{
      final user =FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    }
    catch(e){
      Fluttertoast.showToast(
          timeInSecForIosWeb: 1,
          msg: "Email Verification Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.deepPurple,
          textColor: Colors.white
      );
    }

  }


  @override
  Widget build(BuildContext context) {
      return isEmailVerified ? Menu():Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Email Verification',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: Image.asset('assets/logo.png')),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text('Activation Link Sent to Your Email-ID',style: TextStyle(
                  fontSize: 22,fontWeight: FontWeight.w600,
                  color: Colors.deepPurple
              ),),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: TextFormField(
            //     maxLength: 6,
            //     keyboardType: TextInputType.number,
            //     controller: Activationcode,
            //     decoration: InputDecoration(
            //         suffixIcon: Icon(Icons.lock_outline_rounded),
            //         hintText: 'Enter Your Activation Code',
            //         border: OutlineInputBorder()
            //     ),
            //     validator: (String? value){
            //         if(value!.isEmpty){
            //           return 'Please Enter Activation Code';
            //         }
            //         if(value.length<=5){
            //           return 'Code Must be 6 Characters';
            //         }
            //         return null;
            //
            //     },
            //     onSaved: (String? value){
            //       code = value!;
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70,10,70,10),
              child: ElevatedButton.icon(
                  icon:Icon(Icons.email,color: Colors.white,),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple
                ),
                label: Text("Resend Verification",style: TextStyle(fontSize: 20),),
                onPressed: canResendEmail?sendVerificationEmail:null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70,10,70,10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange
                ),
                child: Text("Cancel",style: TextStyle(fontSize: 20),),
                 onPressed:()
                {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
