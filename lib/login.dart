import 'package:first_app/forgot_password.dart';
import 'package:first_app/menu_page.dart';
import 'package:first_app/register.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _auth = FirebaseAuth.instance;
  TextEditingController EmailCntrlr = TextEditingController();
  TextEditingController PasswordCntrlr = TextEditingController();
  bool _obscureText = true;
  String? email,password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  SharedPreferences? logindata;
  bool? newuser;
  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata!.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Menu()));
    }
  }
  @override
  void dispose() {
    EmailCntrlr.dispose();
    PasswordCntrlr.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: Text('Login',style: TextStyle(fontSize: 20),),
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
            Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text('Forgot Password?',style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 20,
              ),),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const forgot_password()),
                );
              },
            ),
          ),
            Padding(
            padding: const EdgeInsets.fromLTRB(70,10,70,10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple
              ),
              child: Text("Login",style: TextStyle(fontSize: 20),),
              onPressed: () async {
                if(_formkey.currentState!.validate())
                {
                  try {
                    final user =await _auth.signInWithEmailAndPassword(email: EmailCntrlr.text.trim(), password: PasswordCntrlr.text.trim());
                    if (user != null ){
                      Fluttertoast.showToast(
                          timeInSecForIosWeb: 1,
                          msg: "TBA Welcomes You! You're just one step away from a website.!!!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.deepPurple,
                          textColor: Colors.white
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Menu()),
                      );
                    }
                  }catch(e)
                  {
                    Fluttertoast.showToast(
                        timeInSecForIosWeb: 1,
                        msg: "Invalid Email-ID or Password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.deepOrange,
                        textColor: Colors.white
                    );
                  }
                  logindata!.setBool('login', false);
                  logindata!.setString('email', email!);
                  logindata!.setString('password', password!);
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
  Text('New User ? Click Here..!!',style: TextStyle(fontSize: 20,),),
  TextButton(
    child: Text('Register',style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 20,
    ),),
    onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const register()),
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

