import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/reputation_management/reputation_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:first_app/api/uploadapi.dart';
import 'package:path/path.dart';

class ReputaionManagement_form2 extends StatefulWidget {
  const ReputaionManagement_form2({Key? key}) : super(key: key);

  @override
  State<ReputaionManagement_form2> createState() => _ReputaionManagement_form2State();
}

class _ReputaionManagement_form2State extends State<ReputaionManagement_form2> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController FirstnameCntrlr = TextEditingController();
  TextEditingController LastnameCntrlr = TextEditingController();
  TextEditingController EmailCtrlr = TextEditingController();
  TextEditingController PostalCodeCntrlr = TextEditingController();
  TextEditingController Addressctlr = TextEditingController();
  TextEditingController Address1ctlr = TextEditingController();
  TextEditingController Statecntrlr = TextEditingController();
  TextEditingController MobileCntrlr = TextEditingController();
  TextEditingController Citycntrlr = TextEditingController();
  TextEditingController GoodEmailctlr = TextEditingController();
  TextEditingController BadEmailctlr = TextEditingController();
  TextEditingController fontctlr = TextEditingController();
  late String address,fname,lname,email,mobile,state,city,postal;
  UploadTask? task;
  File? file,file1;
  @override
  void initState() {
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    final fileName1 = file1 != null ? basename(file1!.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Reputation Management Form2',style: TextStyle(fontSize: 20),),
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
                  child: Text('Decision Maker Information:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1.Name',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                  child: Text('3.Email',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                  child: Text('5.List all email addresses that need to receive alerts for new good reviews:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: GoodEmailctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('6.List all email addresses that need to receive alerts for new bad reviews:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BadEmailctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Do You Have Multiple Business Locations?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Branding Information:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1.Do you have a preferred font?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fontctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.Upload Logo',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: ()async{
                            //pickFiles3(File);
                            selectFile();
                          }, child: Text('Choose File')
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          fileName,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('3.Do you have any other branding images or files you would like to share?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: ()async{
                            // pickFiles1(File);
                            selectFile1();
                          }, child: Text('Choose File')
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          fileName1,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                task != null ? buildUploadStatus(task!) : Container(),
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
                            uploadFile();
                            uploadFile1();
                            if(task!=null){
                              Fluttertoast.showToast(
                                  timeInSecForIosWeb: 1,
                                  msg: "Wait for Complete Upload..!!!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.deepOrange,
                                  textColor: Colors.white
                              );
                              var firebaseUser =  FirebaseAuth.instance.currentUser;
                              firestoreInstance.collection("Reputation Management Form2").doc(firebaseUser!.email).set(
                                  {
                                    'First Name':FirstnameCntrlr.text,'Last Name':LastnameCntrlr.text,'Address1':Addressctlr.text,'Address2':Address1ctlr.text,
                                    'City':Citycntrlr.text,'State':Statecntrlr.text,'PostalCode':PostalCodeCntrlr.text,'Company Email':EmailCtrlr.text,
                                    'Company Mobile':MobileCntrlr.text,'Good Receive Email':GoodEmailctlr.text,'Bad Receive Email':BadEmailctlr.text,
                                    'Preferred Font':fontctlr.text, "Upload FileName":fileName,"Upload FileName1":fileName1,
                                  }
                              ).then((value) => {
                                FirstnameCntrlr.clear(),Addressctlr.clear(),Address1ctlr.clear(),Citycntrlr.clear(),Statecntrlr.clear(),PostalCodeCntrlr.clear(),
                                EmailCtrlr.clear(),MobileCntrlr.clear(),LastnameCntrlr.clear(),GoodEmailctlr.clear(),BadEmailctlr.clear(),fontctlr.clear()
                              });
                              task!.whenComplete(() {
                                Fluttertoast.showToast(
                                    timeInSecForIosWeb: 1,
                                    msg: "Your files & Details Uploaded Successfully..!!!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white
                                );
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReputationManagement_Menu()),);
                              }
                              );
                            }
                            else{
                              Fluttertoast.showToast(
                                  timeInSecForIosWeb: 1,
                                  msg: "No Files to Upload..!!!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.deepOrange,
                                  textColor: Colors.white
                              );
                              var firebaseUser =  FirebaseAuth.instance.currentUser;
                              firestoreInstance.collection("Reputation Management Form2").doc(firebaseUser!.email).set(
                                  {
                                    'First_Name':FirstnameCntrlr.text,'Last_Name':LastnameCntrlr.text,'Address1':Addressctlr.text,'Address2':Address1ctlr.text,
                                    'City':Citycntrlr.text,'State':Statecntrlr.text,'PostalCode':PostalCodeCntrlr.text,'Company_Email':EmailCtrlr.text,
                                    'Company_Mobile':MobileCntrlr.text,'Good_Receive_Email':GoodEmailctlr.text,'Bad_Receive_Email':BadEmailctlr.text,
                                    'Preferred_Font':fontctlr.text, "Upload_FileName":fileName,"Upload_FileName1":fileName1,
                                  }
                              ).then((value) => {
                                FirstnameCntrlr.clear(),Addressctlr.clear(),Address1ctlr.clear(),Citycntrlr.clear(),Statecntrlr.clear(),PostalCodeCntrlr.clear(),
                                EmailCtrlr.clear(),MobileCntrlr.clear(),LastnameCntrlr.clear(),GoodEmailctlr.clear(),BadEmailctlr.clear(),fontctlr.clear()
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
    final data =firestoreInstance.collection("Reputation Management Form2").doc(firebaseUser!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      Address1ctlr.text = snapshot['Address2'];
      MobileCntrlr.text= snapshot['Company_Mobile'];
      Addressctlr.text = snapshot['Address1'];
      Citycntrlr.text=snapshot['City'];
      Statecntrlr.text =snapshot['State'];
      PostalCodeCntrlr.text = snapshot['PostalCode'];
      GoodEmailctlr.text = snapshot['Good_Receive_Email'];
      BadEmailctlr.text = snapshot['Bad_Receive_Email'];
      FirstnameCntrlr.text =snapshot['First_Name'];
      LastnameCntrlr.text =snapshot['Last_Name'];
      EmailCtrlr.text = snapshot['Company_Email'];
      fontctlr.text = snapshot['Preferred_Font'];
    }
  }
  Future selectFile() async {

    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }
  Future selectFile1() async {

    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file1 = File(path));
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
  Future uploadFile1() async {
    if (file1 == null) return;
    final fileName1 = basename(file1!.path);
    final destination = 'files/$fileName1';
    task = FirebaseApi.uploadFile(destination, file1!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
    print(fileName1);
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
