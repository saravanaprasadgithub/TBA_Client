import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/website_Redesign/web_redesign_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Redesign_technicalform extends StatefulWidget {
  const Redesign_technicalform({Key? key}) : super(key: key);

  @override
  State<Redesign_technicalform> createState() => _Redesign_technicalformState();
}

class _Redesign_technicalformState extends State<Redesign_technicalform> {

  TextEditingController Suggtxtctlr = TextEditingController();
  TextEditingController Urlctlr = TextEditingController();
  TextEditingController Namectlr = TextEditingController();
  TextEditingController Passwordctlr = TextEditingController();
  TextEditingController Numctlr = TextEditingController();
  TextEditingController Linkctlr = TextEditingController();
  TextEditingController Addressctlr = TextEditingController();
  TextEditingController FirstnameCntrlr = TextEditingController();
  TextEditingController LastnameCntrlr = TextEditingController();
  TextEditingController EmailCtrlr = TextEditingController();
  TextEditingController MobileCntrlr = TextEditingController();
  TextEditingController Facebookcntrlr = TextEditingController();
  TextEditingController TwitterCtrlr = TextEditingController();
  TextEditingController InstagramCntrlr = TextEditingController();
  TextEditingController LinkedinCntrlr = TextEditingController();
  TextEditingController YoutubeCntrlr = TextEditingController();
  TextEditingController KeyIdCntrlr = TextEditingController();
  TextEditingController SecretIdCntrlr = TextEditingController();
  TextEditingController AdditionalCntrlr = TextEditingController();
  TextEditingController ContactformCntrlr = TextEditingController();
  late String suggtxt,pages,name,url,password,link,address,fname,lname,email,mobile;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool yes = false;
  bool no = true;
  int val = 2;
  Map<String, bool> values = {
    'Name': false,
    'Email': false,
    'Phone': false,
    'Message': false,
  };
  var tmpArray = [];
  getCheckboxItems(){
    values.forEach((key, value) {
      if(value == true)
      {
        tmpArray.add(key);

      }
    });
    print(tmpArray);
    return tmpArray;
  }
  void showWidget(){
    setState(() {
      yes = true ;
      no = false ;
    });
  }
  void showTextWidget(){
    setState(() {
      no = true ;
      yes = false;
    });
  }
  final firestoreInstance = FirebaseFirestore.instance;

