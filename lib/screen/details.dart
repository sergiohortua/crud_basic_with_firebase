// import 'package:crud/common/person.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  // Person person;
  // int index;

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

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> datos =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Accede a los datos individualmente
    dynamic dato1 = datos['uid'];
    print('XXXXXXXXXXXXXXXXXXX ${dato1}');
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
                        // int age =
                        //     int.tryParse(_textEditingControllerAge.text) ?? 0;

                        // setState(() {
                        //   Navigator.pop(
                        //       context,
                        //       Person(
                        //         _textEditingControllerName.text,
                        //         _textEditingControllerDescription.text,
                        //         age,
                        //       ));
                        // });
                        print('RETURN');
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
