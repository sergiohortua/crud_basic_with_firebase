import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  FirebaseAuth user = FirebaseAuth.instance;
  late final FirebaseAuth _auth;
  late final CollectionReference users;

  CardList({Key? key})
      : _auth = FirebaseAuth.instance,
        users = FirebaseFirestore.instance
            .collection(FirebaseAuth.instance.currentUser?.uid ?? '');

  Future<void> deleteUser({required idUser}) async {
    // Simular una operación asíncrona, espera 2 segundos
    await users.doc(idUser).delete();
  }

  @override
  Widget build(BuildContext context) {
    var userCurrent = user.currentUser?.email;
    final Map<String, dynamic> datos =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Accede a los datos individualmente
    String dato1 = datos['uid'];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'addUser');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title: Text('LISTA DE CARDS'),
        backgroundColor: Colors.cyan[600],
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              userCurrent.toString(),
              style: TextStyle(fontSize: 8),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView(
            children: documents.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(data['name']),
                          Text(data['rol']),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            'details',
                            arguments: {
                              'uid': document.data(),
                              'id': document.id
                            },
                          );
                        },
                        child: Text('Detalles'),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteUser(idUser: document.id);
                        },
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
