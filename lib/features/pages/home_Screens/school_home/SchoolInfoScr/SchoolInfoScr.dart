import 'package:chat/core/Models/register_model/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc_auth_school/auth_school_cubit.dart';

class SchoolInfoScr extends StatefulWidget {
 SchoolModel? model;
 SchoolInfoScr(this.model);

  @override
  State<SchoolInfoScr> createState() => _SchoolInfoScrState();
}

class _SchoolInfoScrState extends State<SchoolInfoScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.uId);
    // print(widget.model!.teacher!.last.email);
    print('cvcvcvcvc');
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthSchoolCubit(),
        child:  BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
        listener: (context, state) {

      // TODO: implement listener
    },
    builder: (context, state) {
    // var cubit = AuthSchoolCubit.get(context).modell;
    // print('no daaaataaaa ${cubit!}');
    return Scaffold(
      appBar: AppBar(
        title: Text('School Info'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  // SizedBox(height: 60,),
                CircleAvatar(
                  minRadius: 20,
                  maxRadius: 60,
                  child: widget.model!.image == null
                      ? Image.asset('images/Loginlogo.png')
                      : ClipOval(child: Image.asset(
                    widget.model!.image!, fit: BoxFit.cover, width: 35, height: 35,)),
                ),
              const  SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    widget.model!.name!,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                ),
                const  SizedBox(
                  height: 15,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const  Icon(Icons.email_outlined),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        widget.model!.email!,
                        style:const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontSize: 25
                        ),
                      ),
                    ],
                  ),
                ),
                const  SizedBox(
                  height: 15,
                ),
                Center(
                  child:Text('Info..')
                ),
                SizedBox(height: 8,),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0,left: 15),
                    child: Container(
                      // height: MediaQuery.of(context).size.height*.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black26)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'widget.model!.description!sadasdsadsadas aseqrq'
                              'dsadasd'
                              'sarreqq'
                              'dsfadsffd',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(Icons.phone),
                SizedBox(
                  width: 8,
                ),
                Text('123456789',style: TextStyle(fontSize: 20),),
              ],
            ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Giza',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text('Established in :',style: TextStyle(fontSize: 20),),
                  SizedBox(
                    width: 8,
                  ),
                  Text('2012',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }));
}
}
