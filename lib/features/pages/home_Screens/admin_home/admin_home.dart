import 'package:chat/core/bloc_auth_school/auth_school_cubit.dart';
import 'package:chat/features/pages/home_Screens/admin_home/widgets_home/SchoolTap/school_tap.dart';
import 'package:chat/features/pages/home_Screens/admin_home/widgets_home/Schools_widget.dart';
import 'package:chat/features/pages/home_Screens/admin_home/widgets_home/director_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/cach_helper/cach_helper.dart';
import '../../auth/admin_login/admin_login.dart';
import '../Teacher_home/Techet_taps/class_tap.dart';
import '../Teacher_home/Techet_taps/perant_tap.dart';
import '../Teacher_home/Techet_taps/teachers_tap.dart';

class AdmenHomeScr extends StatefulWidget {
  const AdmenHomeScr({Key? key}) : super(key: key);

  @override
  State<AdmenHomeScr> createState() => _AdmenHomeScrState();
}

class _AdmenHomeScrState extends State<AdmenHomeScr> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthSchoolCubit()..getData(),
  child: BlocConsumer<AuthSchoolCubit, AuthSchoolState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AuthSchoolCubit.get(context).modell;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
      body:  DefaultTabController(
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
                    text: 'Schools',
                  ),

                  Tab(
                    text: 'Teachers',
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
                    SchoolTap(),
                    TeacherTap(),
                    PerantTap(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          title: const Text('add School'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> SchoolWidget()));
          },
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: const Text('add Director'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> DirectorWidget()));
          },
        ),
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
    );
  },
),
);
  }

}
