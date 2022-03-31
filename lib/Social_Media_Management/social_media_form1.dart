import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/Social_Media_Management/social_media_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class social_media_form1 extends StatefulWidget {
  const social_media_form1({Key? key}) : super(key: key);

  @override
  State<social_media_form1> createState() => _social_media_form1State();
}

class _social_media_form1State extends State<social_media_form1> {

  TextEditingController SocialMediaPurposectlr = TextEditingController();
  TextEditingController BrandObjectivectlr = TextEditingController();
  TextEditingController Achievectlr = TextEditingController();
  TextEditingController Successctlr = TextEditingController();
  TextEditingController Growthplanctlr = TextEditingController();
  TextEditingController TargetedAudiencectlr = TextEditingController();
  TextEditingController SocialPlatformctlr = TextEditingController();
  TextEditingController IssuesCntrlr = TextEditingController();
  TextEditingController BrandEngageCntrlr = TextEditingController();
  TextEditingController SocailListeningctlr = TextEditingController();
  TextEditingController AudienceEngagectlr = TextEditingController();
  TextEditingController BrandVoicectlr = TextEditingController();
  TextEditingController SMUpdatesctlr = TextEditingController();
  TextEditingController BrandMessagectlr = TextEditingController();
  TextEditingController BrandDifferentctlr = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  late String purpose;
  void initState() {
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Social Media Form1',style: TextStyle(fontSize: 20),),
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
                  child: Text('1.What is your purpose on social media?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: SocialMediaPurposectlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Please Enter Details';
                      }
                    },
                    onSaved: (String? value){
                      purpose = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.What is your brand’s objective?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BrandObjectivectlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('3.What do you hope to achieve using social media? How will you know you’ve achieved it?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Achievectlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('4.What’s the biggest barrier to your success on social media?)',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Successctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('5.How does social media fit into your growth plan?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Growthplanctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('6.Describe your target audience. Who are they?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: TargetedAudiencectlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('7.What social platforms do they use?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: SocialPlatformctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('8.What issues matter to them?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: IssuesCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('9.How does your brand engage them?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BrandEngageCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('10.What social listening have you done? What does your audience say about you?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: SocailListeningctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('11.Who else (brands/celebrities/people) does your audience engage with?.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: AudienceEngagectlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('12.Describe your brand voice.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BrandVoicectlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('13.What tone should social media updates have?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: SMUpdatesctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('14.What is the main message your brand is trying to communicate?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BrandMessagectlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('15.What makes your brand different from others?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BrandDifferentctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(70,30,70,10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange
                      ),
                      child: Text("Submit",style: TextStyle(fontSize: 20,color: Colors.white),),
                      onPressed: (){
                        if(_formkey.currentState!.validate())
                        {
                          try{
                            var firebaseUser =  FirebaseAuth.instance.currentUser;
                            firestoreInstance.collection("Social Media Management1").doc(firebaseUser!.email).set(
                                {
                                  'Social_Media_Purpose':SocialMediaPurposectlr.text,'Brand_Objective':BrandObjectivectlr.text,
                                  'Social_Media_Achieve':Achievectlr.text,'Barrier_Success':Successctlr.text,
                                  'GrowhPlan':Growthplanctlr.text,'Targeted_Audience':TargetedAudiencectlr.text,
                                  'Social_Platform':SocialPlatformctlr.text,'Issues':IssuesCntrlr.text,
                                  'Brand_Engage':BrandEngageCntrlr.text,'Social_Listening':SocailListeningctlr.text,
                                  'Audience_Engage':AudienceEngagectlr.text,'Brand_Voice':BrandVoicectlr.text,
                                  'Social_Media_Updates':SMUpdatesctlr.text,'Brand_Message':BrandMessagectlr.text,
                                  'Brand_Different':BrandDifferentctlr.text,
                                }
                            ).then((value) => {
                              SocialMediaPurposectlr.clear(),BrandObjectivectlr.clear(),Achievectlr.clear(),Successctlr.clear(),Growthplanctlr.clear(),
                              TargetedAudiencectlr.clear(),SocialPlatformctlr.clear(),IssuesCntrlr.clear(),BrandEngageCntrlr.clear(),SocailListeningctlr.clear(),
                              AudienceEngagectlr.clear(),BrandVoicectlr.clear(),SMUpdatesctlr.clear(),BrandMessagectlr.clear(),BrandDifferentctlr.clear(),
                            });
                            Fluttertoast.showToast(
                                timeInSecForIosWeb: 1,
                                msg: "Your Details Submitted Successfully..!!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.deepPurple,
                                textColor: Colors.white
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SocialMedia_Menu()),);
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
    final data =firestoreInstance.collection("Social Media Management1").doc(firebaseUser!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      SocialMediaPurposectlr.text=snapshot['Social_Media_Purpose'];
      BrandObjectivectlr.text=snapshot['Brand_Objective'];
      Achievectlr.text=snapshot['Social_Media_Achieve'];
      Successctlr.text=snapshot['Barrier_Success'];
      Growthplanctlr.text=snapshot['GrowhPlan'];
      TargetedAudiencectlr.text=snapshot['Targeted_Audience'];
      SocialPlatformctlr.text=snapshot['Social_Platform'];
      IssuesCntrlr.text=snapshot['Issues'];
      BrandEngageCntrlr.text=snapshot['Brand_Engage'];
      SocailListeningctlr.text=snapshot['Social_Listening'];
      AudienceEngagectlr.text=snapshot['Audience_Engage'];
      BrandVoicectlr.text=snapshot['Brand_Voice'];
      SMUpdatesctlr.text=snapshot['Social_Media_Updates'];
      BrandMessagectlr.text=snapshot['Brand_Message'];
      BrandDifferentctlr.text=snapshot['Brand_Different'];
    }
  }
}
