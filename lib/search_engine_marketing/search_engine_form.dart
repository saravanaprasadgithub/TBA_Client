import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/search_engine_marketing/search_engine_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class seach_engine_form extends StatefulWidget {
  const seach_engine_form({Key? key}) : super(key: key);

  @override
  State<seach_engine_form> createState() => _seach_engine_formState();
}

class _seach_engine_formState extends State<seach_engine_form> {

  TextEditingController Advertisingctlr = TextEditingController();
  TextEditingController GoogleAdwordsctlr = TextEditingController();
  TextEditingController MarketingGoalsctlr = TextEditingController();
  TextEditingController Competitorsctlr = TextEditingController();
  TextEditingController UniqueSellingctlr = TextEditingController();
  TextEditingController TargetedAudiencectlr = TextEditingController();
  TextEditingController Demographicsctlr = TextEditingController();
  TextEditingController GeopgraphicalAreaCntrlr = TextEditingController();
  TextEditingController SeasonalProductsCntrlr = TextEditingController();
  TextEditingController BusinessDescriptionctlr = TextEditingController();
  TextEditingController BestSellingctlr = TextEditingController();
  TextEditingController PromotionDiscountctlr = TextEditingController();
  TextEditingController SpecificKeywordsctlr = TextEditingController();
  TextEditingController MailIdcntlr = TextEditingController();
  TextEditingController PasswordCntlr = TextEditingController();
  TextEditingController MailIdcntlr1 = TextEditingController();
  TextEditingController PasswordCntlr1 = TextEditingController();
  TextEditingController detailscntlr = TextEditingController();
  TextEditingController detailscntlr1 = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  late String goals;
  bool _obscureText = true;
  int ? val ;
  int ? val1 ;
  int ? val2;
  int ? val3;
  var Rtext;
  bool yes2 = false;
  bool yes1 = false;
  bool yes = false;
  bool no = true;
  bool no1 = false;
  bool no2 =false;
  void showWidget1(){
    setState(() {
      yes1 = true ;
      no1 = false ;
    });
  }
  void showWidget2(){
    setState(() {
      yes2 = true ;
      no2 = false ;
    });
  }
  void hideWidget1(){
    setState(() {
      yes1 = false ;
      no1 = true ;
    });
  }
  void hideWidget2(){
    setState(() {
      yes2 = false ;
      no2 = true ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Search Engine Service',style: TextStyle(fontSize: 20),),
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
                  child: Text('1.Are you currently doing any advertising for your business? Please provide details',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: Advertisingctlr,
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
                      goals = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('2.Do you have an existing Google Adwords Account? If yes, please provide your customer ID number?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: GoogleAdwordsctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('3.What are your marketing goals?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: MarketingGoalsctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('4.Who are your direct competitors? (Provide name and website URL’s)',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('5.How are you different than the competition? What is your unique selling position?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: UniqueSellingctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('6.Who is your target audience? Please explain each segment and what aspects of your business are targeted to them.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                  child: Text('7.What are the demographics of your target audience? (Ex. Age, Gender, Marital Status, etc.)',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: Demographicsctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('8.Which geographical area(s) do you want to target?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: GeopgraphicalAreaCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('9.Do you have seasonal products or services? If yes, please provide details.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: SeasonalProductsCntrlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('10.List some keywords that describe your business. Think from a customer’s point of view.?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BusinessDescriptionctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('11.What are your best-selling products or services? Please explain in detail.',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: BestSellingctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('12.Do you have any promotions, discounts or incentives that you want to mention in your ad campaign?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: PromotionDiscountctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('13.Do you request any specific keyword phrases to be included in your campaign?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: SpecificKeywordsctlr,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('14.Do You Have Google Analytics Account?',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                        child: TextFormField(
                          controller: MailIdcntlr,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.link_rounded),
                            hintText: "Enter Your MailId",
                            border: OutlineInputBorder(),
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: _obscureText,
                          controller: PasswordCntlr,
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
                Visibility(
                  visible: no1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Do you prefer us to create one?',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: detailscntlr,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.link_rounded),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("15.Do You Have Google Map's Account?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                ListTile(
                  //onTap: showWidget,
                  title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                  leading: Radio(
                    value: 3,
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
                  // onTap: showTextWidget,
                  title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                  leading: Radio(
                    value: 4,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: MailIdcntlr1,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.link_rounded),
                            hintText: "Enter Your MailId",
                            border: OutlineInputBorder(),
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: _obscureText,
                          controller: PasswordCntlr1,
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
                Visibility(
                  visible: no2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Do you prefer us to create one?',style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: detailscntlr1,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.link_rounded),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("16.Do You Prefer TBA to Edit or Add a new page on your website?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                ListTile(
                  //onTap: showWidget,
                  title: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                  leading: Radio(
                    value: 19,
                    groupValue: val3,
                    onChanged: (value) {
                      setState(() {
                        //showWidget1();
                        Rtext="Yes";
                        val3 = value as int?  ;
                        print(Rtext);
                      });
                    },
                    activeColor: Colors.deepPurple,
                  ),
                ),
                ListTile(
                  // onTap: showTextWidget,
                  title: Text("No",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                  leading: Radio(
                    value: 20,
                    groupValue: val3,
                    onChanged: (value) {
                      setState(() {
                        // hideWidget1();
                        Rtext = "No";
                        val3 = value as int?;
                        print(Rtext);
                      });
                    },
                    activeColor: Colors.deepPurple,
                  ),
                ),
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
                            var firebaseUser =  FirebaseAuth.instance.currentUser;
                            firestoreInstance.collection("Search Engine Marketing").doc(firebaseUser!.email).set(
                                {
                                  'Advertising Details':Advertisingctlr.text,'Google Adwords':GoogleAdwordsctlr.text,
                                  'Marketing Goals':MarketingGoalsctlr.text,'Competitors':Competitorsctlr.text,
                                  'Unique Selling':UniqueSellingctlr.text,'Targeted Audience':TargetedAudiencectlr.text,
                                  'Targeted Audience Demographics':Demographicsctlr.text,'Targeted Area':GeopgraphicalAreaCntrlr.text,
                                  'Seasonal Products or Services':SeasonalProductsCntrlr.text,'Business Description':BusinessDescriptionctlr.text,
                                  'Best Selling':BestSellingctlr.text,'Promotion Discount':PromotionDiscountctlr.text,
                                  'Specific-Keywords':SpecificKeywordsctlr.text,'Google Analytics Mail-Id':MailIdcntlr.text,
                                  'Google Analytics Password':PasswordCntlr.text,'Edit Website':Rtext,'Gmap Id':MailIdcntlr1.text,
                                  'Gmap Password':PasswordCntlr1.text
                                }
                            ).then((value) => {
                              Advertisingctlr.clear(),GoogleAdwordsctlr.clear(),MarketingGoalsctlr.clear(),Competitorsctlr.clear(),UniqueSellingctlr.clear(),
                              TargetedAudiencectlr.clear(),Demographicsctlr.clear(),GeopgraphicalAreaCntrlr.clear(),SeasonalProductsCntrlr.clear(),BusinessDescriptionctlr.clear(),
                              BestSellingctlr.clear(),PromotionDiscountctlr.clear(),SpecificKeywordsctlr.clear(),MailIdcntlr.clear(),PasswordCntlr.clear(),
                              MailIdcntlr1.clear(),PasswordCntlr1.clear()
                            });
                            Fluttertoast.showToast(
                                timeInSecForIosWeb: 1,
                                msg: "Your Details Submitted Successfully..!!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.deepPurple,
                                textColor: Colors.white
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchEngine_Menu()),);
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
