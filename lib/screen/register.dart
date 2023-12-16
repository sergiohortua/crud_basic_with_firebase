import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerMail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

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
              onPressed: () {
                print('================');
                print(
                    'GUARDAMOS: ${controllerMail.text} Y ${controllerPassword.text}');
                print('================');
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
