import 'package:chat/core/bloc_auth_school/auth_school_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Models/register_model/register_model.dart';

class PerantTap extends StatefulWidget {

  @override
  State<PerantTap> createState() => _PerantTapState();
}

class _PerantTapState extends State<PerantTap> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AuthSchoolCubit()..getParent(),
      child:  BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
        listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      var cubit = AuthSchoolCubit.get(context).parent;
      return Scaffold(
          body :
          cubit !=null ?
          ListView.builder(itemBuilder:(context,index) => parentList(cubit[index])
            ,itemCount: cubit.length, ):Center(child: Text('No data'),)
      );

    }));
  }
  Widget parentList(ParentModel? cubit){
    return Padding(padding: EdgeInsets.only(right: 20,left: 20,top: 20),
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12,width: 0),
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
              child:cubit!.image == null ? Image.asset('images/Loginlogo.png'): ClipOval(child: Image.asset(cubit!.image!,fit: BoxFit.cover,width: 35,height: 35,)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cubit!.name!  ,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87),
                ),
              ),
            ),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.error_sharp))
          ],
        ),
      ),
    );
  }

}
