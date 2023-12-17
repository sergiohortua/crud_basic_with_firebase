import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  FirebaseAuth user = FirebaseAuth.instance;

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Colors.cyan[600],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.email),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: 250.0,
                  child: TextField(
                    controller: controllerMail,
                    decoration: const InputDecoration(label: Text('Mail')),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.password),
                const SizedBox(width: 20.0),
                SizedBox(
                  width: 250.0,
                  child: TextField(
                    controller: controllerPassword,
                    decoration: const InputDecoration(label: Text('Password')),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final newUser = await user.createUserWithEmailAndPassword(
                      email: controllerMail.text,
                      password: controllerPassword.text);

                  if (newUser.user?.uid != null || newUser.user?.uid != '') {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(
                      context,
                      'cardCustom',
                      arguments: {'uid': newUser.user?.uid},
                    );
                  }
                } catch (e) {
                  // ignore: avoid_print
                  print('ERROR ${e}');
                }

                controllerMail.clear();
                controllerPassword.clear();
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
