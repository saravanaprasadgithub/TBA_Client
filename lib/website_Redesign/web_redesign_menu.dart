import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/landing_page.dart';
import 'package:first_app/website_Redesign/web_content_form.dart';
import 'package:first_app/website_Redesign/web_graphics_form.dart';
import 'package:first_app/website_Redesign/web_technical_form.dart';
import 'package:flutter/material.dart';

class Web_ReDesign extends StatefulWidget {
  const Web_ReDesign({Key? key}) : super(key: key);
  @override
  State<Web_ReDesign> createState() => _Web_ReDesignState();
}

class _Web_ReDesignState extends State<Web_ReDesign> {
  @override
  int currentStep = 0;
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Press Logout Icon to Exit'),));
    return WillPopScope(
      onWillPop: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainMenu()),);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Website Re-Design Development',style: TextStyle(fontSize: 20),),
          centerTitle: true,
          actions: [
            IconButton(
              icon:Icon(Icons.logout),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainMenu()),);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: Image.asset('assets/logo.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Website Development Requirements',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.deepPurple),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("TBA appreciates your onboarding with us. We need some requirements to create an effective website for your business.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
              ),
            SizedBox(
              height: 20,
            ),
              // Stepper(
              //   type: StepperType.vertical,
              //   steps: getSteps(),
              //   currentStep:currentStep,
              //   onStepTapped: (int step){
              //     setState(() {
              //       currentStep = step;
              //     });
              //   },
              //   onStepCancel: (){
              //     currentStep > 0 ?
              //     setState(() => currentStep -= 1) : null;
              //   },
              //   onStepContinue: (){
              //     currentStep < 2 ?
              //     setState(() => currentStep += 1): null;
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Redesign_technicalform()),);
                  },
                  icon: Icon(Icons.qr_code_outlined,color: Colors.white,),
                  label: Text('Technical Form',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Redesign_graphicsform()),);
                  },
                  icon: Icon(Icons.screen_rotation_outlined,color: Colors.white,),
                  label: Text('Creatives & Graphics Form',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Redesign_Contentform()),);
                  },
                  icon: Icon(Icons.book_outlined,color: Colors.white,),
                  label: Text('Content Form',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
        backgroundColor: Colors.deepPurple,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage('assets/logo2.png'),
                    fit: BoxFit.contain,
                  ),
                 // color: Colors.white
                ),
                accountName: Text("",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                accountEmail:Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Text(user.email!,style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w500),),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.qr_code_outlined,color: Colors.white,), title: Text("Technical Form",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Redesign_technicalform()),);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.screen_rotation_outlined,color: Colors.white,), title: Text("Creatives & Graphics Form",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Redesign_graphicsform()),);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.book_outlined,color: Colors.white,), title: Text("Content Form",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Redesign_Contentform()),);
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
  // List<Step> getSteps(){
  //   return [
  //     Step(
  //       title: Text(''),
  //       content: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: ElevatedButton.icon(
  //           onPressed: (){
  //             Navigator.push(context, MaterialPageRoute(builder: (context) => const technicalform()),);
  //           },
  //           icon: Icon(Icons.qr_code_outlined,color: Colors.white,),
  //           label: Text('Technical Form',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500)),
  //           style: ElevatedButton.styleFrom(
  //             primary: Colors.deepPurple,
  //             shape: new RoundedRectangleBorder(
  //               borderRadius: new BorderRadius.circular(10.0),
  //             ),
  //           ),
  //         ),
  //       ),
  //       isActive: currentStep>=0,
  //       state: currentStep == 0 ?
  //       StepState.editing : StepState.complete,
  //     ),
  //     Step(
  //       title: Text(''),
  //       content: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: ElevatedButton.icon(
  //           onPressed: (){
  //             Navigator.push(context, MaterialPageRoute(builder: (context) => const graphicsform()),);
  //           },
  //           icon: Icon(Icons.screen_rotation_outlined,color: Colors.white,),
  //           label: Text('Creatives & Graphics Form',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500)),
  //           style: ElevatedButton.styleFrom(
  //             primary: Colors.deepPurple,
  //             shape: new RoundedRectangleBorder(
  //               borderRadius: new BorderRadius.circular(10.0),
  //             ),
  //           ),
  //         ),
  //       ),
  //       isActive: currentStep >= 1,
  //       state: currentStep == 1 ?
  //       StepState.editing : currentStep < 1 ? StepState.disabled: StepState.complete,
  //     ),
  //     Step(
  //       title: Text(''),
  //       content: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: ElevatedButton.icon(
  //           onPressed: (){
  //             Navigator.push(context, MaterialPageRoute(builder: (context) => const contentform()),);
  //           },
  //           icon: Icon(Icons.book_outlined,color: Colors.white,),
  //           label: Text('Content Form',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500)),
  //           style: ElevatedButton.styleFrom(
  //             primary: Colors.deepPurple,
  //             shape: new RoundedRectangleBorder(
  //               borderRadius: new BorderRadius.circular(10.0),
  //             ),
  //           ),
  //         ),
  //       ),
  //       isActive:currentStep >= 2,
  //       state: currentStep == 2 ?
  //       StepState.editing : currentStep < 2 ? StepState.disabled: StepState.complete,
  //     )
  //   ];
  // }
}
