import 'package:chat/core/Models/register_model/register_model.dart';
import 'package:chat/core/bloc_auth_school/auth_school_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../school_home/SchoolInfoScr/SchoolInfoScr.dart';

class SchoolTap extends StatefulWidget {

  @override
  State<SchoolTap> createState() => _SchoolTapState();
}

class _SchoolTapState extends State<SchoolTap> {
  UserDataModel? data;
  String? id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthSchoolCubit()..getSchools(),
        child:  BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
            listener: (context, state) {

              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = AuthSchoolCubit.get(context).school;
              print('no daaaataaaa $cubit');
              return Scaffold(
                  body :
                  cubit ==null ?
                  Center(child: CircularProgressIndicator(),):cubit == []?const Center(child: Text('No data',style: TextStyle(
                  color: Colors.black87,fontSize: 40
              ),),):
                  ListView.builder(itemBuilder:(context,index) => InkWell(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (_)=> SchoolInfoScr(cubit[index])));

                      },
                      child: schoolList(cubit[index]))
                    ,itemCount: cubit.length, )
              );

            }));
  }
  Widget schoolList(SchoolModel? cubit) {
    return Padding(padding: EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Container(
        height: 65,
        width: MediaQuery
            .of(context)
            .size
            .width,
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
            SizedBox(width: 10,),
            CircleAvatar(
              child: cubit!.image == null
                  ? Image.asset('images/Loginlogo.png')
                  : ClipOval(child: Image.asset(
                cubit!.image!, fit: BoxFit.cover, width: 35, height: 35,)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cubit!.email!,
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ),
            IconButton(onPressed: () {
              print('ssss');
              print(cubit.name);
                  print(cubit.uId);
            }, icon: Icon(Icons.error_sharp))
          ],
        ),
      ),
    );
  }
}
