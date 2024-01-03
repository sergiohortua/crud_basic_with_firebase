import 'package:crud_with_firebase/firebase_options.dart';
import 'package:crud_with_firebase/screen/addUser.dart';
import 'package:crud_with_firebase/screen/home.dart';
import 'package:crud_with_firebase/screen/login.dart';
import 'package:crud_with_firebase/screen/register.dart';
import 'package:crud_with_firebase/screen/cardList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        'login': (context) => Login(),
        'register': (context) => Register(),
        'cardList': (context) => CardList(),
        'addUser': (context) => AddUser(),
      },
      initialRoute: 'home',
    );
  }
}
