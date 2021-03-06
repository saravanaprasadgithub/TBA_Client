import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/reputation_management/reputation_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:file_picker/file_picker.dart';


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
  List<PlatformFile> f = [];
  PlatformFile? pickedFile;
  var userid = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    final fileName= pickedFile!=null ? pickedFile!.name:'No File Selected';
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
                      onPressed: () async{
                        if(_formkey.currentState!.validate())
                        {
                          try{
                            for(pickedFile in f ){
                              await uploadFile();
                            }
                            if(task!=null){
                              firestoreInstance.collection("Reputation Management Form4").doc(userid!.email).set(
                                  {
                                    "Upload_FileName":fileName,'Business_Hours':BusinessHoursctlr.text,'Business_Started_Year':StartedYearctlr.text,
                                    'Business_Area':Areactlr.text,'Product_Categories':Categoriesctlr.text,'Short_Description':Descriptionctlr.text,
                                    'Birth_Year':Birthyearctlr.text,'Verification_Code':GetCallCodectlr.text,'Payment_Types':PaymentTypeCntrlr.text,
                                    'Service_Priority':ServicePriorityCntrlr.text,'Main_Keywords':KeyWordsPriorityctlr.text,'Buying_Reason':Buyreasonsctlr.text,
                                    'Biggest_Competitor':BigCompetitorsctlr.text,'Special_Offers':Offersctlr.text,
                                  }
                              ).then((value) => {
                                BusinessHoursctlr.clear(),StartedYearctlr.clear(),Areactlr.clear(),Categoriesctlr.clear(),Descriptionctlr.clear(),Birthyearctlr.clear(),
                                GetCallCodectlr.clear(),PaymentTypeCntrlr.clear(),ServicePriorityCntrlr.clear(),KeyWordsPriorityctlr.clear(),
                                Buyreasonsctlr.clear(),BigCompetitorsctlr.clear(),Offersctlr.clear()
                              });
                             await task!.whenComplete(() {
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
                              firestoreInstance.collection("Reputation Management Form4").doc(userid!.email).set(
                                  {
                                    "Upload_FileName":fileName,'Business_Hours':BusinessHoursctlr.text,'Business_Started_Year':StartedYearctlr.text,
                                    'Business_Area':Areactlr.text,'Product_Categories':Categoriesctlr.text,'Short_Description':Descriptionctlr.text,
                                    'Birth_Year':Birthyearctlr.text,'Verification_Code':GetCallCodectlr.text,'Payment_Types':PaymentTypeCntrlr.text,
                                    'Service_Priority':ServicePriorityCntrlr.text,'Main_Keywords':KeyWordsPriorityctlr.text,'Buying_Reason':Buyreasonsctlr.text,
                                    'Biggest_Competitor':BigCompetitorsctlr.text,'Special_Offers':Offersctlr.text,
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
  getdata()async{
    final data =firestoreInstance.collection("Reputation Management Form4").doc(userid!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      BusinessHoursctlr.text = snapshot['Business_Hours'];
      StartedYearctlr.text= snapshot['Business_Started_Year'];
      Areactlr.text = snapshot['Business_Area'];
      Categoriesctlr.text=snapshot['Product_Categories'];
      Descriptionctlr.text =snapshot['Short_Description'];
      Birthyearctlr.text = snapshot['Birth_Year'];
      GetCallCodectlr.text = snapshot['Verification_Code'];
      PaymentTypeCntrlr.text = snapshot['Payment_Types'];
      ServicePriorityCntrlr.text =snapshot['Service_Priority'];
      KeyWordsPriorityctlr.text =snapshot['Main_Keywords'];
      Buyreasonsctlr.text = snapshot['Buying_Reason'];
      BigCompetitorsctlr.text = snapshot['Biggest_Competitor'];
      Offersctlr.text = snapshot['Special_Offers'];
    }
  }
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);
    if(result==null) return;
    setState(() {
      f = result.files;
      pickedFile = result.files.first;
    });
  }
  Future uploadFile() async {
    final file = File(pickedFile!.path!);
    final path = 'Reputation Management Form4/${userid!.email}/${pickedFile!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      task=ref.putFile(file);
    });
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
  }
  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if(snapshot.hasData){
        final data =snapshot.data!;
        double progress = data.bytesTransferred/data.totalBytes;
        return SizedBox(
          height: 50,
          child: Stack(
            fit: StackFit.expand,
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey,
                color: Colors.green,
              ),
              Center(
                child: Text(
                  '${(100 * progress).roundToDouble()}%',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    },
  );
}
