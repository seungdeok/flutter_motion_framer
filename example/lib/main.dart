import 'package:flutter/material.dart';
import 'package:motion_framer/motion.dart';
import 'package:motion_framer/motion_framer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Motion framer example'),
        ),
        body: const Center(
          child: MotionContainer(
            widget: Text('Text'),
            animate: {"scale": 2.0},
            transition: {"duration": 2000},
          ),
        ),
      ),
    );
  }
}
