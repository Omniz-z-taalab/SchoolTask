import 'package:chat/core/network/cach_helper/cach_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Models/register_model/register_model.dart';
import '../../../../../core/bloc_auth_school/auth_school_cubit.dart';

class TeacherTap extends StatefulWidget {
  @override
  State<TeacherTap> createState() => _TeacherTapState();
}

class _TeacherTapState extends State<TeacherTap> {
  List<TeacherModel>? teacher;
 var uid = CacheHelper.getData(key: 'uid');
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthSchoolCubit()..getTeacher(),
        child: BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
            listener: (context, state) {
          if (state is GetTeacherSuccessState) {
            teacher = state.teacher!;
          }
        }, builder: (context, state) {
          var cubit = AuthSchoolCubit.get(context).teacher;
          return Scaffold(
              body:FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .get(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    var data = snapshot.data.data();
                    var drinks = data['data'];

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: drinks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return teacherList(drinks[index]);
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator(),);
                  }
                },
              ),);
        }));
  }

  Widget teacherList( cubit) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 0),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              child: cubit['image'] == null
                  ? Image.asset('images/Loginlogo.png')
                  : ClipOval(
                      child: Image.network(
                      cubit['image']!,
                      fit: BoxFit.cover,
                      width: 35,
                      height: 35,
                    )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cubit['name'],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.error_sharp))
          ],
        ),
      ),
    );
  }
}
