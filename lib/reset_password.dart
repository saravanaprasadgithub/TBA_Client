import 'package:first_app/login.dart';
import 'package:flutter/material.dart';


class Reset_Password extends StatefulWidget {
  const Reset_Password({Key? key}) : super(key: key);
  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  TextEditingController PasswordCntrlr = TextEditingController();
  late String password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Reset Password',style: TextStyle(fontSize: 20),),
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
                obscureText: _obscureText,
                controller: PasswordCntrlr,
                decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon( _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),onPressed: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },),
                    hintText: 'Enter New Password',
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
              padding: const EdgeInsets.fromLTRB(70,10,70,10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple
                ),
                child: Text("Submit",style: TextStyle(fontSize: 20),),
                onPressed: (){
                  if(_formkey.currentState!.validate())
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                    );
                    print("successful");
                    return;
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
