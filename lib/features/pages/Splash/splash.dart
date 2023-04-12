import 'dart:async';

import 'package:chat/core/network/cach_helper/cach_helper.dart';
import 'package:chat/features/pages/auth/admin_login/admin_login.dart';
import 'package:chat/features/pages/home_Screens/Teacher_home/teacher_home.dart';
import 'package:chat/features/pages/home_Screens/admin_home/admin_home.dart';
import 'package:chat/features/pages/home_Screens/school_home/school_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_Screens/perant_screen/perant_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
    ()=> ifUser());

  }
  ifUser()async{
    if(CacheHelper.getData(key: 'user') == 'Parent'){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => PerantHomeScr()));
      print('eeee');
    }else if(CacheHelper.getData(key: 'user') == ' Teacher'){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => TeacherHomeScr()));
      print('aaaaa');

    }
    else if(CacheHelper.getData(key: 'user') == 'School SuperVisor'){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => SchoolHomeScr()));
      print('bbbbb');

    }
    else if(CacheHelper.getData(key: 'user') == 'Admin'){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => AdmenHomeScr()));
      print('ccccc');

    }else if(CacheHelper.getData(key: 'user') == null ){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => AdminLoginScr()));
      print('ddddddddd');

    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image.asset('images/splash.gif'),
      ),
    );
  }
}
