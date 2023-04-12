import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../teacher_home.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({Key? key}) : super(key: key);

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  TextEditingController controller = TextEditingController();
  TextEditingController passwoedController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
            Navigator.pop(context);
          },),
          title: Text('Reports'),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Center(child: Padding(padding: EdgeInsets.all(50),
            child: Container(
              height: 500,
              width: 300,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [Colors.blueAccent.shade100, Colors.blue.shade700]
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,

                  ),
                  Center(
                    child: Image.asset('images/fees-removebg-preview.png',height: 150,width: 150,),
                  ),
                  const Center(child: Text('Add Report',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),

                  SizedBox(
                    height: 20,

                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Align(alignment:Alignment.centerLeft,child: Text('Report',style: TextStyle(color: Colors.white),)),
                  ),
                  SizedBox(height: 5,),
                  FormBotton(controller,'Pdf',true),
                  SizedBox(
                    height: 20,
                  ),


                  SizedBox(height: 20,),
                  Next(context)
                ],
              ),
            ),
          ),),
        )
    );
  }
  Widget FormBotton(TextEditingController controller, String name, bool icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          controller: controller,

          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon:icon == true ? Icon(Icons.picture_as_pdf,color: Colors.white,):Icon(Icons.event_available,color: Colors.white,),
              border: InputBorder.none,
              hintText: name,
              hintStyle: TextStyle(color: Colors.white)
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  Widget Next(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20),
      child: Container(
          width: 300,

          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.black12),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: ElevatedButton(onPressed: () {    Navigator.push(context, MaterialPageRoute(builder: (_)=> TeacherHomeScr()));
          ;
          }, child: Text('add',style: TextStyle(color: Colors.black),),

          )
      ),
    );
  }

}
