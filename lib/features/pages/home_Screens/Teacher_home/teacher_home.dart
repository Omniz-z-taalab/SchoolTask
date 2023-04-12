import 'package:chat/features/pages/home_Screens/Teacher_home/Techet_taps/class_tap.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/Techet_taps/perant_tap.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/Techet_taps/teachers_tap.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/widgets_home/class_widget.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/widgets_home/report_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc_auth_school/auth_school_cubit.dart';
import '../../../../core/network/cach_helper/cach_helper.dart';
import '../../auth/admin_login/admin_login.dart';

class TeacherHomeScr extends StatefulWidget {
  const TeacherHomeScr({Key? key}) : super(key: key);

  @override
  State<TeacherHomeScr> createState() => _TeacherHomeScrState();
}

class _TeacherHomeScrState extends State<TeacherHomeScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(id);
    print('ramdan kareem');
  }
  String? id;
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
          create: (context) => AuthSchoolCubit()..getData(),
          child: BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
          listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
    var cubit = AuthSchoolCubit.get(context).modell;
  return  Scaffold(
      appBar: AppBar(),
      drawer: Drawer(

        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Colors.blueAccent.shade100, Colors.blue.shade700]
                ),          ),
              child: Text('Hello Admin!'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: const Text('add Class'),
              onTap: ()async {
             var id =await   Navigator.push(context, MaterialPageRoute(builder: (_)=> ClassWidget()));
              id = id;
              print(id);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: const Text('add Report'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> ReportWidget()));
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.add),
            //   title: const Text('add '),
            //   onTap: () {
            //     print(id);
            //     // Navigator.push(context, MaterialPageRoute(builder: (_)=> ReportWidget()));
            //   },
            // ),

            SizedBox(height: 20,),
            Expanded(child: Padding(padding: EdgeInsets.only(right: 15,left: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(Colors.blue)),

                  onPressed: (){
                    CacheHelper.deleteData(key: 'user');
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AdminLoginScr()));
                  },
                  child: Text('Log Out',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),)
          ],
        ),
      ),

      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  height: 0.6,
                  width: double.infinity,
                  color:   Theme.of(context).backgroundColor
              ),
              const TabBar(
                // controller: _tabController,
                labelColor: Colors.black,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.black87,
                indicatorWeight: 3,
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    text: 'Teachers',
                  ),
                  Tab(
                    text: 'Class',
                  ),
                  Tab(
                    text: 'Paerant',
                  ),
                  
                ],
              ),
              Container(
                  height: 0.6,
                  width: double.infinity,
                  color:  Theme.of(context).backgroundColor
              ),
              Expanded(
                child: TabBarView(
                  // controller: _tabController,
                  children: [
                    TeacherTap(),
                    ClassTap(id),
                    PerantTap(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    },
          ),
      );
  }

}