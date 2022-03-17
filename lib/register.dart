import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/email_verification.dart';
import 'package:first_app/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);
  @override
  State<register> createState() => _registerState();
}
class _registerState extends State<register> {
  final _auth = FirebaseAuth.instance;
  TextEditingController EmailCntrlr = TextEditingController();
  TextEditingController PasswordCntrlr = TextEditingController();
  TextEditingController CnfrmPassword = TextEditingController();
  late String name,email,password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _isobscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Registration',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body:Form(
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
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: PasswordCntrlr,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(icon: Icon( _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),onPressed: (){
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },),
                      hintText: 'Password',
                      border: OutlineInputBorder()
                  ),
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'Please Enter Password';
                    }
                    if(value.length<=7){
                      return 'Password Must be 8 Characters';
                    }
                    return null;
                  },
                  onSaved: (String? value){
                    password = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: _isobscureText,
                  controller: CnfrmPassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(icon: Icon( _isobscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),onPressed: (){
                        setState(() {
                          _isobscureText = !_isobscureText;
                        });
                      },),
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder()
                  ),
                validator: (String? value){
                  if(value!.isEmpty)
                  {
                    return 'Please re-enter password';
                  }
                  if(PasswordCntrlr.text!=CnfrmPassword.text){
                    return "Password does not match";
                  }
                  return null;
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
                     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: EmailCntrlr.text.trim(), password: CnfrmPassword.text.trim()).then((user)
                     {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const verify_email()),
                       );//checking email verification
                        }).catchError((e){
                       Fluttertoast.showToast(
                           timeInSecForIosWeb: 1,
                           msg: "Email-ID Already Exist",
                           toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.BOTTOM,
                           backgroundColor: Colors.deepOrange,
                           textColor: Colors.white
                       );
                     });
                      }
                      catch(e)
                      {
                        Fluttertoast.showToast(
                            timeInSecForIosWeb: 1,
                            msg: "No Internet Connectivity",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.deepPurple,
                            textColor: Colors.white
                        );
                      }

                      return;
                    }else{
                      print("UnSuccessfull");
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Register ? Click Here..!!',style: TextStyle(fontSize: 20,),),
                  TextButton(
                    child: Text('Login',style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                    ),),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const login()),
                      );
                    },
                  ),
                ],),
            ],
          ),
        ),

    );
  }
}
