import 'dart:convert';

import 'package:chat/core/Models/register_model/register_model.dart';
import 'package:chat/core/bloc_auth_school/auth_school_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class UpDateClass extends StatefulWidget {
  ClassModel? time;
   UpDateClass(this.time, {Key? key}) : super(key: key);

  @override
  State<UpDateClass> createState() => _UpDateClassState();
}

class _UpDateClassState extends State<UpDateClass> {
  DateTime? _chosenDateTime;

  // Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(context) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 500,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosenDateTime = val;
                      });
                    }),
              ),
            ],
          ),
        ));}
  TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController educationConttroller = TextEditingController();
  @override
  String? data;
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.time!.name);
    // data = jsonDecode(widget.time);
    // print(data);
    nameController.text = widget.time!.name!;
    educationConttroller.text = widget.time!.educational_level!;
    controller.text = widget.time!.DateTime!;

    print('dateeee');
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthSchoolCubit()
      ,
      child: BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
        listener: (context, state) {
          if(state is TimeUpdateSuccessState){
            // print(state);
            Fluttertoast.showToast(msg: 'Class Updated',backgroundColor: Colors.green);
            Navigator.pop(context);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AuthSchoolCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
                  Navigator.pop(context);
                },),
                title: Text('class'),
                centerTitle: true,
              ),

              body: SingleChildScrollView(
                child: Center(child: Padding(padding: EdgeInsets.all(50),
                  child: SingleChildScrollView(
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,

                            ),
                            Stack(
                              children: [
                                Center(child: CircleAvatar(backgroundColor: Colors.white,minRadius: 70,),),
                                Center(
                                  child: Image.asset('images/class-removebg-preview.png',height: 150,width: 150,),
                                ),
                              ],
                            ),
                            const Center(child: Text('Add Class',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),

                            SizedBox(
                              height: 20,

                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Align(alignment:Alignment.centerLeft,child: Text('Class',style: TextStyle(color: Colors.white),)),
                            ),
                            SizedBox(height: 5,),
                            FormBotton(nameController,true),
                            SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Align(alignment:Alignment.centerLeft,child: Text('Class',style: TextStyle(color: Colors.white),)),
                            ),
                            SizedBox(height: 5,),
                            FormBotton(educationConttroller,true),
                            SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child: MyTextForm(
                                  controller: controller,
                                  // name: widget.time['DateTime'],
                                  type: TextInputType.datetime,
                                  radius: 10.0,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2025-08-31'),
                                    ).then((value) {
                                      controller.text =
                                          DateFormat.yMMMd().format(value!);
                                      debugPrint(DateFormat.yMMMd().format(value));
                                    });
                                  },
                                  validator: (String? value) {},
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0,right: 20),
                              child: Container(
                                  width: 300,
                                  child: ElevatedButton(onPressed: () {
                                    cubit.addUpdateClass(
                                        name: nameController.text,
                                        date: controller.text,
                                        educationLivel: educationConttroller.text
                                    );
                                    // Navigator.push(context, MaterialPageRoute(builder: (_)=> TeacherHomeScr()));
                                  }, child: Text('Edit ',style: TextStyle(color: Colors.black),),

                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),),
              )
          );
        },
      ),
    );
  }
  Widget FormBotton(TextEditingController controller, bool icon) {
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
              prefixIcon:icon == true ? Icon(Icons.cast_for_education_outlined,color: Colors.white,):Icon(Icons.event_available,color: Colors.white,),
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white)
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }


}
class MyTextForm extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? type;
  final FormFieldValidator<String>?validator;
  final GestureTapCallback?onTap;
  final double radius;
  final IconData? suffix;
  final Function()? suffixPressed;
  String? name;
  // final Color color;
   MyTextForm({
    Key? key,
    // required this.color,
    required this.controller,
    this.type,
    required this.validator,
    this.onTap,
    this.radius = 0.0,
    this.suffix,
    this.suffixPressed,
    this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: validator,
        onTap: onTap,
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.red)),
            fillColor:  Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(Icons.timer,color: Colors.white,),
             hintText: name.toString(),
            hintStyle: TextStyle(color: Colors.white)
        ),
      ),
    );
  }
}