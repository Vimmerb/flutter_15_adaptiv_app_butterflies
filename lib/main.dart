import 'package:flutter/material.dart';
import 'package:flutter_5_butterflies/screen.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          //color: Colors.greenAccent,
          theme: ThemeData(primarySwatch: Colors.teal),
          home: const Home(),
        );
      },
    );
  }
}
