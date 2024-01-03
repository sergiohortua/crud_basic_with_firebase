import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 200.0,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 50.0),
          SizedBox(
            width: 200.0,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rol',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 50.0),
          SizedBox(
            width: 200.0,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
