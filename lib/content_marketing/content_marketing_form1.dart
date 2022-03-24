import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ContentMarketing_form1 extends StatefulWidget {
  const ContentMarketing_form1({Key? key}) : super(key: key);

  @override
  State<ContentMarketing_form1> createState() => _ContentMarketing_form1State();
}

class _ContentMarketing_form1State extends State<ContentMarketing_form1> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController CompanyNamectlr = TextEditingController();
  TextEditingController StoreFrontctlr = TextEditingController();
  TextEditingController DateCntrlr = TextEditingController();
  TextEditingController Descriptionctlr = TextEditingController();
  TextEditingController Restrictionctlr = TextEditingController();
  TextEditingController Specialhistoryctlr = TextEditingController();
  TextEditingController Competitorsctlr = TextEditingController();
  TextEditingController ApartCompetitorsctlr = TextEditingController();
  TextEditingController BestCharatceristicsctlr = TextEditingController();
  TextEditingController PersonTypectlr = TextEditingController();
  TextEditingController PortrayCntrlr = TextEditingController();
  TextEditingController StrengthCntrlr = TextEditingController();
  TextEditingController GoalTacticsctlr = TextEditingController();
  TextEditingController Companyctlr = TextEditingController();
  TextEditingController LocalCompanySplctlr = TextEditingController();
  TextEditingController GeographicsAreasctlr = TextEditingController();
  late String companyname,storefront,date,description,restriction,special,competitors,company,goal,apart,strength,portray,person,characteristics;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Content Marketing Form1',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body:Form(
        key: _formkey,
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("1.What is your company's name?*",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: CompanyNamectlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.list_alt_rounded),
                      hintText: "Enter Company Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Please Enter Name';
                      }
                    },
                    onSaved: (String? value){
                      companyname = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.Does your business have a storefront?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: StoreFrontctlr,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.list_alt_rounded),
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Please Enter Details';
                      }
                    },
                    onSaved: (String? value){
                       storefront= value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('3.When was your company founded?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: true,
                    controller: DateCntrlr,
                    decoration: InputDecoration(
                      hintText: 'Select Date',
                      suffixIcon: Icon(Icons.calendar_today_rounded),
                    border: OutlineInputBorder(),
                    ),
                    onTap: () async{
                      await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2050),).then((SelectedDate) {
                        if(SelectedDate!=null){
                          DateCntrlr.text= DateFormat('dd-MM-yyyy').format(SelectedDate);
                        }
                      });
                    },
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Please Select Date';
                      }
                    },
                    onSaved: (String? value){
                      date= value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('4.Please provide a description/overview of your products or services* ',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                      validator: (String? value){
                        if(value!.isEmpty){
                          return 'Please Enter Details';
                        }
                      },
                      onSaved: (String? value){
                        description = value!;
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('5.Please explain any restrictions, legal requirements, or key business challenges or trends.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Restrictionctlr,
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
                          restriction = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('6.Does your company have a special or unique history that you would like to share with people?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Specialhistoryctlr,
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
                          special = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("7.What/Who are your company's top 3 competitors?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Competitorsctlr,
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
                          competitors = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('8.What sets you apart from your competitors?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: ApartCompetitorsctlr,
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
                          apart = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('9.What characteristics best describe your company?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BestCharatceristicsctlr,
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
                          characteristics = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('10.What kind of person should consider your product or service?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: PersonTypectlr,
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
                          person = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('11.What type of tone and person would you like to portray to potential clients?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: PortrayCntrlr,
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
                          portray = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('12.What are the core strengths of your business, and some accomplishments you are proud of?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: StrengthCntrlr,
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
                          strength = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("13.Tell us a little about your goals for your website and the tactics you'd like to use to achieve those goals* ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: GoalTacticsctlr,
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
                          goal = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('14.Is your company locally owned and operated?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Companyctlr,
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
                          company = value!;
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("15.For Local Companies: What's special about your city and its customers? Do you have any exceptional stories or staff members at this location?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: LocalCompanySplctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('16.For Local Companies: What geographic areas do you serve? ',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: GeographicsAreasctlr,
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
                            firestoreInstance.collection("Content Marketing Form1").doc(firebaseUser!.email).set(
                                {
                              'Company Name':Companyctlr.text,'Store Front':StoreFrontctlr.text,'Company Founded':DateCntrlr.text,'Product Description':Descriptionctlr.text,
                              'Company Restriction':Restrictionctlr.text,'Company History':Specialhistoryctlr.text,'Company Competitors':Competitorsctlr.text,'Apart Competitors':ApartCompetitorsctlr.text,
                              'Company Charateristics':BestCharatceristicsctlr.text,'Person Type':PersonTypectlr.text,'Client Portray':PortrayCntrlr.text,'Business Strength':StrengthCntrlr.text,
                              'Goal Tactics':GoalTacticsctlr.text,'Company Type':Companyctlr.text,'Local Company Details':LocalCompanySplctlr.text,'Company Area':GeographicsAreasctlr.text
                                }
                            ).then((value) => {
                              CompanyNamectlr.clear(),StoreFrontctlr.clear(),DateCntrlr.clear(),Descriptionctlr.clear(),Restrictionctlr.clear(),Specialhistoryctlr.clear(),
                              Competitorsctlr.clear(),ApartCompetitorsctlr.clear(),BestCharatceristicsctlr.clear(),PersonTypectlr.clear(),PortrayCntrlr.clear(),StrengthCntrlr.clear(),
                              GoalTacticsctlr.clear(),Companyctlr.clear(),LocalCompanySplctlr.clear(),GeographicsAreasctlr.clear()
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
        )
      ),
    );
  }
}
