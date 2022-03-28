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

class ReputaionManagement_form4 extends StatefulWidget {
  const ReputaionManagement_form4({Key? key}) : super(key: key);

  @override
  State<ReputaionManagement_form4> createState() => _ReputaionManagement_form4State();
}

class _ReputaionManagement_form4State extends State<ReputaionManagement_form4> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController BusinessHoursctlr = TextEditingController();
  TextEditingController StartedYearctlr = TextEditingController();
  TextEditingController Areactlr = TextEditingController();
  TextEditingController Categoriesctlr = TextEditingController();
  TextEditingController Descriptionctlr = TextEditingController();
  TextEditingController Birthyearctlr = TextEditingController();
  TextEditingController GetCallCodectlr = TextEditingController();
  TextEditingController PaymentTypeCntrlr = TextEditingController();
  TextEditingController ServicePriorityCntrlr = TextEditingController();
  TextEditingController KeyWordsPriorityctlr = TextEditingController();
  TextEditingController Buyreasonsctlr = TextEditingController();
  TextEditingController BigCompetitorsctlr = TextEditingController();
  TextEditingController Offersctlr = TextEditingController();
  late String details;
  UploadTask? task;
  File? file;
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Reputation Management Form4',style: TextStyle(fontSize: 20),),
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
                  child: Text('Details Necessary for Listings Updates:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1.Hours Your Business Is Open Each Day:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: BusinessHoursctlr,
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
                      details = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.What Year Your Business Started?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: StartedYearctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('3.What Geographical Areas Do You Serve?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Areactlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('4.List the main categories and products or services',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Categoriesctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('5.Short description of your business to be used in the review directories',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Descriptionctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('6.Some directories require your year of birth for their information. What year would you like us to use?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Birthyearctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('7.A few directories require verification with an automated phone call to the business number. Who should we contact at your office to take the call and get the code?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: GetCallCodectlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('8.Types of Payment Accepted (Visa, Mastercard, Paypal, Check, etc):',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: PaymentTypeCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('9.Services Provided by Priority:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: ServicePriorityCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('10.Main Keywords by Priority:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: KeyWordsPriorityctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('11.Why Should Someone Buy From You or Use Your Service - What Separates You From Everyone Else? (up to 6):',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Buyreasonsctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('12.Who are your biggest competitors',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BigCompetitorsctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('13.Does your business have seasonal campaigns or special offers?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Offersctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('14.Include Images of your business that can be used on your review directories:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                              firestoreInstance.collection("Reputation Management Form4").doc(firebaseUser!.email).set(
                                  {
                                    "Upload FileName":fileName,'Business Hours':BusinessHoursctlr.text,'Business Started Year':StartedYearctlr.text,
                                    'Business Area':Areactlr.text,'Product Categories':Categoriesctlr.text,'Short Description':Descriptionctlr.text,
                                    'Birth Year':Birthyearctlr.text,'Verification Code':GetCallCodectlr.text,'Payment Types':PaymentTypeCntrlr.text,
                                    'Service Priority':ServicePriorityCntrlr.text,'Main Keywords':KeyWordsPriorityctlr.text,'Buying Reason':Buyreasonsctlr.text,
                                    'Biggest Competitor':BigCompetitorsctlr.text,'Special Offers':Offersctlr.text,
                                  }
                              ).then((value) => {
                                BusinessHoursctlr.clear(),StartedYearctlr.clear(),Areactlr.clear(),Categoriesctlr.clear(),Descriptionctlr.clear(),Birthyearctlr.clear(),
                                GetCallCodectlr.clear(),PaymentTypeCntrlr.clear(),ServicePriorityCntrlr.clear(),KeyWordsPriorityctlr.clear(),
                                Buyreasonsctlr.clear(),BigCompetitorsctlr.clear(),Offersctlr.clear()
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
                              firestoreInstance.collection("Reputation Management Form4").doc(firebaseUser!.email).set(
                                  {
                                    "Upload FileName":fileName,'Business Hours':BusinessHoursctlr.text,'Business Started Year':StartedYearctlr.text,
                                    'Business Area':Areactlr.text,'Product Categories':Categoriesctlr.text,'Short Description':Descriptionctlr.text,
                                    'Birth Year':Birthyearctlr.text,'Verification Code':GetCallCodectlr.text,'Payment Types':PaymentTypeCntrlr.text,
                                    'Service Priority':ServicePriorityCntrlr.text,'Main Keywords':KeyWordsPriorityctlr.text,'Buying Reason':Buyreasonsctlr.text,
                                    'Biggest Competitor':BigCompetitorsctlr.text,'Special Offers':Offersctlr.text,
                                  }
                              ).then((value) => {
                                BusinessHoursctlr.clear(),StartedYearctlr.clear(),Areactlr.clear(),Categoriesctlr.clear(),Descriptionctlr.clear(),Birthyearctlr.clear(),
                                GetCallCodectlr.clear(),PaymentTypeCntrlr.clear(),ServicePriorityCntrlr.clear(),KeyWordsPriorityctlr.clear(),
                                Buyreasonsctlr.clear(),BigCompetitorsctlr.clear(),Offersctlr.clear()
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
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);
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
