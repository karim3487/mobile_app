import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/stores/teacher/teacher_store.dart';
import 'package:provider/provider.dart';

import '../../shared/colors.dart';
import '../../widgets/navbar.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  late TeacherStore _store;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _store = Provider.of<TeacherStore>(context);

    // check to see if already called api
    if (!_store.loading) {
      _store.getTeachers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: GradientBd.gradient),
      child: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text("Учителя"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Text("test");
    // return Text(_store.teacherList!.teachers![0].fullName);
  }
}
