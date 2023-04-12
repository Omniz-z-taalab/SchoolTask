import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:bloc/bloc.dart';
import 'package:chat/core/Models/register_model/register_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../const.dart';
import '../network/cach_helper/cach_helper.dart';

part 'auth_school_state.dart';

class AuthSchoolCubit extends Cubit<AuthSchoolState> {
  AuthSchoolCubit() : super(AuthSchoolInitial());

  static AuthSchoolCubit get(context) => BlocProvider.of(context);

  //Auth
  void userRegister({ email,  phone , password, name, status,gender,age,image,des,establesh_by,establesh_in,location,sub,univ}){
    print(password);
    print(status);
    print('password  isssssssss');
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        CacheHelper.saveData(key: 'uid', value: value.user!.uid);
        print(CacheHelper.getData(key: 'uid'));

          userCreate(name:name, phone:phone, email:email, status:status,id: value.user!.uid
              ,password:password,gender:gender,age:age,image:image,establesh_by:establesh_by,establesh_in:establesh_in,location: location);
          }).catchError((error){
        print('3333333333');
        print(error.toString());
       emit(AuthSchoolError(error.toString()));
        print(error);
      });
  }
  void userLogin(String email, String password){
    print('ddddd');
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
            CacheHelper.saveData(key: 'uid', value: value.user!.uid);
            getData(id:CacheHelper.getData(key: 'uid'));
            emit(AuthLoginSchoolSuccess(value.user!.uid));
      }).catchError((error){
        emit(AuthLoginSchoolError(error.toString()));
        print(error);
      });
  }
   userCreate( {String? name,String?  phone, String ? email,String? status,String? id,String? password, String? gender, String? age, String? image, String? establesh_by, String? establesh_in,String? location,String? des}){
    print(password);
    print('zayeeed');
    uid = CacheHelper.getData(key: 'uid');
    print(uid);
    print('uid issssssssssss');
    UserDataModel model = UserDataModel(name: name,email: email,phone: phone,status: status,uId: id,password: password,gander: gender,age: age,image: image);
    FirebaseFirestore.instance.collection('users').doc(uid).set(model.toMap()).then((value) {
      print('youssef');
      emit(CreateUserSuccess(model));
    }).catchError((onError) {
      print(onError.toString());
      emit(CreateUserError(onError.toString()));
    });
  }
  UserDataModel? modell;
  void getData ({String? id}){
    uid = CacheHelper.getData(key: 'uid');
      print(id);
      print(uid);
    FirebaseFirestore.instance.collection('users').doc(id).get().then((value) {
      print(value.data().toString());
      modell = UserDataModel.fromJson(value.data()!);
      print(modell!.email);
      emit(LoginSuccess());
    }).catchError((onError){
      print(onError);
    });
  }
  SchoolModel? model;
  void getSch ({String? id}){
    uid = CacheHelper.getData(key: 'uid');
    print(id);
    print(uid);
    FirebaseFirestore.instance.collection('addSchool').doc(id).get().then((value) {
      print(value.data().toString());
      model = SchoolModel.fromJson(value.data()!);
      print(modell!.email);
      emit(LoginSuccess());
    }).catchError((onError){
      print(onError);
    });
  }

