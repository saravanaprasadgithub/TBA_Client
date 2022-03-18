import 'package:first_app/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  TextEditingController EmailCntrlr = TextEditingController();
  late String email;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Forgot Password',style: TextStyle(fontSize: 20),),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: EmailCntrlr,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.mail_outline_rounded),
                    hintText: 'Email ID',
                    border: OutlineInputBorder()
                ),
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Please Enter Email-ID';
                  }
                  if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                    return 'Please a valid Email';
                  }
                  return null;
                },
                onSaved: (String? value){
                  email = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70,10,70,10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple
                ),
                child: Text("Submit",style: TextStyle(fontSize: 20),),
                onPressed: () async {
                  if(_formkey.currentState!.validate())
                  {
                    try{
                      await FirebaseAuth.instance.sendPasswordResetEmail(email: EmailCntrlr.text.trim());
                      Fluttertoast.showToast(
                          timeInSecForIosWeb: 1,
                          msg: "Reset Password Link Sent to Your Email-ID",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.deepOrange,
                          textColor: Colors.white

                      );
                      Navigator.of(context).pop();
                    }on FirebaseAuthException catch(e){
                      Fluttertoast.showToast(
                          timeInSecForIosWeb: 1,
                          msg: "Check Your Email or No Internet",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.deepOrange,
                          textColor: Colors.white
                      );
                    }
                  }else{
                    print("UnSuccessfull");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
