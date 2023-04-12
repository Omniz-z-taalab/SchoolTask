import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  String? name;
  String? gander;
  String? location;
  String? age;
  String? established_in;
  String? established_by;
  String? email;
  String? phone;
  String? status;
  String? uId;
  String? password;
  String? image;
  List <TeacherModel>? teacher;

  UserDataModel({
    this.name,
    this.gander,
    this.location,
    this.age,
    this.established_in,
    this.established_by,
    this.email,
    this.phone,
    this.status,
    this.uId,
    this.password,
    this.image,
    this.teacher,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gander = json['gander'];
    location = json['location'];
    age = json['age'];
    established_in = json['established_in'];
    established_by = json['established_by'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    uId = json['uId'];
    password = json['password'];
    image = json['image'];
    if (json["teacher"] != null) {
      teacher = [];
      json["teacher"].forEach((v) {
        teacher!.add(TeacherModel.fromJson(v));
      });
    }  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "gander": gander,
      "location": location,
      "age": age,
      "established_in": established_in,
      "established_by": established_by,
      "email": email,
      "phone": phone,
      "status": status,
      "uId": uId,
      "password": password,
      "image": image,
      "teacher": teacher,
    };
  }
}

class SchoolModel {
  String? name;
  String? description;
  String? gander;
  String? location;
  String? age;
  String? established_in;
  String? established_by;
  String? email;
  String? phone;
  String? status;
  String? uId;
  String? password;
  String? image;
  List<TeacherModel>? teacher;

  SchoolModel({
    this.name,
    this.description,
    this.gander,
    this.location,
    this.age,
    this.established_in,
    this.established_by,
    this.email,
    this.phone,
    this.status,
    this.uId,
    this.password,
    this.image,
    this.teacher
  });

  SchoolModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    gander = json['gander'];
    location = json['location'];
    age = json['age'];
    established_in = json['established_in'];
    established_by = json['established_by'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    uId = json['uId'];
    password = json['password'];
    image = json['image'];
    if (json["teacher"] != null) {
      teacher = [];
      json["teacher"].forEach((v) {
        teacher?.add(TeacherModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "gander": gander,
      "location": location,
      "age": age,
      "established_in": established_in,
      "established_by": established_by,
      "email": email,
      "phone": phone,
      "status": status,
      "uId": uId,
      "password": password,
      "image": image,
      "teacher": teacher,
    };
  }
}

class ParentModel {
  String? name;
  String? gander;
  String? age;

  String? email;
  String? phone;
  String? status;
  String? uId;
  String? password;
  String? image;

  ParentModel({
    this.name,
    this.gander,
    this.age,
    this.email,
    this.phone,
    this.status,
    this.uId,
    this.password,
    this.image,
  });

  ParentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gander = json['gander'];
    age = json['age'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    uId = json['uId'];
    password = json['password'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "gander": gander,
      "age": age,
      "email": email,
      "phone": phone,
      "status": status,
      "uId": uId,
      "password": password,
      "image": image,
    };
  }
}

class TeacherModel {
  String? name;
  String? gander;
  String? age;

  String? email;
  String? phone;
  String? status;
  String? uId;
  String? password;
  String? image;

  TeacherModel({
    this.name,
    this.gander,
    this.age,
    this.email,
    this.phone,
    this.status,
    this.uId,
    this.password,
    this.image,
  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gander = json['gander'];
    age = json['age'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    uId = json['uId'];
    password = json['password'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "gander": gander,
      "age": age,
      "email": email,
      "phone": phone,
      "status": status,
      "uId": uId,
      "password": password,
      "image": image,
    };
  }
}

class ClassModel {
  String? id;
  String? name;
  String? DateTime;
  String? educational_level;

  ClassModel({this.name, this.DateTime, this.educational_level});

  ClassModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    DateTime = json['DateTime'];
    educational_level = json['educational_level'];
  }
  ClassModel.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    id = json.id;
    name = json['name'];
    DateTime = json['DateTime'];
    educational_level = json['educational_level'];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "DateTime": DateTime,
      "educational_level": educational_level,
    };
  }
}
