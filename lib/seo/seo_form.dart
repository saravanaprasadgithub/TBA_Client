import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/api/uploadapi.dart';

class SEO_form extends StatefulWidget {
  const SEO_form({Key? key}) : super(key: key);

  @override
  State<SEO_form> createState() => _SEO_formState();
}

class _SEO_formState extends State<SEO_form> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController UserIdcntlr = TextEditingController();
  TextEditingController Passwordctlr = TextEditingController();
  TextEditingController Usercntlr = TextEditingController();
  TextEditingController PasswordCntlr = TextEditingController();
  TextEditingController WebURLctlr = TextEditingController();
  TextEditingController UniqueServicectlr = TextEditingController();
  TextEditingController BusinessTypectlr = TextEditingController();
  TextEditingController CompetitorsWebsitesctlr = TextEditingController();
  TextEditingController WebAnalyzeCntrlr = TextEditingController();
  TextEditingController TargetLocationctlr = TextEditingController();
  TextEditingController TargetedAudiencectlr = TextEditingController();
  TextEditingController ShortGoalctlr = TextEditingController();
  TextEditingController LongGoalctlr = TextEditingController();
  TextEditingController DomainCntrlr = TextEditingController();
  UploadTask? task;
  File? file;
  int ? val ;
  int ? val1 ;
  bool yes1 = false;
  bool _obscureText = true;
  bool yes = false;
  bool no = true;
  void showWidget(){
    setState(() {
      yes = true ;
      no = false ;
    });
  }
  void showWidget1(){
    setState(() {
      yes1 = true ;
      no = false ;
    });
  }
  void hideWidget(){
    setState(() {
      yes = false ;
      no = true ;
    });
  }
  void hideWidget1(){
    setState(() {
      yes1 = false ;
      no = true ;
    });
  }
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('SEO Form',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Form(
        key:_formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Business Information:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('1.Share your website URL .',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: WebURLctlr,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.link_rounded),
                    hintText: "Enter Website URL",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2.What’s your business type?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: BusinessTypectlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("3.What is the unique service you provide that your competitors don’t? ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: UniqueServicectlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('4.What’s your short- term and long-term business goals?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ShortGoalctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Enter Short Term Goal",
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: LongGoalctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Enter Long Term Goal",
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('5.Describe your targeted audience ',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Content Management:',style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.w500),),
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
                child: Text("6.What’s your targeted geographical location?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TargetLocationctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("7.Attach your competitors' websites below.",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: CompetitorsWebsitesctlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Website Information:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('8.In order to analyze the website, we need access to the following mentioned below.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Content Management:',style: TextStyle(fontSize: 16,color: Colors.deepPurple,),),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: WebAnalyzeCntrlr,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Domain:',style: TextStyle(fontSize: 16,color: Colors.deepPurple),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: DomainCntrlr,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.link_rounded),
                    hintText: "Enter Your Domain",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('9.Did you conduct Google Analytics reports previously?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                      hideWidget();
                      val = value as int;
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Visibility(
                visible: yes,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Google Analytics’ credentials:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: UserIdcntlr,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.link_rounded),
                          hintText: "Enter Your UserId",
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
                child: Text('10.Did you conduct google search Console for website previously?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                //onTap: showWidget,
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 1,
                  groupValue: val1,
                  onChanged: (value) {
                    setState(() {
                      showWidget1();
                      val1 = value as int;
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
                  groupValue: val1,
                  onChanged: (value) {
                    setState(() {
                      hideWidget1();
                      val1 = value as int;
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Visibility(
                visible: yes1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Google Search Console Credentials:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: Usercntlr,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.link_rounded),
                          hintText: "Enter Your UserId",
                          border: OutlineInputBorder(),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: _obscureText,
                        controller: PasswordCntlr,
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
                child: Text('11.Attach any additional files/documents you wish to share below',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: ()async{
                  selectFile();
                }, child: Text('Choose File')),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fileName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
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
                          uploadFile();
                          var firebaseUser =  FirebaseAuth.instance.currentUser;
                          firestoreInstance.collection("SEO Form").doc(firebaseUser!.email).set(
                              {
                                'Analytics UserID':UserIdcntlr.text,'Analytics Password':Passwordctlr.text,'Search Console UserId':Usercntlr.text,
                                'Upload FileName':fileName,'Website Link':WebURLctlr.text,'Business Type':BusinessTypectlr.text,'Short-Term-Goal':ShortGoalctlr.text,
                                'Unique Service':UniqueServicectlr.text,'Competitors Websites':CompetitorsWebsitesctlr.text,'Search Console UserId':PasswordCntlr.text,
                                'WebAnalyze': WebAnalyzeCntrlr.text,'Targeted Location':TargetLocationctlr.text,'Targeted Audience':TargetedAudiencectlr.text,
                                'Long Term Goal':LongGoalctlr.text,'Web Domain':DomainCntrlr.text
                              }
                          ).then((value) => {
                            UserIdcntlr.clear(),Passwordctlr.clear(),Usercntlr.clear(),PasswordCntlr.clear(),WebURLctlr.clear(),BusinessTypectlr.clear(),
                            UniqueServicectlr.clear(),CompetitorsWebsitesctlr.clear(),WebAnalyzeCntrlr.clear(),TargetLocationctlr.clear(),TargetedAudiencectlr.clear(),
                            DomainCntrlr.clear(),LongGoalctlr.clear(),ShortGoalctlr.clear()
                          });
                          Fluttertoast.showToast(
                              timeInSecForIosWeb: 1,
                              msg: "Your Details Submitted Successfully..!!!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.deepPurple,
                              textColor: Colors.white
                          );
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
  Future selectFile() async {

    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }
  Future uploadFile() async {
    if (file == null) return;
    final fileName = basename(file!.path);
    final destination = 'files/$fileName';
    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
    print(fileName);
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final snap = snapshot.data!;
        final progress = snap.bytesTransferred / snap.totalBytes;
        final percentage = (progress * 100).toStringAsFixed(2);
        return Text(
          '$percentage %',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        );
      } else {
        return Container();
      }
    },
  );
}