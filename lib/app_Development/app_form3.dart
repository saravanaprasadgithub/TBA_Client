import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/app_Development/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class appForm3 extends StatefulWidget {
  const appForm3({Key? key}) : super(key: key);

  @override
  State<appForm3> createState() => _appForm3State();
}

class _appForm3State extends State<appForm3> {

  TextEditingController LaunchDatectlr = TextEditingController();
  TextEditingController ContentRestrictionctlr = TextEditingController();
  TextEditingController Domainctlr = TextEditingController();
  TextEditingController RequiredSolutionctlr = TextEditingController();
  TextEditingController MobileAnalyticsctlr = TextEditingController();
  TextEditingController MobileAdvertismentctlr = TextEditingController();
  TextEditingController Apptypectlr = TextEditingController();
  TextEditingController AppPlatformCntrlr = TextEditingController();
  TextEditingController AppOSCntrlr = TextEditingController();
  TextEditingController AppOrientationCtrlr = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  late String launchdate;
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
        title: Text('App Requirements Form3',style: TextStyle(fontSize: 20),),
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
                  child: Text('1.Is there a target launch date for this product?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: LaunchDatectlr,
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
                      launchdate = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.Is there any content restriction outside of the US?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: ContentRestrictionctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('3.Are there any domain or region-specific standards /regulations to comply with? (For example, related to security, documentation, design, etc.)',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Domainctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('4.Will the solution require in-app purchase, payment gateway integration, multi-currency support, etc.? ',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: RequiredSolutionctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('5.Does the app require mobile analytics integration for app usage tracking?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: MobileAnalyticsctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('6.Does the app require mobile app advertising management tools integration?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: MobileAdvertismentctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('7.Please specify the type of app: B2B, B2C, or B2E.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Apptypectlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('8.How would you want the app to be developed? Do you prefer using Cross-Platform technologies or developing the apps natively across each platform?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: AppPlatformCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('9.What are the desired compatible devices & OS versions? Please provide the required platform and OS versions. (Eg: iOS, Android, Blackberry, Windows)',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: AppOSCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('10.Is the app expected to work in both Portrait and Landscape orientation?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: AppOrientationCtrlr,
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
                            firestoreInstance.collection("App Requirements3").doc(firebaseUser!.email).set(
                                {
                                  'Launch_Date':LaunchDatectlr.text,'Content_Restriction':ContentRestrictionctlr.text,
                                  'DomainorRegion_Specific':Domainctlr.text,'Required_Solutions':RequiredSolutionctlr.text,
                                  'MobileAnalytics_Integration':MobileAnalyticsctlr.text,'MobileApp_Advertising':MobileAdvertismentctlr.text,
                                  'App_Type':Apptypectlr.text,'App_Platform':AppPlatformCntrlr.text,
                                  'App_OS':AppOSCntrlr.text,'App_Orientation':AppOrientationCtrlr.text,
                                }
                            ).then((value) => {
                              LaunchDatectlr.clear(),ContentRestrictionctlr.clear(),Domainctlr.clear(),RequiredSolutionctlr.clear(),MobileAnalyticsctlr.clear(),
                              MobileAdvertismentctlr.clear(),Apptypectlr.clear(),AppPlatformCntrlr.clear(),AppOSCntrlr.clear(),AppOrientationCtrlr.clear(),
                            });
                            Fluttertoast.showToast(
                                timeInSecForIosWeb: 1,
                                msg: "Your Details Submitted Successfully..!!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.deepPurple,
                                textColor: Colors.white
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const App_Menu()),);
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
    final data =firestoreInstance.collection("App Requirements3").doc(firebaseUser!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      LaunchDatectlr.text = snapshot['Launch_Date'];
      ContentRestrictionctlr.text= snapshot['Content_Restriction'];
      Domainctlr.text = snapshot['DomainorRegion_Specific'];
      RequiredSolutionctlr.text=snapshot['Required_Solutions'];
      MobileAnalyticsctlr.text =snapshot['MobileAnalytics_Integration'];
      Apptypectlr.text = snapshot['App_Type'];
      AppPlatformCntrlr.text = snapshot['App_Platform'];
      AppOSCntrlr.text = snapshot['App_OS'];
      AppOrientationCtrlr.text =snapshot['App_Orientation'];
      MobileAdvertismentctlr.text =snapshot['MobileApp_Advertising'];
    }
  }
}
