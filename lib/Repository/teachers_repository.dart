import 'package:student_app/Repository/teachers_repository.dart';

class TeachersRepository{
  List <Teacher> teachers = [
    Teacher('Ayse','Eldem',45,'woman'),
    Teacher('Ugur','Ahraz',48,'man'),
    Teacher('Ilya','Karakus',27,'woman'),
  ];
}

class Teacher{
  String name;
  String surName;
  int age;
  String gender;

  Teacher(this.name, this.surName, this.age, this.gender);
}