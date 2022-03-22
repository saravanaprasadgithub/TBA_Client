import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class creative_form extends StatefulWidget {
  const creative_form({Key? key}) : super(key: key);

  @override
  State<creative_form> createState() => _creative_formState();
}

class _creative_formState extends State<creative_form> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController Urlctlr = TextEditingController();
  TextEditingController ProductServicectlr = TextEditingController();
  TextEditingController Linkctlr = TextEditingController();
  TextEditingController FirstnameCntrlr = TextEditingController();
  TextEditingController LastnameCntrlr = TextEditingController();
  TextEditingController EmailCtrlr = TextEditingController();
  TextEditingController MobileCntrlr = TextEditingController();
  TextEditingController Addressctlr = TextEditingController();
  TextEditingController Ideactlr = TextEditingController();
  TextEditingController Colorctlr = TextEditingController();
  TextEditingController ContentAssistantctlr = TextEditingController();
  late String address,fname,lname,email,mobile;
  int val = 2;
  int val1 = 4;
  int ? val2;
var post;
  bool yes = false;
  bool yes1 = false;
  bool yes2 = false;
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
  Map<String, bool> values = {
    '1 Page Flyer': false,
    '2 Page Flyer': false,
    '4 Page Flyer': false,
    'Trifold': false,
    'Booklet': false,
    'Business cards': false,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Creative Service Form',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Business Information:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('1.Attach your website URL',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Urlctlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.link_rounded),
                      hintText: "Enter Your URL",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.What are the products/services you provide?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                  child: Text('3.Add your business location and contact details',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Business Location:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Linkctlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.link_rounded),
                      hintText: "Provide Link Here",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Contact Details:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
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
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: Addressctlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.location_on_outlined),
                      hintText: "Enter Your Business Address",
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
                  child: Text('Creative’s requirements:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('4.Do you prefer any ideas for your logo?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Ideactlr,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.list_alt_rounded),
                        hintText: "Enter Your Ideas",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('5.Any specific color does you want to focus on?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                ListTile(
                  //onTap: showWidget,
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
                  // onTap: showTextWidget,
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Colorctlr,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.list_alt_rounded),
                        hintText: "Enter Your Color",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('6.Do you want TBA to create a social media post for your social media platforms?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                ListTile(
                  //onTap: showWidget,
                  title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                  leading: Radio(
                    value: 5,
                    groupValue: val2,
                    onChanged: (value) {
                      setState(() {
                        //showWidget1();
                        post="Yes";
                        val2 = value as int?  ;
                        print(post);
                      });
                    },
                    toggleable: true,
                    activeColor: Colors.deepPurple,
                  ),
                ),
                ListTile(
                  // onTap: showTextWidget,
                  title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                  leading: Radio(
                    value: 6,
                    groupValue: val2,
                    onChanged: (value) {
                      setState(() {
                       // hideWidget1();
                        post = "No";
                        val2 = value as int?;
                        print(post);
                      });
                    },
                    toggleable: true,
                    activeColor: Colors.deepPurple,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('7.What type of brochure do you want?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                        );
                      }).toList()
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Content requirements:',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('8.Do you need any content assistant from our team for your brochures and social media post?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: ContentAssistantctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
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
                            var firebaseUser =  FirebaseAuth.instance.currentUser;
                            firestoreInstance.collection("Creative Services Form").doc(firebaseUser!.email).set(
                                {
                                  'Product/Services':ProductServicectlr.text,'WebURL':Urlctlr.text,
                                  'Bussiness Location':Linkctlr.text,'Mobile No':MobileCntrlr.text,
                                  'Address':Addressctlr.text,'FirstName':FirstnameCntrlr.text,
                                  'LastName':LastnameCntrlr.text,'Email-ID':EmailCtrlr.text,
                                  'Brochure Type':getCheckboxItems(),'Logo Ideas':Ideactlr.text,
                                  'Specific Color':Colorctlr.text,'Content Assistent':ContentAssistantctlr.text,
                                  'Create Social Media Post':post,
                                }
                            ).then((value) => {
                              Urlctlr.clear(),Linkctlr.clear(),Addressctlr.clear(),FirstnameCntrlr.clear(),LastnameCntrlr.clear(),EmailCtrlr.clear(),
                              MobileCntrlr.clear(),ProductServicectlr.clear(),Ideactlr.clear(),Colorctlr.clear(),ContentAssistantctlr.clear(),
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
      ),
    );
  }
}