  getdata()async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    final data =firestoreInstance.collection("Website Re-Design Technical").doc(firebaseUser!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      Suggtxtctlr.text = snapshot['Suggestion'];
      MobileCntrlr.text= snapshot['Mobile_No'];
      Addressctlr.text = snapshot['Address'];
      Namectlr.text=snapshot['Username'];
      Urlctlr.text =snapshot['URL'];
      Passwordctlr.text = snapshot['Password'];
      Numctlr.text = snapshot['Pages'];
      Linkctlr.text = snapshot['MapLink'];
      FirstnameCntrlr.text =snapshot['FirstName'];
      LastnameCntrlr.text =snapshot['LastName'];
      EmailCtrlr.text = snapshot['Email_ID'];
      Facebookcntrlr.text = snapshot['Facebook_ID'];
      TwitterCtrlr.text = snapshot['Twitter_ID'];
      InstagramCntrlr.text =snapshot['Insta_ID'];
      LinkedinCntrlr.text = snapshot['LinkedIn_ID'];
      YoutubeCntrlr.text = snapshot['Youtube_ID'];
      KeyIdCntrlr.text = snapshot['Key_ID'];
      SecretIdCntrlr.text= snapshot['Secret_KeyID'];
      AdditionalCntrlr.text=snapshot['Additional_Contact_Information'];
    }
  }
  @override
  void initState() {
    super.initState();
   getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Technical Side',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('1.Do you prefer any domain name for the website?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
            ),
            ListTile(
              //onTap: showWidget,
              title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
              leading: Radio(
                value: 1,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    showWidget();
                    val = value as int;
                  });
                },
                activeColor: Colors.deepPurple,
              ),
            ),
            ListTile(
              // onTap: showTextWidget,
              title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
              leading: Radio(
                value: 2,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    showTextWidget();
                    val = value as int;
                  });
                },
                activeColor: Colors.deepPurple,
              ),
            ),
            Visibility(
              visible: yes,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: Suggtxtctlr,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.list_alt_rounded),
                    hintText: "Enter Your Suggestions",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: no,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Urlctlr,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.link_rounded),
                        hintText: "Enter Your URL",
                        border: OutlineInputBorder(),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Namectlr,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person_outline_outlined),
                        hintText: "Username",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: _obscureText,
                      controller: Passwordctlr,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(icon: Icon( _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),onPressed: (){
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },),
                          hintText: 'Password',
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('2.How many sections do you want on the Menu?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: Numctlr,
                decoration: InputDecoration(
                  hintText: "Enter No.Of. Pages",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Please Enter No.of.Pages';
                  }
                  return null;
                },
                onChanged: (String value) {
                  if(int.parse(value)>=10) {
                    Numctlr.text = "10";
                  }
                  },
                  inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                  ],
                onSaved: (String? value){
                  pages = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("3.What is your organization's map location? ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: Linkctlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.link_rounded),
                  hintText: "Provide Link Here",
                  border: OutlineInputBorder(),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('4.Enter your organization’s address and contact details.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: Addressctlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.location_on_outlined),
                  hintText: "Enter Your Organization Address",
                  border: OutlineInputBorder(),
                ),
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Please Enter Address';
                  }
                  return null;
                },
                onSaved: (String? value){
                  address = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Contact Details:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: FirstnameCntrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person_outline_outlined),
                  hintText: "Enter Your First Name",
                  border: OutlineInputBorder(),
                ),
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Please Enter First Name';
                  }
                  return null;
                },
                onSaved: (String? value){
                  fname = value!;
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: LastnameCntrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person_outline_outlined),
                  hintText: "Enter Your Last Name",
                  border: OutlineInputBorder(),
                ),
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Please Enter Last Name';
                  }
                  return null;
                },
                onSaved: (String? value){
                  lname = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: EmailCtrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.mail_outline_rounded),
                  hintText: "Enter Your Email-ID",
                  border: OutlineInputBorder(),
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
                maxLength: 10,
                controller: MobileCntrlr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone_android_rounded),
                  hintText: "Enter Your Mobile Number",
                  border: OutlineInputBorder(),
                ),
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Please Enter Mobile No';
                  }
                  if(value.length<=9){
                    return 'Mobile.No has 10 digits';
                  }
                  return null;
                },
                onSaved: (String? value){
                  mobile = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Share your social media links for the website199_Development, as mentioned below.',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: Facebookcntrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.link_rounded),
                  hintText: "Enter Your Facebook-ID",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: TwitterCtrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.link_rounded),
                  hintText: "Enter Your Twitter Link",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: InstagramCntrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.link_rounded),
                  hintText: "Enter Your Instagram Link",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: LinkedinCntrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.link_rounded),
                  hintText: "Enter Your LinkedIn Link",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: YoutubeCntrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.link_rounded),
                  hintText: "Enter Your Youtube Link",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('5.Enter your key id and key secret id for payment gateway integration (optional)',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: KeyIdCntrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.lock_outline_rounded),
                  hintText: "Enter Your Key-Id",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: SecretIdCntrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.lock_outline_rounded),
                  hintText: "Enter Your Secret ID",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('6.Which type of contact form do you need for the website199_Development?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('General Contact Form.',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
            ),
            SizedBox(
              child: Column(
                children:
                  values.keys.map((String key){
                    return new CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                    title: new Text(key), value: values[key],
                    onChanged:(bool? value)
                    {
                      setState(() {
                        values[key] = value!;
                      });
                    },
                    );}).toList()
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('In the event, you would like to add additional contact information. Please enclose it separately by commas.',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: AdditionalCntrlr,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.book_outlined),
                  hintText: "Enter Your Additional Contact Information",
                  border: OutlineInputBorder(),
                ),
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
                      var firebaseUser =  FirebaseAuth.instance.currentUser;
                      firestoreInstance.collection("Website Re-Design Technical").doc(firebaseUser!.email).set(
                          {
                            'Suggestion':Suggtxtctlr.text,'URL':Urlctlr.text,
                            'Username':Namectlr.text,'Password':Passwordctlr.text,
                            'Pages':Numctlr.text,'MapLink':Linkctlr.text,
                            'Address':Addressctlr.text,'FirstName':FirstnameCntrlr.text,
                            'LastName':LastnameCntrlr.text,'Email_ID':EmailCtrlr.text,
                            'Mobile_No':MobileCntrlr.text,'Facebook_ID':Facebookcntrlr.text,
                            'Twitter_ID':TwitterCtrlr.text,'Insta_ID':InstagramCntrlr.text,
                            'LinkedIn_ID':LinkedinCntrlr.text,'Youtube_ID':YoutubeCntrlr.text,
                            'Key_ID':KeyIdCntrlr.text,'Secret_KeyID':SecretIdCntrlr.text,
                            'Additional_Contact_Information':AdditionalCntrlr.text,
                            'Contact_Form':getCheckboxItems(),
                          }
                      ).then((value) => {
                        Suggtxtctlr.clear(),Urlctlr.clear(),Namectlr.clear(),Passwordctlr.clear(),Numctlr.clear(),
                        Linkctlr.clear(),Addressctlr.clear(),FirstnameCntrlr.clear(),LastnameCntrlr.clear(),EmailCtrlr.clear(),
                        MobileCntrlr.clear(),Facebookcntrlr.clear(),TwitterCtrlr.clear(),InstagramCntrlr.clear(), LinkedinCntrlr.clear(),
                        YoutubeCntrlr.clear(),KeyIdCntrlr.clear(),SecretIdCntrlr.clear(),AdditionalCntrlr.clear(),
                      });
                      Fluttertoast.showToast(
                          timeInSecForIosWeb: 1,
                          msg: "Your Details Submitted Successfully..!!!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.deepPurple,
                          textColor: Colors.white
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Web_ReDesign()),);
                    }
                    catch(e){
                      Fluttertoast.showToast(
                          timeInSecForIosWeb: 1,
                          msg: "Check Internet Connection",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.deepOrange,
                          textColor: Colors.white
                      );
                    }
                    return;
                  }else{
                    Fluttertoast.showToast(
                        timeInSecForIosWeb: 1,
                        msg: "Enter Mandatory Fields",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.deepOrange,
                        textColor: Colors.white
                    );
                  }
                },
              ),
            ),
          ],),
        )
        ),
      ),
    );
  }

}
