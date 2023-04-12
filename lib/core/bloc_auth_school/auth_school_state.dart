part of 'auth_school_cubit.dart';

@immutable
abstract class AuthSchoolState {}

class AuthSchoolInitial extends AuthSchoolState {}
class AuthSchoolSuccess extends AuthSchoolState {}
class LoginSuccess extends AuthSchoolState {}
class AuthSchoolError extends AuthSchoolState {
  String error;
  AuthSchoolError(this.error);
}
class AuthLoginSchoolError extends AuthSchoolState {
  dynamic error;
  AuthLoginSchoolError(this.error);
}
class AuthLoginSchoolSuccess extends AuthSchoolState {
  String uid;
  AuthLoginSchoolSuccess(this.uid);
}
class CreateUserSuccess extends AuthSchoolState {
  UserDataModel model;
  CreateUserSuccess(this.model);
}
class CreateUserError extends AuthSchoolState {
  dynamic error;
  CreateUserError(this.error);
}
//parent
class AddParentSuccessState extends AuthSchoolState {
  ParentModel model;
  AddParentSuccessState(this.model);
}
class AddParentErrorState extends AuthSchoolState {
  dynamic error;
  AddParentErrorState(this.error);
}

//teacher
class AddTeacherSuccessState extends AuthSchoolState {
  TeacherModel model;
  AddTeacherSuccessState(this.model);
}
class AddTeacherErrorState extends AuthSchoolState {
  dynamic error;
  AddTeacherErrorState(this.error);
}

//school
class AddSchoolSuccessState extends AuthSchoolState {
  SchoolModel model;
  AddSchoolSuccessState(this.model);
}
class AddSchoolErrorState extends AuthSchoolState {
  dynamic error;
  AddSchoolErrorState(this.error);
}

//getParent
class GetParentLoadingState extends AuthSchoolState{}
class GetParentSuccessState extends AuthSchoolState{}
class GetParentErrorState extends AuthSchoolState{}

//getTeacher
class GetTeacherLoadingState extends AuthSchoolState{}
class GetTeacherSuccessState extends AuthSchoolState{
  List<TeacherModel>? teacher;
  GetTeacherSuccessState(this.teacher);
}
class GetTeacherErrorState extends AuthSchoolState{}

//getSchool
class GetSchoolLoadingState extends AuthSchoolState{}
class GetSchoolSuccessState extends AuthSchoolState{
  GetSchoolSuccessState();
}
class GetSchoolErrorState extends AuthSchoolState{}

//getChild
class GetChildLoadingState extends AuthSchoolState{}
class GetChildSuccessState extends AuthSchoolState{}
class GetChildErrorState extends AuthSchoolState{}

//schoolDetails
class GetSchoolDitLoadingState extends AuthSchoolState{}
class GetSchoolDitSucState extends AuthSchoolState{}
class GetSchoolDitErrorState extends AuthSchoolState{}

//addtime
class TimeAddSuccessState extends AuthSchoolState{
  String? classId ;
TimeAddSuccessState(this.classId){
  print('$classId +ttttttttt');
}
}
class TimeUpdateSuccessState extends AuthSchoolState{}