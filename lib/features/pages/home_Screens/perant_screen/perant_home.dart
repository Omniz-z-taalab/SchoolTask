import 'package:chat/core/network/cach_helper/cach_helper.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/Techet_taps/class_tap.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/Techet_taps/perant_tap.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/Techet_taps/teachers_tap.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/widgets_home/class_widget.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/widgets_home/report_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc_auth_school/auth_school_cubit.dart';
import '../../auth/admin_login/admin_login.dart';
import 'drower/chat_screen.dart';
import 'drower/child_wedgit.dart';
import 'drower/setting.dart';
import 'drower/show_fees.dart';

class PerantHomeScr extends StatefulWidget {
  const PerantHomeScr({Key? key}) : super(key: key);

  @override
  State<PerantHomeScr> createState() => _PerantHomeScrState();
}

class _PerantHomeScrState extends State<PerantHomeScr> {
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
    return
      Scaffold(
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
              child: Text('Hello !'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: const Text('add child'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> ChildWidget()));
              },
            ),
            ListTile(
              leading: Icon(Icons.feed_sharp),
              title: const Text('show fees'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> ShowFees()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> SettingWedgit()));
              },
            ),
          ListTile(
            leading: Icon(Icons.chat),
            title: const Text('Chats'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> ChatScreen()));
            },
          ),
            SizedBox(height: 20,),
            Expanded(child: Padding(padding: EdgeInsets.only(right: 15,left: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  // color: Colors.blue
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
                    text: 'Schools',
                  ),
                  Tab(
                    text: 'Reports',
                  ),
                  Tab(
                    text: 'Activities',
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
                    ClassTap('d'),
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
    ),);
          }
}