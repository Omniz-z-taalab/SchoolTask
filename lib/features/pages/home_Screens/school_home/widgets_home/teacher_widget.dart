import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/bloc_auth_school/auth_school_cubit.dart';
import '../../../../../core/network/cach_helper/cach_helper.dart';
import '../school_home.dart';

class TeacherWidget extends StatefulWidget {
  const TeacherWidget({Key? key}) : super(key: key);

  @override
  State<TeacherWidget> createState() => _TeacherWidgetState();
}

class _TeacherWidgetState extends State<TeacherWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwoedController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ganderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController unvController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController IdController = TextEditingController();
  var key = GlobalKey<FormState>();
  File? image;

  Future pickImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(()  {
        this.image = imageTemp;
      });
      print(image.path);
      print('weeweeee');
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthSchoolCubit(),
        child: BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
          listener: (context, state) {
            if (state is AddTeacherSuccessState) {
              print(state.model!.phone);
              if(state.model!.status == ' Teacher'){
                CacheHelper.saveData(key: 'user', value: state.model!.status);
                      Fluttertoast.showToast(msg: 'Teacher Created',backgroundColor: Colors.green,textColor: Colors.white);
                      Navigator.pop(context);
              }}
            if (state is AuthSchoolError) {
              Fluttertoast.showToast(msg: state.error,
                  backgroundColor: Colors.red,
                  textColor: Colors.white);
            }
          },
          builder: (context, state) {
            var cub = AuthSchoolCubit.get(context);
            return SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key:key ,
                  child: Column(children: [
                    // Center(
                    //   child: Image.network('https://assets8.lottiefiles.com/private_files/lf30_iraugwwv.json'),
                    // ),
                    // SizedBox(
                    //   height: 35,
                    // ),
                    // Center(
                    //   child: Text('Welcome Sir!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Container(
                              height: 600,
                              width: 300,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.blueAccent.shade100,
                                        Colors.blue.shade700
                                      ]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),

                                    Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Center(
                                      child: Stack(
                                        // clipBehavior: Clip.antiAliasWithSaveLayer,
                                        children: [
                                          image == null ?
                                          Image.asset(
                                            'images/Loginlogo.png',
                                            height: 150,
                                            width: 150,
                                          ):CircleAvatar(

                                            minRadius: 70,
                                            child: ClipOval(
                                              child: Image.file(
                                                image!,
                                                width: 150,
                                                height: 150,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 100.0,left: 100),
                                            child: IconButton(onPressed: () async{
                                              pickImage();
                                            }, icon: Icon(Icons.camera_alt_sharp)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    //
                                    // ),

                                    Column(children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Email',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      FormBotton(
                                          emailController, 'Enter Email', true),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Password',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      FormBotton(passwoedController,
                                          'Enter Password', false),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Subject',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      FormBottonName(
                                          subController, 'Enter Subject', true),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Universty',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      FormBotton(
                                          unvController, 'Enter Universty', true),
                                      const Padding(
                                        padding:
                                        EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment:
                                            Alignment.centerLeft,
                                            child: Text(
                                              'Age',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      botton(ageController, 'Enter your age',true),
                                      const  SizedBox(height: 15),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Id',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),
                                      const  SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0,left: 20),
                                  child: TextFormField(
                                    controller: IdController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        state == true ? Icons.home : Icons.person,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Enter id',
                                      hintStyle: TextStyle(color: Colors.white),
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 20.0),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(75.0),
                                          borderSide:
                                          const BorderSide(color: Colors.black12)),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 0),
                                        borderRadius: BorderRadius.circular(75.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(75.0),
                                          borderSide:
                                          const BorderSide(color: Colors.black12)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(75.0),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          )),
                                      errorText: null,
                                      errorStyle: const TextStyle(height: 0),
                                      isDense: true,

                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'invalid field';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                      SizedBox(
                                        height: 15,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'gender',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),
                                      const   SizedBox(
                                        height: 5,
                                      ),
                                      botton(ganderController,
                                          'Enter your gender', false),
                                      SizedBox(
                                        height: 15,
                                      ),

                                      const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Phone',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      FormBottonphone(
                                          phoneController, 'Enter phone'),
                                      const  SizedBox(height: 15),
                                      // SizedBox(height: 15,),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Name',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      FormBottonAddress(
                                          nameController, 'Enter Name', false),


                                      const  SizedBox(height: 15),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Address',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),
                                      const  SizedBox(height: 5),
                                      FormBottonAddress(
                                          addressController, 'Enter Address', true),

                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20),
                                        child: Container(
                                            width: 300,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if(image == null){
                                                  Fluttertoast.showToast(msg: 'invalid image',backgroundColor: Colors.red,textColor: Colors.white);
                                                }else
                                                if(key.currentState!.validate()){
                                                  print(emailController.text);
                                                  cub.addNewTeacher(
                                                    email:  emailController.text,
                                                    phone:      phoneController.text,
                                                    password:          passwoedController.text,
                                                    name:        nameController.text,
                                                    status:' Teacher',
                                                    gender: ganderController.text,
                                                    age: ageController.text,
                                                    image: image!.path,
                                                    sub: subController.text,
                                                    univ: unvController.text,
                                                  );
                                                };},
                                              child: Text(
                                                'Sign In',
                                                style:
                                                TextStyle(color: Colors.blue),
                                              ),
                                            )),
                                      )
                                    ],),

                                  ],
                                ),
                              )),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  Widget botton(TextEditingController controller, String name, bool icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child:  TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon == true ? Icons.person_2_rounded : Icons.female,
            color: Colors.white,
          ),
          hintText: name,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(75.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              )),
          errorText: null,
          errorStyle: const TextStyle(height: 0),
          isDense: true,

        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'invalid field';
          }
          return null;
        },
      ),
    );
  }

  Widget FormBotton(TextEditingController controller, String name, bool icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child:  TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon == true ? Icons.email : Icons.password,
            color: Colors.white,
          ),
          hintText: name,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(75.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              )),
          errorText: null,
          errorStyle: const TextStyle(height: 0),
          isDense: true,

        ),

        validator: (value) {
          if (value!.length < 3) {
            return 'invalid field';
          }
          return null;
        },
      ),
    );
  }

  Widget FormBottonphone(TextEditingController controller, String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.white,
          ),
          hintText: name,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(75.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              )),
          errorText: null,
          errorStyle: const TextStyle(height: 0),
          isDense: true,

        ),
        validator: (value) {
          if (value!.length < 3) {
            return 'invalid field';
          }
          return null;
        },
      ),
    );
  }

  Widget FormBottonName(
      TextEditingController controller, String name, bool state) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child:  TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            state == true ? Icons.home : Icons.subject_outlined,
            color: Colors.white,
          ),
          hintText: name,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(75.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              )),
          errorText: null,
          errorStyle: const TextStyle(height: 0),
          isDense: true,

        ),
        validator: (value) {
          if (value!.length < 3) {
            return 'invalid field';
          }
          return null;
        },
      ),
    );
  }

  Widget FormBottonAddress(
      TextEditingController controller, String name, bool state) {
    return  Padding(
      padding: const EdgeInsets.only(right: 20.0,left: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            state == true ? Icons.home : Icons.person,
            color: Colors.white,
          ),
          hintText: name,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(75.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide:
              const BorderSide(color: Colors.black12)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              )),
          errorText: null,
          errorStyle: const TextStyle(height: 0),
          isDense: true,

        ),
        validator: (value) {
          if (value!.length < 3) {
            return 'invalid field';
          }
          return null;
        },
      ),


    );
  }
}