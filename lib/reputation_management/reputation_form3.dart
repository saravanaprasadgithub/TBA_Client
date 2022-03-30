import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/reputation_management/reputation_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReputaionManagement_form3 extends StatefulWidget {
  const ReputaionManagement_form3({Key? key}) : super(key: key);

  @override
  State<ReputaionManagement_form3> createState() => _ReputaionManagement_form3State();
}

class _ReputaionManagement_form3State extends State<ReputaionManagement_form3> {
  TextEditingController WebsiteBroadcastctlr = TextEditingController();
  TextEditingController WebsiteLoginctlr = TextEditingController();
  TextEditingController Feedbackctlr= TextEditingController();
  TextEditingController ReviewDirectoryctlr = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  late String details;
  Map<String, bool> values = {
    'Twice a week': false,
    'Twice every other week': false,
    'Once a week': false,
    '1 time a month': false,
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
  Map<String, bool> values1 = {
    'Google My Business': false,
    'SuperPages': false,
    'Insider Pages': false,
    'Merchantcircle': false,
    'Judy’s Book':false,
    'HotFrog':false,
    'Foursquare':false,
    'Better Business Bureau':false,
    'CitySearch':false,
    'Yelp':false,
    'Yellowbook':false,
    'Best Of Web':false,
    'Dexknows':false,
    'Yellowpages':false
  };
  var tmpArray1 = [];
  getCheckboxItems1(){
    values1.forEach((key, value) {
      if(value == true)
      {
        tmpArray1.add(key);
      }
    });
    print(tmpArray1);
    return tmpArray1;
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
        title: Text('Reputation Management Form3',style: TextStyle(fontSize: 20),),
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
                  child: Text('Details Necessary for Reputation Marketing:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1.If no, OR If you would prefer us to handle the code installation for review broadcasting to your website please fill in the following details:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: WebsiteBroadcastctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Wordpress,Wix,etc..',
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Please Enter Details';
                      }
                    },
                    onSaved: (String? value){
                      details = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.Website Login Information',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: WebsiteLoginctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('3.We will broadcast your good feedback to your website or blog. What pages would you like to haveyour reviews posted to?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Feedbackctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('4.How often would you like to post new good reviews to your social media pages?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                  child: Text('Details Necessary for Reputation Growth:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1.Please let us know what directories you’d like to collect the most reviews on:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ReviewDirectoryctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Ex:Google,Facebook,etc..',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Details Necessary for Reputation Management:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1.If you your business is claimed and verified on any of the following directories, please provide the Login details:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                SizedBox(
                  child: Column(
                      children:
                      values1.keys.map((String key){
                        return new CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: new Text(key), value: values1[key],
                          onChanged:(bool? value)
                          {
                            setState(() {
                              values1[key] = value!;
                            });
                          },
                        );}).toList()
                  ),
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
                            firestoreInstance.collection("Reputation Management Form3").doc(firebaseUser!.email).set(
                                {
                                'Web_BroadCasting':WebsiteBroadcastctlr.text,'WebLogin_Info':WebsiteLoginctlr.text,'Review_Posted':Feedbackctlr.text,
                                'Collect_Reviews':ReviewDirectoryctlr.text,'Verified_Directories':getCheckboxItems1(),'Review_Posting_Range':getCheckboxItems()
                                }
                            ).then((value) => {
                              WebsiteBroadcastctlr.clear(),WebsiteLoginctlr.clear(),Feedbackctlr.clear(),ReviewDirectoryctlr.clear()
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
    final data =firestoreInstance.collection("Reputation Management Form3").doc(firebaseUser!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      WebsiteBroadcastctlr.text = snapshot['Web_BroadCasting'];
      WebsiteLoginctlr.text= snapshot['WebLogin_Info'];
      Feedbackctlr.text = snapshot['Review_Posted'];
      ReviewDirectoryctlr.text=snapshot['Collect_Reviews'];
    }
  }
}
