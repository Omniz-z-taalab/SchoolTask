import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Models/register_model/register_model.dart';
import '../../../../../core/bloc_auth_school/auth_school_cubit.dart';
import '../../../../../core/network/cach_helper/cach_helper.dart';
import 'UpdateClass/UpdateClass.dart';

class ClassTap extends StatefulWidget {
  @override
  String? id;
  ClassTap(this.id);
  State<ClassTap> createState() => _ClassTapState();
}

class _ClassTapState extends State<ClassTap> {
  var uid = CacheHelper.getData(key: 'uid');
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
    print('qqqqqqqqqqqqqq');
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthSchoolCubit()..getClass(),
        child: BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
            listener: (context, state) {
              if (state is GetTeacherSuccessState) {
              }
            }, builder: (context, state) {
          var cubit = AuthSchoolCubit.get(context).classs;
          return Scaffold(
            body:cubit == null ? const Center(child: CircularProgressIndicator()
            )
                :cubit.length == 0 ?const Center(child: Text('No Data'),)
                :ListView.builder(itemBuilder: (context, index)=> InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> UpDateClass(cubit[index])));
                },
                child:
                teacherList(cubit[index])),itemCount: cubit.length ,)
          );
        }));
  }

  Widget teacherList(ClassModel cubit) {
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
            // CircleAvatar(
            //   child: cubit['image'] == null
            //       ? Image.asset('images/Loginlogo.png')
            //       : ClipOval(
            //       child: Image.network(
            //         cubit['image']!,
            //         fit: BoxFit.cover,
            //         width: 35,
            //         height: 35,
            //       )),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cubit.name!,
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
