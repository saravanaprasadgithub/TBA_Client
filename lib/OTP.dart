import 'package:first_app/reset_password.dart';
import 'package:flutter/material.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController OTPcntrlr = TextEditingController();
  late String otp;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurple,
        title: Text('OTP Verification',style: TextStyle(fontSize: 20),),
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
              child: Text('OTP Sent to Your Email-ID',style: TextStyle(
                fontSize: 22,fontWeight: FontWeight.w600,
                color: Colors.deepPurple
              ),),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: OTPcntrlr,
                maxLength: 6,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock_outline_rounded),
                    hintText: 'Enter Your OTP',
                    border: OutlineInputBorder()
                ),
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Please Enter OTP';
                  }
                  if(value.length<=5){
                    return 'OTP Must be 6 Characters';
                  }
                  return null;
                },
                onSaved: (String? value ){
                  otp = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70,10,70,10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple
                ),
                child: Text("Verify",style: TextStyle(fontSize: 20),),
                onPressed: (){
                  if(_formkey.currentState!.validate())
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Reset_Password()),
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
