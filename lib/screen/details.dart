import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController _textEditingControllerName =
      TextEditingController();

  final TextEditingController _textEditingControllerRol =
      TextEditingController();

  final TextEditingController _textEditingControllerAge =
      TextEditingController();

  FirebaseAuth user = FirebaseAuth.instance;
  FirebaseFirestore userSingle = FirebaseFirestore.instance;

  Future<void> updateForm(
      {required String idGlobal, required String idLocal}) async {
    await userSingle.collection(idGlobal).doc(idLocal).update({
      'name': _textEditingControllerName.text,
      'age': int.parse(_textEditingControllerAge.text),
      'rol': _textEditingControllerRol.text
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> datos =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    Map<String, dynamic> dato1 = datos['uid'];
    String localId = datos['id'].toString();
    String? globalId = user.currentUser?.uid;

    _textEditingControllerName.text = dato1['name'];
    _textEditingControllerRol.text = dato1['rol'];
    _textEditingControllerAge.text = dato1['age'].toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/astro.jpg'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Nombre:'),
                    const SizedBox(
                      width: 30.0,
                    ),
                    SizedBox(
                        width: 150.0,
                        child: TextField(
                          controller: _textEditingControllerName,
                        )),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Description:'),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                        width: 150.0,
                        child: TextField(
                          controller: _textEditingControllerRol,
                        )),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Age:'),
                    const SizedBox(
                      width: 60.0,
                    ),
                    SizedBox(
                        width: 150.0,
                        child: TextField(
                          controller: _textEditingControllerAge,
                        )),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        updateForm(
                          idGlobal: globalId ?? '',
                          idLocal: localId,
                        );
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Text('Guardar'),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
