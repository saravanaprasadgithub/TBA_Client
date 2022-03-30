import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/content_marketing/content_marketing_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ContentMarketing_form2 extends StatefulWidget {
  const ContentMarketing_form2({Key? key}) : super(key: key);

  @override
  State<ContentMarketing_form2> createState() => _ContentMarketing_form2State();
}

class _ContentMarketing_form2State extends State<ContentMarketing_form2> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController CompanyRewardsctlr = TextEditingController();
  TextEditingController Informationctlr = TextEditingController();
  TextEditingController Experiencectlr =TextEditingController();
  TextEditingController Importantinfoctlr=TextEditingController();
  TextEditingController Practicesctlr = TextEditingController();
  int ? Val=-1,Val1=-2,Val2=-3,Val3=-4,Val4=-5,Val5=-6,Val6=-7,Val7=-8,Val8=-9,Val9=-10,Val10 = -11;
  var Rtext,Rtext1,Rtext2,Rtext3,Rtext4,Rtext5,Rtext6,Rtext7,Rtext8,Rtext9,Rtext10;
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
        title: Text('Content Marketing Form2',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('1.Does your company have any awards, distinctions, special certifications or qualifications? ',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: CompanyRewardsctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2.Is there any information you would like us to know regarding licensing, bonding, or insurance?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Informationctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3.What education or experience do you or your team have? ',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Experiencectlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('4.Is there any other important information you’d like us to be aware of for either future content writing, or just to get to know your company a little better?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Importantinfoctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('5.What tone should characterize your communication with customers?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Authoritative",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 1,
                  groupValue: Val,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext="Authoritative";
                      Val = value as int?  ;
                      print(Rtext);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("Conversational",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 2,
                  groupValue: Val,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext = "Conversational";
                      Val = value as int?;
                      print(Rtext);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('6.What style of voice should characterize your communication with customers?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Edgy",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 3,
                  groupValue: Val1,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext1="Edgy";
                      Val1 = value as int?  ;
                      print(Rtext1);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("Traditional",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 4,
                  groupValue: Val1,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext1 = "Traditional";
                      Val1 = value as int?;
                      print(Rtext1);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('7.What level of complexity should characterize your communication with customers?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Economical",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 5,
                  groupValue: Val2,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext2="Economical";
                      Val2 = value as int?  ;
                      print(Rtext2);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("Luxurious",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 6,
                  groupValue: Val2,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext2 = "Luxurious";
                      Val2 = value as int?;
                      print(Rtext2);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('8.What emotion should characterize your communication with customers?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text(" Feed the Brain",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 7,
                  groupValue: Val3,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext3=" Feed the Brain";
                      Val3 = value as int?  ;
                      print(Rtext3);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("Touch the Heart",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 8,
                  groupValue: Val3,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext3 = "Touch the Heart";
                      Val3 = value as int?;
                      print(Rtext3);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('9.What level of energy should characterize your communication with customers?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Dry",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 9,
                  groupValue: Val4,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext4="Dry";
                      Val4 = value as int?  ;
                      print(Rtext4);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("Animated",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 10,
                  groupValue: Val4,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext4 = "Animated";
                      Val4 = value as int?;
                      print(Rtext4);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('10.For on-site blogs: Would you like to allow tips/"how to" articles related to your industry?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 11,
                  groupValue: Val5,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext5="Yes";
                      Val5 = value as int?  ;
                      print(Rtext5);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 12,
                  groupValue: Val5,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext5 = "No";
                      Val5 = value as int?;
                      print(Rtext5);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('11.For on-site blogs: Would you like to allow step-by-step/DIY posts related to your industry?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 13,
                  groupValue: Val6,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext6="Yes";
                      Val6 = value as int?  ;
                      print(Rtext6);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 14,
                  groupValue: Val6,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext6 = "No";
                      Val6 = value as int?;
                      print(Rtext6);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('12.For on-site blogs: Would you like to allow summaries of buzzworthy topics in the industry?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 15,
                  groupValue: Val7,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext7="Yes";
                      Val7 = value as int?  ;
                      print(Rtext7);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 16,
                  groupValue: Val7,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext7 = "No";
                      Val7 = value as int?;
                      print(Rtext7);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('13.For on-site blogs: Would you like to allow interesting facts or stories related to the industry?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 17,
                  groupValue: Val8,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext8="Yes";
                      Val8 = value as int?  ;
                      print(Rtext8);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 18,
                  groupValue: Val8,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext8 = "No";
                      Val8 = value as int?;
                      print(Rtext8);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('14. For on-site blogs: Would you like to allow industry-related quizzes and questionnaires?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 19,
                  groupValue: Val9,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext9="Yes";
                      Val9 = value as int?  ;
                      print(Rtext9);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                // onTap: showTextWidget,
                title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 20,
                  groupValue: Val9,
                  onChanged: (value) {
                    setState(() {
                      // hideWidget1();
                      Rtext9 = "No";
                      Val9 = value as int?;
                      print(Rtext9);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("15.Are there any other practices you'd like to allow or avoid?Please be as specific as possible.",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Practicesctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("16.Besides bringing traffic to your website, what is the goal for your on-site blog?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Brand Awareness / Lead Generation",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 21,
                  groupValue: Val10,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext10="Brand Awareness / Lead Generation";
                      Val10 = value as int?  ;
                      print(Rtext10);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Customer Acquisition",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 22,
                  groupValue: Val10,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext10="Customer Acquisition";
                      Val10 = value as int?  ;
                      print(Rtext10);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Thought Leadership",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 23,
                  groupValue: Val10,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext10="Thought Leadership";
                      Val10 = value as int?  ;
                      print(Rtext10);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Engagement",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 24,
                  groupValue: Val10,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext10="Engagement";
                      Val10 = value as int?  ;
                      print(Rtext10);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Customer Retention / Loyalty",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 25,
                  groupValue: Val10,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext10="Customer Retention / Loyalty";
                      Val10 = value as int?  ;
                      print(Rtext10);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Sales",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 26,
                  groupValue: Val10,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext10="Sales";
                      Val10 = value as int?  ;
                      print(Rtext10);
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Other",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 27,
                  groupValue: Val10,
                  onChanged: (value) {
                    setState(() {
                      //showWidget1();
                      Rtext10="Other";
                      Val10 = value as int?  ;
                      print(Rtext10);
                    });
                  },
                  activeColor: Colors.deepPurple,
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
                      if(_formkey.currentState!.validate()&& Val!>0 && Val1!>0 && Val2!>0 && Val3!>0 && Val4!>0 && Val5!>0 && Val6!>0 && Val7!>0 && Val8!>0 && Val9!>0 && Val10!>0)
                      {
                        try{
                          var firebaseUser =  FirebaseAuth.instance.currentUser;
                          firestoreInstance.collection("Content Marketing Form2").doc(firebaseUser!.email).set(
                              {
                            'Company_Rewards':CompanyRewardsctlr.text,'Security_Information':Informationctlr.text,'Experience_Details':Experiencectlr.text,
                            'Company_Information':Importantinfoctlr.text,'Extra_Feautres':Practicesctlr.text,'Site_Goal':Rtext10,'Industry_Quiz':Rtext9,
                            'FactsorStories':Rtext8,'buzzworthy_topics':Rtext7,'step_by_step/DIY posts':Rtext6,'Tips/Articles':Rtext5,'Enargy_Level_Communication':Rtext4,
                            'Emotion_Communication':Rtext3,'Complexity_Level_Communication':Rtext2,'Voice_Communication':Rtext1,'Tone_Communication':Rtext
                              }
                          ).then((value) => {
                            CompanyRewardsctlr.clear(),Informationctlr.clear(),Experiencectlr.clear(),Importantinfoctlr.clear(),Practicesctlr.clear(),
                          });
                          Fluttertoast.showToast(
                              timeInSecForIosWeb: 1,
                              msg: "Your Details Submitted Successfully..!!!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.deepPurple,
                              textColor: Colors.white
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ContentMarketing_Menu()),);
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
    );
  }
  getdata()async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    final data =firestoreInstance.collection("Content Marketing Form2").doc(firebaseUser!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      CompanyRewardsctlr.text=snapshot['Company_Rewards'];
      Informationctlr.text=snapshot['Security_Information'];
      Experiencectlr.text=snapshot['Experience_Details'];
      Importantinfoctlr.text=snapshot['Company_Information'];
      Practicesctlr.text=snapshot['Extra_Feautres'];
    }
  }
}
