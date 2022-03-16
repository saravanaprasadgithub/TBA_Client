import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';

class graphicsform extends StatefulWidget {
  const graphicsform({Key? key}) : super(key: key);
  @override
  State<graphicsform> createState() => _graphicsformState();
}

class _graphicsformState extends State<graphicsform> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
  FilePickerResult? result;
  PlatformFile? file,file1,file2,file3,file4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Creatives & Graphics',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
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
                            pickFiles(File);
                          }, child: Text('Choose File')
                      ),
                      if (file!=null)
                      fileDetails(file!),],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("2.Do you need the Our Team section on the website?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                            pickFiles1(File);
                          }, child: Text('Choose File')
                      ),
                      if (file1!=null)
                        fileDetails(file1!),],
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
                            pickFiles2(File);
                          }, child: Text('Choose File')
                      ),
                      if (file2!=null)
                        fileDetails(file2!),],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("4.Do you prefer us to use your images on the website’s sliders or any other portion?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                            pickFiles3(File);
                          }, child: Text('Choose File')
                      ),
                      if (file3!=null)
                        fileDetails(file3!),],
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
                            pickFiles4(File);
                          }, child: Text('Choose File')
                      ),
                      if (file4!=null)
                        fileDetails(file4!),],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(70,10,70,10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple
                    ),
                    child: Text("Submit",style: TextStyle(fontSize: 20),),
                    onPressed: (){
                      if(_formkey.currentState!.validate())
                      {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const Reset_Password()),
                        // );
                        print("successful");
                        return;
                      }else{
                        print("UnSuccessfull");
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
  void pickFiles(File) async{
     result = await FilePicker.platform.pickFiles(
         allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']
    );
     if(result==null) return;
     file = result!.files.first;
     setState(() {});
  }
  void pickFiles1(File) async{
    result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']
    );
    if(result==null) return;
    file1 = result!.files.first;
    setState(() {});
  }
  void pickFiles2(File) async{
    result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']
    );
    if(result==null) return;
    file2 = result!.files.first;
    setState(() {});
  }
  void pickFiles3(File) async{
    result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']
    );
    if(result==null) return;
    file3 = result!.files.first;
    setState(() {});
  }
  void pickFiles4(File) async{
    result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg','jpeg','png','gif']
    );
    if(result==null) return;
    file4 = result!.files.first;
    setState(() {});
  }
 Widget fileDetails(PlatformFile file){
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(
      width: 150,
        child: Text('FileName:${file.name}')),
Text('FileSize:${file.size}'),
  ],
);
  }
}



