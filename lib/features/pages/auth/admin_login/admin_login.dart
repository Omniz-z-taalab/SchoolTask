import 'package:chat/core/bloc_auth_school/auth_school_cubit.dart';
import 'package:chat/features/pages/auth/admin_login/register.dart';
import 'package:chat/features/pages/home_Screens/admin_home/admin_home.dart';
import 'package:chat/features/pages/home_Screens/perant_screen/perant_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/network/cach_helper/cach_helper.dart';
import '../../home_Screens/Teacher_home/teacher_home.dart';
import '../../home_Screens/school_home/school_home.dart';
import '../SchoolRegisterScr.dart';

class AdminLoginScr extends StatefulWidget {
  const AdminLoginScr({Key? key}) : super(key: key);

  @override
  State<AdminLoginScr> createState() => _AdminLoginScrState();
}

class _AdminLoginScrState extends State<AdminLoginScr> {
  TextEditingController controller = TextEditingController();
  TextEditingController passwoedController = TextEditingController();
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthSchoolCubit(),
      child: BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
        listener: (context, state) {
          var model = AuthSchoolCubit.get(context).modell;
          if (state is AuthLoginSchoolSuccess) {

            } else if (model!.status == 'Parent') {
                      CacheHelper.saveData(key: 'user', value: model.status);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PerantHomeScr()));
            } else if (model!.status == 'Teacher') {
              CacheHelper.saveData(key: 'user', value: model.status);

              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PerantHomeScr()));
            } else if (model.status == 'School SuperVisor') {
            if (model!.established_by != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          SchoolHomeScr()));
    CacheHelper.saveData(key: 'user', value: model.status);
    }else{
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) =>
    SchoolRegisterScr(model!.email!, model.password!)));}

            } else {
              print('sssssss');
              CacheHelper.saveData(key: 'user', value: 'Admin');

              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AdmenHomeScr()));
            }
          if (state is AuthLoginSchoolError) {
            Fluttertoast.showToast(
                msg: state.error.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          var cubit = AuthSchoolCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(children: [
                  // Center(
                  //   child: Image.network('https://assets8.lottiefiles.com/private_files/lf30_iraugwwv.json'),
                  // ),
                  SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: Text(
                      'Welcome Sir!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Form(
                      key: key,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: Center(
                          child: Container(
                              height: 500,
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
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Center(
                                    child: Image.asset(
                                      'images/Loginlogo.png',
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
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
                                  FormBotton(controller, 'Enter Email', true),
                                  SizedBox(
                                    height: 20,
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
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: Container(
                                        width: 300,
                                        // decoration: BoxDecoration(
                                        //   border: Border.all(color: Colors.black12),
                                        //   borderRadius: BorderRadius.circular(10),
                                        // ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (key.currentState!.validate()) {
                                              cubit.userLogin(controller.text,
                                                  passwoedController.text);
                                            }
                                          },
                                          child: Text(
                                            'Sign In',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => AdminRegisterScr()));
                                    },
                                    child:  Text(
                                      'Are you Parent?',
                                      style: TextStyle(color: Colors.red.shade900,fontSize: 20,shadows: [
                                        Shadow(color: Colors.black87,blurRadius: .15,offset: Offset(.8,.8))
                                      ]),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget FormBotton(TextEditingController controller, String name, bool icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon == true ? Icons.email : Icons.password,
            color: Colors.white,
          ),
          hintText: name,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide: const BorderSide(color: Colors.black12)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(75.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(75.0),
              borderSide: const BorderSide(color: Colors.black12)),
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

Widget Next(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20),
    child: Container(
        width: 300,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black12),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => TeacherHomeScr()));
          },
          child: Text(
            'Sign In',
            style: TextStyle(color: Colors.blue),
          ),
        )),
  );
}
