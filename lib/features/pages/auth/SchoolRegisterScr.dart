import 'package:chat/core/bloc_auth_school/auth_school_cubit.dart';
import 'package:chat/features/pages/home_Screens/school_home/school_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolRegisterScr extends StatefulWidget {
  String email;
  String password;

  SchoolRegisterScr(this.email, this.password);

  @override
  State<SchoolRegisterScr> createState() => _SchoolRegisterScrState();
}

class _SchoolRegisterScrState extends State<SchoolRegisterScr> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwoedController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController inController = TextEditingController();
  TextEditingController ilocationController = TextEditingController();
  TextEditingController byController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController unvController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  var key = GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.password);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthSchoolCubit(),
      child: BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
        listener: (context, state) {
          if(state is CreateUserSuccess){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> SchoolHomeScr()));
          }
        },
        builder: (context, state) {
          var cub = AuthSchoolCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(children: [

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
                              child: Form(
                                key: key,
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
                                      child: Image.asset(
                                        'images/Loginlogo.png',
                                        height: 150,
                                        width: 150,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    //
                                    // ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Status',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: Container(
                                        height: 50,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.black12),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25.0),
                                          ),
                                        ),
                                        child: Center(child: Text('School SuperVisor',style: TextStyle(
                                          color: Colors.redAccent.shade700,fontSize: 20,
                                        ),)),
                                      ),
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

                                    SizedBox(
                                      height: 5,
                                    ),
                                    FormBotton(
                                        emailController, 'Enter Gender', true),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'age',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                 const   SizedBox(
                                      height: 5,
                                    ),
                                    FormBotton(passwoedController,
                                        'Enter your age', false),
                                   const SizedBox(
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
                                    SizedBox(
                                      height: 15,
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Name',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FormBottonName(
                                        nameController, 'Enter Name', true),
                                    SizedBox(
                                      height: 15,
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Fonder Name',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    formEstablished(
                                        byController, 'Enter Fonder Name', true),
                                    SizedBox(
                                      height: 15,
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Established Year',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    formEstablished(
                                        inController, 'Enter  Year', true),
                                    SizedBox(
                                      height: 15,
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Location',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    formEstablished(
                                        ilocationController, 'Enter  Location', true),

                                    SizedBox(
                                      height: 15,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Description',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    formDescrib(desController,'Enter School info'),
                                    SizedBox(
                                      height: 15,
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
                                              if(key.currentState!.validate()){
                                                print(widget.email);
                                                print(widget.password);
                                                cub.userCreate(
                                                    password: widget.password,
                                                    email: widget.email,
                                                    phone: phoneController.text,
                                                    name: nameController.text,
                                                    status: 'School SuperVisor',
                                                establesh_by: byController.text,
                                                establesh_in: inController.text,
                                                location: ilocationController.text,
                                                des:desController.text
                                                );
                                              }

                                            },
                                            child: Text(
                                              'Sign In',
                                              style:
                                              TextStyle(color: Colors.blue),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
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
    );
  }
  Widget formEstablished(TextEditingController controller, String name, bool icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child:  TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon == true ? Icons.location_on_outlined: Icons.account_circle_outlined,
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

  Widget FormBotton(TextEditingController controller, String name, bool icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child:  TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon == true ? Icons.female : Icons.password,
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

  Widget FormBottonName(TextEditingController controller, String name,
      bool state) {
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
  Widget formDescrib(TextEditingController controller, String name)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20),
      child: Container(
        height: 120,

        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          controller: controller,
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon:Icon(Icons.description,color: Colors.white,),
              border: InputBorder.none,
              hintText: name,
              hintStyle: TextStyle(color: Colors.white)
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

  }
  Widget FormBottonAddress(TextEditingController controller, String name,
      bool state) {
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
