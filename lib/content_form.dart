import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class contentform extends StatefulWidget {
  const contentform({Key? key}) : super(key: key);

  @override
  State<contentform> createState() => _contentformState();
}

class _contentformState extends State<contentform> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Content Side',style: TextStyle(fontSize: 20),),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
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
              )
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
                final result = await FilePicker.platform.pickFiles(
                  // type: FileType.custom,
                  // allowedExtensions: ['jpg']
                );
                if(result==null) return;
                final file = result.files.first;
                print('FileName:${file.name}');
                print('FileSize:${file.size}');
                print('FileType:${file.extension}');
              }, child: Text('Choose File')),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70,30,70,10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange
                ),
                child: Text("Submit",style: TextStyle(fontSize: 20,color: Colors.white),),
                onPressed: (){
                  if(_formkey.currentState!.validate())
                  {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const Menu()),
                    // );
                    print("successful");
                    return;
                  }else{
                    print("UnSuccessfull");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
