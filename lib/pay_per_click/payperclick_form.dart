import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/api/uploadapi.dart';

class Payperclick_form extends StatefulWidget {
  const Payperclick_form({Key? key}) : super(key: key);

  @override
  State<Payperclick_form> createState() => _Payperclick_formState();
}

class _Payperclick_formState extends State<Payperclick_form> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController UserIdcntlr = TextEditingController();
  TextEditingController Passwordctlr = TextEditingController();
  TextEditingController GSTcntlr = TextEditingController();
  TextEditingController Taxcntlr = TextEditingController();
  TextEditingController Pancntlr = TextEditingController();
  TextEditingController WebURLctlr = TextEditingController();
  TextEditingController UniqueServicectlr = TextEditingController();
  TextEditingController ProductServicectlr = TextEditingController();
  TextEditingController Budgetctlr = TextEditingController();
  TextEditingController CampaignGoalctlr = TextEditingController();
  TextEditingController AdCampaignCntrlr = TextEditingController();
  TextEditingController TargetLocationctlr = TextEditingController();
  TextEditingController TargetedAudiencectlr = TextEditingController();
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
        title: Text('Pay-Per-Click Form',style: TextStyle(fontSize: 20),),
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
          child: Text('Google AdWords:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('1.If you have Google AdWords Account.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                child: Text('Google Adword Credentials:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
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
          child: Text('2.If you don’t have Google AdWords Account, would you like us to create one for you?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                child: Text('Details:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: GSTcntlr,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.link_rounded),
                    hintText: "Enter Your GST No",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: Taxcntlr,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.link_rounded),
                    hintText: "Tax Identification Number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: Pancntlr,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.link_rounded),
                    hintText: "Permanent Account Number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Business Information:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('3.Add your website URL below.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
          child: Text('Website::',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('4.What products and/or services do you want to promote through the campaign?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: ProductServicectlr,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("5.What unique service do you offer that your competitors don't? ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
          child: Text('Campaign Plan::',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("6.What is your estimated budget for the campaign?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: Budgetctlr,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("7.What is your goal of the campaign? For example, to increase lead, sales, traffic.",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: CampaignGoalctlr,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('8.Which type of Ad campaign do you want to create? For example, Search ads, Display ads, Social ads, remarketing ad.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: AdCampaignCntrlr,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('9.What is your targeted location for the campaign?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
          child: Text('10.Who is your targeted audience?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                    firestoreInstance.collection("Pay-Per-Click Form").doc(firebaseUser!.email).set(
                        {
                         'UserID':UserIdcntlr.text,'Password':Passwordctlr.text,'GST No':GSTcntlr.text,'TAX No':Taxcntlr.text,
                         'PAN No':Pancntlr.text,'Upload FileName':fileName,'Website Link':WebURLctlr.text,'Campaign Promote':ProductServicectlr.text,
                          'Unique Service':UniqueServicectlr.text,'Campaign Budget':Budgetctlr.text,'Campaign Goal':CampaignGoalctlr.text,
                          'Ad Campaign': AdCampaignCntrlr.text,'Campaign Location':TargetLocationctlr.text,'Targeted Audience':TargetedAudiencectlr.text
                        }
                    ).then((value) => {
                      UserIdcntlr.clear(),Passwordctlr.clear(),GSTcntlr.clear(),Taxcntlr.clear(),Pancntlr.clear(),WebURLctlr.clear(),ProductServicectlr.clear(),
                      UniqueServicectlr.clear(),Budgetctlr.clear(),CampaignGoalctlr.clear(),AdCampaignCntrlr.clear(),TargetLocationctlr.clear(),TargetedAudiencectlr.clear()
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
