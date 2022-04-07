import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/website_Redesign/web_redesign_menu.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Redesign_graphicsform extends StatefulWidget {
  const Redesign_graphicsform({Key? key}) : super(key: key);
  @override
  State<Redesign_graphicsform> createState() => _Redesign_graphicsformState();
}

class _Redesign_graphicsformState extends State<Redesign_graphicsform> {
  int val = 2;
  int val1 =4;
  int val2=6;
  int val3 =8;
  int val4 =10;
  bool yes = false;
  bool yes1 = false;
  bool yes2 = false;
  bool yes3 = false;
  bool yes4 = false;
  void showWidget(){
    setState(() {
      yes = true ;
    });
  }
  void showWidget1(){
    setState(() {
      yes1 = true;
    });
  }
  void showWidget2(){
    setState(() {
      yes2 = true;
    });
  }
  void showWidget3(){
    setState(() {
      yes3 = true;
    });
  }
  void showWidget4(){
    setState(() {
      yes4 = true;
    });
  }
  void hideWidget(){
    setState(() {
      yes = false ;
    });
  }
  void hideWidget1(){
    setState(() {
      yes1 = false;
    });
  }
  void hideWidget2(){
    setState(() {
      yes2 = false;
    });
  }
  void hideWidget3(){
    setState(() {
      yes3 = false;
    });
  }
  void hideWidget4(){
    setState(() {
      yes4 = false;
    });
  }
  UploadTask? task;
  List<PlatformFile> f = [];
  List<PlatformFile> f1 = [];
  List<PlatformFile> f2 = [];
  List<PlatformFile> f3 = [];
  List<PlatformFile> f4 = [];
  PlatformFile? pickedFile,pickedFile1,pickedFile2,pickedFile3,pickedFile4;
  var userid = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final fileName= pickedFile!=null ? pickedFile!.name:'No File Selected';
    final fileName1= pickedFile1!=null ? pickedFile1!.name:'No File Selected';
    final fileName2= pickedFile2!=null ? pickedFile2!.name:'No File Selected';
    final fileName3= pickedFile3!=null ? pickedFile3!.name:'No File Selected';
    final fileName4= pickedFile4!=null ? pickedFile4!.name:'No File Selected';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Creatives & Graphics',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("1.Do you want to add your management person's image on the web page?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: ()async{
                            //pickFiles(File);
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
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("2.Do you need the Our Team section on the website199_Development?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 3,
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
                title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 4,
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
                child: Padding(
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("3.Can we include images of your clients in the testimonials section",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 5,
                  groupValue: val2,
                  onChanged: (value) {
                    setState(() {
                      showWidget2();
                      val2 = value as int;
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 6,
                  groupValue: val2,
                  onChanged: (value) {
                    setState(() {
                      hideWidget2();
                      val2 = value as int;
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Visibility(
                visible: yes2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: ()async{
                            //pickFiles2(File);
                            selectFile2();
                          }, child: Text('Choose File')
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          fileName2,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("4.Do you prefer us to use your images on the website199_Development’s sliders or any other portion?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 7,
                  groupValue: val3,
                  onChanged: (value) {
                    setState(() {
                      showWidget3();
                      val3 = value as int;
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 8,
                  groupValue: val3,
                  onChanged: (value) {
                    setState(() {
                      hideWidget3();
                      val3 = value as int;
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Visibility(
                visible: yes3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: ()async{
                            //pickFiles3(File);
                            selectFile3();
                          }, child: Text('Choose File')
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          fileName3,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("5.Do you have a business logo?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
              ),
              ListTile(
                title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 9,
                  groupValue: val4,
                  onChanged: (value) {
                    setState(() {
                      showWidget4();
                      val4 = value as int;
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              ListTile(
                title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                leading: Radio(
                  value: 10,
                  groupValue: val4,
                  onChanged: (value) {
                    setState(() {
                      hideWidget4();
                      val4 = value as int;
                    });
                  },
                  activeColor: Colors.deepPurple,
                ),
              ),
              Visibility(
                visible: yes4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: ()async{
                            //pickFiles4(File);
                            selectFile4();
                          }, child: Text('Choose File')
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          fileName4,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
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
                    onPressed: () async{
                      for(pickedFile in f ){
                        await uploadFile();
                      }
                      for(pickedFile1 in f1 ){
                        await uploadFile1();
                      }
                      for(pickedFile2 in f2 ){
                        await uploadFile2();
                      }
                      for(pickedFile3 in f3 ){
                        await  uploadFile3();
                      }
                      for(pickedFile4 in f4 ){
                        await  uploadFile4();
                      }
                          if(task!=null){
                            firestoreInstance.collection("Website Re-Design Graphics").doc(userid!.email).set(
                                {
                                  "Upload FileName":fileName,
                                  "Upload FileName1":fileName1,
                                  "Upload FileName2":fileName2,
                                  "Upload FileName3":fileName3,
                                  "Upload FileName4":fileName4,
                                }
                            ).then((value) => {
                              // busstypectlr.clear(),
                            });
                            await  task!.whenComplete(() {
                              Fluttertoast.showToast(
                                  timeInSecForIosWeb: 1,
                                  msg: "Your files Uploaded Successfully..!!!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white
                              );
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Web_ReDesign()),);
                            }
                            );
                          }else{
                            Fluttertoast.showToast(
                                timeInSecForIosWeb: 1,
                                msg: "No Files to Upload..!!!",
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
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);
    if(result==null) return;
    setState(() {
      f = result.files;
      pickedFile = result.files.first;
    });
  }
  Future selectFile1() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);
    if(result==null) return;
    setState(() {
      f1 = result.files;
      pickedFile1 = result.files.first;
    });
  }
  Future selectFile2() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);
    if(result==null) return;
    setState(() {
      f2 = result.files;
      pickedFile2 = result.files.first;
    });
  }
  Future selectFile3() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);
    if(result==null) return;
    setState(() {
      f3 = result.files;
      pickedFile3 = result.files.first;
    });
  }
  Future selectFile4() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);
    if(result==null) return;
    setState(() {
      f4 = result.files;
      pickedFile4 = result.files.first;
    });
  }
  Future uploadFile() async {
    final file = File(pickedFile!.path!);
    final path = 'Website Re-Design Graphics/${userid!.email}/${pickedFile!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      task=ref.putFile(file);
    });
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
  }
  Future uploadFile1() async {
    final file = File(pickedFile1!.path!);
    final path = 'Website Re-Design Graphics/${userid!.email}/${pickedFile1!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      task=ref.putFile(file);
    });
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
  }
  Future uploadFile2() async {
    final file = File(pickedFile2!.path!);
    final path = 'Website Re-Design Graphics/${userid!.email}/${pickedFile2!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      task=ref.putFile(file);
    });
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
  }
  Future uploadFile3() async {
    final file = File(pickedFile3!.path!);
    final path = 'Website Re-Design Graphics/${userid!.email}/${pickedFile3!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      task=ref.putFile(file);
    });
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
  }
  Future uploadFile4() async {
    final file = File(pickedFile4!.path!);
    final path = 'Website Re-Design Graphics/${userid!.email}/${pickedFile4!.name}';
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



