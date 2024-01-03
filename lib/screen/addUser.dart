import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _textEditingControllerName =
      TextEditingController();

  final TextEditingController _textEditingControllerRol =
      TextEditingController();

  final TextEditingController _textEditingControllerAge =
      TextEditingController();

  FirebaseAuth user = FirebaseAuth.instance;
  FirebaseFirestore userSingle = FirebaseFirestore.instance;

  Future<void> newUser({required String idGlobal}) async {
    await userSingle.collection(idGlobal).add({
      'name': _textEditingControllerName.text,
      'age': int.parse(_textEditingControllerAge.text),
      'rol': _textEditingControllerRol.text
    });
  }

  @override
  Widget build(BuildContext context) {
    String? globalId = user.currentUser?.uid;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
          backgroundColor: Colors.cyan[600],
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 80.0, 0, 0),
              child: Column(
                children: [
                  SizedBox(
                    width: 200.0,
                    child: TextField(
                      controller: _textEditingControllerName,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  SizedBox(
                    width: 200.0,
                    child: TextField(
                      controller: _textEditingControllerRol,
                      decoration: InputDecoration(
                        hintText: 'Rol',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  SizedBox(
                    width: 200.0,
                    child: TextField(
                      controller: _textEditingControllerAge,
                      decoration: InputDecoration(
                        hintText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      newUser(idGlobal: globalId ?? '');
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Guardar'),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
