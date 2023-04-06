import 'package:student_app/Repository/students_repository.dart';

class StudentsRepository{
  final List <Student> students = [
    Student('Mustafa','Gultekin',21,'man'),
    Student('Akin Emre','Isik',23,'man'),
    Student('Dilara','Karadas',21,'woman'),
  ];
final Set<Student> myLovedOnes={};
void like(Student student, bool isLike) {
  if(isLike){
  myLovedOnes.add(student);
  }else{
    myLovedOnes.remove(student);
  }
  }

  bool isLike(Student student) {
    return myLovedOnes.contains(student);
  }
}
class Student{
  String name;
  String surname;
  int age;
  String gender;

  Student(this.name, this.surname, this.age, this.gender);
}