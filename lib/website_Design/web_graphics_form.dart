import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/website_Design/webdesign_menu.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:first_app/api/uploadapi.dart';

class design_graphicsform extends StatefulWidget {
  const design_graphicsform({Key? key}) : super(key: key);
  @override
  State<design_graphicsform> createState() => _design_graphicsformState();
}

class _design_graphicsformState extends State<design_graphicsform> {
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
  File? file,file1,file2,file3,file4;
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    final fileName1 = file1 != null ? basename(file1!.path) : 'No File Selected';
    final fileName2 = file2 != null ? basename(file2!.path) : 'No File Selected';
    final fileName3 = file3 != null ? basename(file3!.path) : 'No File Selected';
    final fileName4 = file4 != null ? basename(file4!.path) : 'No File Selected';
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
                    onPressed: (){
                      if(task !=null)
                      {
                        try{
                          uploadFile();
                          uploadFile1();
                          uploadFile2();
                          uploadFile3();
                          uploadFile4();
                          Fluttertoast.showToast(
                              timeInSecForIosWeb: 1,
                              msg: "Wait for Complete Upload..!!!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.deepOrange,
                              textColor: Colors.white
                          );
                          var firebaseUser =  FirebaseAuth.instance.currentUser;
                          firestoreInstance.collection("Website Design Graphics").doc(firebaseUser!.email).set(
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
                          task!.whenComplete(() {
                            Fluttertoast.showToast(
                                timeInSecForIosWeb: 1,
                                msg: "Your files Uploaded Successfully..!!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Web_Design()),);
                          }
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
  Future selectFile2() async {

    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file2 = File(path));
  }
  Future selectFile3() async {

    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file3 = File(path));
  }
  Future selectFile4() async {

    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']);

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file4 = File(path));
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
  Future uploadFile2() async {
    if (file2 == null) return;
    final fileName2 = basename(file2!.path);
    final destination = 'files/$fileName2';
    task = FirebaseApi.uploadFile(destination, file2!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
    print(fileName2);
  }
  Future uploadFile3() async {
    if (file3 == null) return;
    final fileName3 = basename(file3!.path);
    final destination = 'files/$fileName3';
    task = FirebaseApi.uploadFile(destination, file3!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
    print(fileName3);
  }
  Future uploadFile4() async {
    if (file4 == null) return;
    final fileName4 = basename(file4!.path);
    final destination = 'files/$fileName4';
    task = FirebaseApi.uploadFile(destination, file4!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
    print(fileName4);
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
      }
      else {
        return Container();
      }
    }
  );
}



