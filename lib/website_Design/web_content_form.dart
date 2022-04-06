import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/website_Design/webdesign_menu.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';


class design_Contentform extends StatefulWidget {
  const design_Contentform({Key? key}) : super(key: key);

  @override
  State<design_Contentform> createState() => _design_ContentformState();
}

class _design_ContentformState extends State<design_Contentform> {

  TextEditingController busstypectlr = TextEditingController();
  TextEditingController Productsctlr = TextEditingController();
  TextEditingController UniqueServctlr = TextEditingController();
  TextEditingController Missionctlr = TextEditingController();
  TextEditingController Descctlr = TextEditingController();
  TextEditingController Locationctlr = TextEditingController();
  TextEditingController Testctlr = TextEditingController();
  TextEditingController SeoCntrlr = TextEditingController();
  TextEditingController WebupdCntrlr = TextEditingController();
  TextEditingController AddfileCtrlr = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  late String bussinesstype;
  UploadTask? task;
  List<PlatformFile> f = [];
  PlatformFile? pickedFile;
  var userid = FirebaseAuth.instance.currentUser;
  getdata() async{
    final data =firestoreInstance.collection("Website Design Content").doc(userid!.email);
    final snapshot = await data.get();
    if(snapshot.exists){
      busstypectlr.text = snapshot['Business_Type'];
      Productsctlr.text= snapshot['Products'];
      UniqueServctlr.text = snapshot['Unique_Service'];
      Missionctlr.text=snapshot['Misson'];
      Descctlr.text =snapshot['Customer_Description'];
      Locationctlr.text = snapshot['Location'];
      Testctlr.text = snapshot['Testimonials'];
      SeoCntrlr.text = snapshot['SEO_Focus'];
      WebupdCntrlr.text =snapshot['Website_Update'];
      AddfileCtrlr.text =snapshot['AdditionalFiles'];
    }
  }
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
        title: Text('Content Side',style: TextStyle(fontSize: 20),),
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
                  child: Text('1.What is your business type?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: busstypectlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value){
                if(value!.isEmpty){
                return 'Please Enter Business Type';
                }
                },
                    onSaved: (String? value){
                      bussinesstype = value!;
                    },
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.What are the services/products you provide?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Productsctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('3.What is the unique service you provide that your competitors don’t?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: UniqueServctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('4.What are your Mission and Vision?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Missionctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('5.Share your targeted customer description',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Descctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('6.Do you focus on any particular targeted location for business?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Locationctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('7.Share your testimonial details',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Testctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('8.How do you want your website content to be? SEO focused or non-SEO focused.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: SeoCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('9.Would you like the content of the website to be updated regularly?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: WebupdCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('10.Attach any additional files/documents you wish to share below',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: AddfileCtrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
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
                      onPressed: ()async{
                        if(_formkey.currentState!.validate())
                        {
                          try{
                            for(pickedFile in f ){
                              await uploadFile();
                            }
                          if(task!=null){
                            firestoreInstance.collection("Website Design Content").doc(userid!.email).set(
                                {
                                  'Business_Type':busstypectlr.text,'Products':Productsctlr.text,
                                  'Unique_Service':UniqueServctlr.text,'Misson':Missionctlr.text,
                                  'Customer_Description':Descctlr.text,'Location':Locationctlr.text,
                                  'Testimonials':Testctlr.text,'SEO_Focus':SeoCntrlr.text,
                                  'Website_Update':WebupdCntrlr.text,'AdditionalFiles':AddfileCtrlr.text,
                                  'Upload_FileName':fileName,
                                }
                            ).then((value) => {
                              busstypectlr.clear(),Productsctlr.clear(),UniqueServctlr.clear(),Missionctlr.clear(),Descctlr.clear(),
                              Locationctlr.clear(),Testctlr.clear(),SeoCntrlr.clear(),WebupdCntrlr.clear(),AddfileCtrlr.clear(),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Web_Design()),);
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
                            firestoreInstance.collection("Website Design Content").doc(userid!.email).set(
                                {
                                  'Business_Type':busstypectlr.text,'Products':Productsctlr.text,
                                  'Unique_Service':UniqueServctlr.text,'Misson':Missionctlr.text,
                                  'Customer_Description':Descctlr.text,'Location':Locationctlr.text,
                                  'Testimonials':Testctlr.text,'SEO_Focus':SeoCntrlr.text,
                                  'Website_Update':WebupdCntrlr.text,'AdditionalFiles':AddfileCtrlr.text,
                                  'Upload_FileName':fileName,
                                }
                            ).then((value) => {
                              busstypectlr.clear(),Productsctlr.clear(),UniqueServctlr.clear(),Missionctlr.clear(),Descctlr.clear(),
                              Locationctlr.clear(),Testctlr.clear(),SeoCntrlr.clear(),WebupdCntrlr.clear(),AddfileCtrlr.clear(),
                            });
                            Fluttertoast.showToast(
                                timeInSecForIosWeb: 1,
                                msg: "Your Details Submitted Successfully..!!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.deepPurple,
                                textColor: Colors.white
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Web_Design()),);
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
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if(result==null) return;
    setState(() {
      f = result.files;
      pickedFile = result.files.first;
    });
  }
  Future uploadFile() async {
    final file = File(pickedFile!.path!);
    final path = 'files/${userid!.email}/${pickedFile!.name}';
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
