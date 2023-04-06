import 'package:flutter/material.dart';
import 'package:student_app/Repository/students_repository.dart';
import 'package:student_app/main.dart';

class StudentsPage extends StatefulWidget {
  final StudentsRepository studentsRepository;
  const StudentsPage(this.studentsRepository, {Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Students"),
        ),
        body: Column(
          children: [
            PhysicalModel(
              color: Colors.white,
              elevation: 15,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentApp()));
                    },
                    child: Text('GoBack')),
              ),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        StudentLine(
                          widget.studentsRepository.students[index],
                            widget.studentsRepository,
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: widget.studentsRepository.students.length)
            )
          ],
        )
    );
  }
}

class StudentLine extends StatefulWidget {
  final Student student;
  final StudentsRepository studentsRepository;
  const StudentLine(this.student, this.studentsRepository, {
    Key? key,
  }) : super(key: key);

  @override
  State<StudentLine> createState() => _StudentLineState();
}

class _StudentLineState extends State<StudentLine> {
  @override
  Widget build(BuildContext context) {
    bool isLike = widget.studentsRepository.isLike(widget.student);
    return ListTile(
      leading: IntrinsicWidth(child: Center(child: Text(widget.student.gender == 'woman'?'👩🏻‍🦱': '👦🏻'))),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            widget.studentsRepository.like(widget.student, !isLike);
          });
        },
        icon: Icon(isLike?Icons.favorite:Icons.favorite_border),
      ),
      title: Text(widget.student.name + ' ' + widget.student.surname),
    );
  }
}