//addUsers
  addNewParent( {String? name,String?  phone, String ? email,String? status,String? id,String? password, String? gender, String? age, String? image}){
    print(password);
    uid = CacheHelper.getData(key: 'uid');
    print(uid);

    ParentModel model = ParentModel(name: name,email: email,phone: phone,status: status,uId: id,password: password,gander: gender,age: age,image: image);
    FirebaseFirestore.instance.collection('addParent').add(model.toMap()).then((value) {
      emit(AddParentSuccessState(model));
    }).catchError((onError) {
      print(onError.toString());
      emit(AddParentErrorState(onError));
    });

  }
  List<TeacherModel> teach =[];
  addNewTeacher( {String? name,String?  phone, String ? email,String? status
    ,String? id,String? password, String? gender, String? age,
    String? image,String? sub,String? univ}) async{
    print(password);
    uid = CacheHelper.getData(key: 'uid');
    print(uid);

TeacherModel model = TeacherModel(name:name,phone:phone
    ,email: email,status:status,uId:id,password: password,
    image: image,gander: gender,age: age);
    FirebaseFirestore.instance.collection('users').doc(uid).update({'data': FieldValue.arrayUnion([model.toMap()])
    }).then((value) {
      print('faaaaaaada');
      print(model.age);
      emit(AddTeacherSuccessState(model));
    }).catchError((onError){
      emit(AddTeacherErrorState(onError));


    });
  }
  String? id;
  addNewClass ({String? name , String? date,String? educationLivel}){
    ClassModel? classModel = ClassModel(name: name,DateTime: date, educational_level: educationLivel);
        print(date);
    FirebaseFirestore.instance.collection('users').doc(uid).collection('class').add(classModel.toMap()).then((value) {
      print(value.toString());
       CacheHelper.saveData(key: 'classId', value: value.id);
       // id = value.id;
       print(id);
      emit(TimeAddSuccessState(value.id));

    });

    print(date);

  }
  String? classId ;

  addUpdateClass ({String? id,String? name , String? date,String? educationLivel}){
     // classId = CacheHelper.getData(key: 'classId');
     print(classId);
    uid = CacheHelper.getData(key: 'uid');
    print(classId);
     print(id);
     print('>>>>>>>>>>>>>>>>>>>>>>>clasId<<<<<<<<<<<<<<<<<<<<<<');
    print(id);
    ClassModel? classModel = ClassModel(name: name,DateTime: date, educational_level: educationLivel);
        print(classModel.name);
        print(classModel.educational_level);
        print(classModel.id);

    FirebaseFirestore.instance.collection('users').doc(uid).collection('class').doc(classModel!.id).update(
        {'name':classModel!.name,
          'DateTime': classModel.DateTime,
          'educational_level':classModel!.educational_level})
        .then((value){
          print(classModel!.educational_level);
          print('wqewqeeqweqwe');
      getClass();
      // emit(TimeUpdateSuccessState());

    })
        .catchError((onError){
          print(onError);
          // emit(ClassU)
    });
    print(classModel!.name);
}
List<ParentModel> parent =[];
  getParent(){
    FirebaseFirestore.instance
        .collection('addParent').get().then((value) {
          print(value.size);
          value.docs.forEach((element) {
            parent.add(ParentModel.fromJson(element.data()));
          });
          emit(GetParentSuccessState());
    }).catchError((onError){
          print(onError);
          emit(GetParentErrorState());

    });
  }
//////////////////////////////////////////
  //teacher
  List<TeacherModel> teacher =[
  ];
  getTeacher(){
    uid = CacheHelper.getData(key: 'uid');
    FirebaseFirestore.instance
        .collection('users').doc(uid).get().then((value) {
      print(value.data()!);
        teacher.add(TeacherModel.fromJson(value.data()!));
        print('sadasd');
        print(teacher.first.name);
      emit(GetTeacherSuccessState(teacher));

    }).catchError((onError){
      print(onError);
      emit(GetTeacherErrorState());

    });
  }
  ////////////////////////////////////////
//school
  List<SchoolModel> school =[];
  String? idd;
  getSchools(){
    FirebaseFirestore.instance
        .collection('addSchool').get().then((value) {

      print(value);
      value.docs.forEach((element) {
        school.add(SchoolModel.fromJson(element.data()));
        // getSchoolInfo(element.id);
      });
      emit(GetSchoolSuccessState());
    }).catchError((onError){
      print(onError);
      emit(GetSchoolErrorState());

    });
  }
  SchoolModel? schoolModel;


  List<ClassModel> classs =[];
  getClass(){
    FirebaseFirestore.instance
        .collection('users').doc(uid).collection('class').get().then((value) {
      print(value.docs.first.id.toString());
      value.docs.forEach((element) {
        classs.add(ClassModel.fromSnapshot(element));
        print(classs.first.id);
        print(id);
        print('ewrewrwerwerwer');

      });
      emit(TimeUpdateSuccessState());
      // emit(GetSchoolSuccessState());
    }).catchError((onError){
      print(onError);
      emit(GetSchoolErrorState());

    });
  }
}
