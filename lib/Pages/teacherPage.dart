import 'package:flutter/material.dart';
import 'package:student_app/Repository/teachers_repository.dart';
import 'package:student_app/main.dart';

class TeacherPage extends StatefulWidget {
  final TeachersRepository teachersRepository;
  const TeacherPage(this.teachersRepository, {Key? key}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Teachers"),
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
                        TeacherLine(
                          widget.teachersRepository.teachers[index],
                          widget.teachersRepository,
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: widget.teachersRepository.teachers.length)
            )
          ],
        ));
  }
}
class TeacherLine extends StatefulWidget {
  final Teacher teacher;
  final TeachersRepository teachersRepository;
  const TeacherLine(this.teacher, this.teachersRepository, {
    Key? key,
  }) : super(key: key);

  @override
  State<TeacherLine> createState() => _TeacherLineState();
}

class _TeacherLineState extends State<TeacherLine> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IntrinsicWidth(child: Center(child: Text(widget.teacher.gender == 'woman'?'👩🏻‍🦱': '👦🏻'))),

      title: Text(widget.teacher.name + ' ' + widget.teacher.surName),
    );
  }
}