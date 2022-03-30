import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/reputation_management/reputation_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReputaionManagement_form1 extends StatefulWidget {
  const ReputaionManagement_form1({Key? key}) : super(key: key);

  @override
  State<ReputaionManagement_form1> createState() => _ReputaionManagement_form1State();
}

class _ReputaionManagement_form1State extends State<ReputaionManagement_form1> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController CompanynameCntrlr = TextEditingController();
  TextEditingController Citycntrlr = TextEditingController();
  TextEditingController EmailCtrlr = TextEditingController();
  TextEditingController PostalCodeCntrlr = TextEditingController();
  TextEditingController Addressctlr = TextEditingController();
  TextEditingController Address1ctlr = TextEditingController();
  TextEditingController Statecntrlr = TextEditingController();
  TextEditingController MobileCntrlr = TextEditingController();
  TextEditingController Urlctlr = TextEditingController();
  late String address,cname,fname,state,email,postal,city,mobile;
  @override
  void initState() {
    super.initState();
    getdata();
  }  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Reputation Management Form1',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Company Information:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('List your company’s official name, address and phone number that matches your official documentation.',style: TextStyle(fontSize: 20,color: Colors.black),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1.Full Company Name',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: CompanynameCntrlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person_outline_outlined),
                      hintText: "Enter Your Company Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Please Enter Company Name';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      cname = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.Address',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: Addressctlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.location_on_outlined),
                      hintText: "Enter Your Street Address",
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
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: Address1ctlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.location_on_outlined),
                      hintText: "Enter Your Street Address line2",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Citycntrlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person_outline_outlined),
                      hintText: "Enter Your City",
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Please Enter City';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      city = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Statecntrlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person_outline_outlined),
                      hintText: "Enter Your State/Province",
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Please Enter State';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      state = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: PostalCodeCntrlr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.phone_android_rounded),
                      hintText: "Enter Your Postal/Zip Code",
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Please Enter PostalCode';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      postal = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('3.Official Email',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                  child: Text('4.Phone Number',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                  child: Text('5.Website URL',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
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
                Center(
                  child: Padding(
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
                            firestoreInstance.collection("Reputation Management Form1").doc(firebaseUser!.email).set(
                                {
                                 'Company_Name':CompanynameCntrlr.text,'Company_Address1':Addressctlr.text,'Company_Address2':Address1ctlr.text,
                                  'City':Citycntrlr.text,'State':Statecntrlr.text,'PostalCode':PostalCodeCntrlr.text,'Company_Email':EmailCtrlr.text,
                                  'Company_Mobile':MobileCntrlr.text,'Company_Website':Urlctlr.text
                                }
                            ).then((value) => {
                              CompanynameCntrlr.clear(),Addressctlr.clear(),Address1ctlr.clear(),Citycntrlr.clear(),Statecntrlr.clear(),PostalCodeCntrlr.clear(),
                              EmailCtrlr.clear(),MobileCntrlr.clear(),Urlctlr.clear()
                            });
                            Fluttertoast.showToast(
                                timeInSecForIosWeb: 1,
                                msg: "Your Details Submitted Successfully..!!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.deepPurple,
                                textColor: Colors.white
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ReputationManagement_Menu()),);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  getdata()async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    final data =firestoreInstance.collection("Reputation Management Form1").doc(firebaseUser!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      CompanynameCntrlr.text = snapshot['Company_Name'];
      MobileCntrlr.text= snapshot['Company_Mobile'];
      Addressctlr.text = snapshot['Company_Address1'];
      Address1ctlr.text=snapshot['Company_Address2'];
      Urlctlr.text =snapshot['Company_Website'];
      Citycntrlr.text = snapshot['City'];
      Statecntrlr.text = snapshot['State'];
      PostalCodeCntrlr.text = snapshot['PostalCode'];
      EmailCtrlr.text = snapshot['Company_Email'];
    }
  }
}
