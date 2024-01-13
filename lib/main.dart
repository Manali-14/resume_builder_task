import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_task/model/resume_model.dart';
import 'package:resume_builder_task/screen/resume_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Resume Builder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (context) => ResumeModel(),
          child: const ResumeBuilder(),
        ));
  }
}
