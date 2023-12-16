import 'package:crud_with_firebase/screen/home.dart';
import 'package:crud_with_firebase/screen/login.dart';
import 'package:crud_with_firebase/screen/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App persistence with firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        'home': (context) => const Home(),
        'login': (context) => const Login(),
        'register': (context) => Register(),
      },
      initialRoute: 'home',
    );
  }
}
