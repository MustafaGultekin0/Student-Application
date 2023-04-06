import 'package:flutter/material.dart';
import 'package:student_app/Pages/messagesPage.dart';
import 'package:student_app/Pages/studentPage.dart';
import 'package:student_app/Pages/teacherPage.dart';
import 'package:student_app/Repository/messages_repository.dart';
import 'package:student_app/Repository/students_repository.dart';
import 'package:student_app/Repository/teachers_repository.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(title: 'Student Main Page'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  MessagesRepository messagesRepository = MessagesRepository();
  StudentsRepository studentsRepository = StudentsRepository();
  TeachersRepository teachersRepository = TeachersRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Student Name'),
            ),
            ListTile(
              title: TextButton(
                  onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentsPage(studentsRepository)));
              },
              child: const Text('Students')),
              onTap: () {},
            ),
            ListTile(
              title: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherPage(teachersRepository)));
                },
                  child: const Text('Teachers')
              ),
              onTap: () {},
            ),
            ListTile(
              title: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesPage(messagesRepository)));
                },
                  child: const Text('Messages')
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('${ messagesRepository.messages.length} new message'),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return MessagesPage(messagesRepository);
                  } ,
                ),
              ),
            ),
            ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return StudentsPage(studentsRepository);
              }));
            },
            child: Text('${studentsRepository.students.length} student')),
            ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return TeacherPage(teachersRepository);
              }
              ));
            },
            child: Text('${teachersRepository.teachers.length} teacher')),
          ],
        ),
      ),
    );
  }
}
