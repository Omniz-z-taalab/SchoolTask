import 'package:chat/core/bloc_auth_school/auth_school_cubit.dart';
import 'package:chat/core/const.dart';
import 'package:chat/features/pages/auth/admin_login/admin_login.dart';
import 'package:chat/features/pages/home_Screens/admin_home/admin_home.dart';
import 'package:chat/features/pages/home_Screens/school_home/school_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/cach_helper/cach_helper.dart';
import 'features/pages/Splash/splash.dart';
import 'features/pages/auth/SchoolRegisterScr.dart';
import 'features/pages/home_Screens/admin_home/widgets_home/Schools_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
 // uid = CacheHelper.getData(key: 'uid')!;
Widget widget ;

 if(uid != null){
   widget = AdmenHomeScr();
 } else{
   widget = AdminLoginScr();
 }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
late final Widget startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthSchoolCubit()..getData(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashScreen()
      ),
    );
  }
}

