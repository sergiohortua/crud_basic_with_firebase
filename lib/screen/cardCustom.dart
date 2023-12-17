import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> datos =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Accede a los datos individualmente
    String dato1 = datos['uid'];
    return Scaffold(
      appBar: AppBar(
        title: Text('CARD CUSTOM'),
        backgroundColor: Colors.cyan[600],
      ),
      body: Center(
        child: Column(
          children: [Text(dato1)],
        ),
      ),
    );
  }
}
