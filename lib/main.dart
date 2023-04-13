import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz - Nama'),
          ),
          body: Center(
            child: Column(children: [
              Image(image: AssetImage('image/quiz.jpg')),
              Text('Nama : Alfian Dwiki Fernanda Sidiq'),
              Text('NIM : 19201199'),
            ]),
          ),
        ));
  }
}
