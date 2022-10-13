/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endurance App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Endurance Home'),
      //home: UserPage(),
    );
  }s
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: TextField(controller: controller),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                final name = controller.text;

                createUser(name: name);
              },
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            ElevatedButton(
              child: Text('START'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserPage()));
              },
            ),
            ElevatedButton(
              child: Text('See Users'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SeeUserPage()));
              },
            ),
          ],
        ),
      );

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    /*
    final json = {
      'name': name,
      'age': 21,
      'birthday': DateTime(2001, 7, 28),
    };
    */

    final user = User(
      id: docUser.id,
      name: name,
      age: 21,
      birthday: DateTime(2001, 7, 28),
    );

    final json = user.toJson();

    await docUser.set(json);
  }
}

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();

  //controllerDate.text =  DateTime.now();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add User'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextField(
              controller: controllerName,
              decoration: decoration('Name'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerAge,
              decoration: decoration('Age'),
            ),
            const SizedBox(height: 24),
            /*
            DateTimeField(
              decoration: decoration('Birthday'),
              format: DateFormat('yyyy-MM-dd'),
              onShowPicker(context, currentValue) => X {
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                initialDate: currentValue ?? DateTime.now()
              }
            ),
            */
            //const SizedBox(height: 24),
            ElevatedButton(
              child: Text('Create'),
              onPressed: () {
                final user = User(
                  name: controllerName.text,
                  age: int.parse(controllerAge.text),
                  birthday: DateTime(
                      2001, 6, 23), //DateTime.parse(controllerDate.text),
                );

                createUser(user);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      );

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    /*
    final user = User(
      id: docUser.id,
      name: name,
      age: 21,
      birthday: DateTime(2001, 7, 28),
    );
    */

    final json = user.toJson();
    await docUser.set(json);
  }
}

//-----------------------list users
class SeeUserPage extends StatefulWidget {
  @override
  State<SeeUserPage> createState() => _SeeUserPageState();
}

class _SeeUserPageState extends State<SeeUserPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();

  //controllerDate.text =  DateTime.now();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Read Users'),
        ),
        body:
            /*
        FutureBuilder<User?>(
          future: readUser('0pCIsxvj6S87Z7p6LDhq'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something is gone wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final user = snapshot.data;

              return user == null
                  ? Center(child: Text('No User'))
                  : buildUser(user);
            } else {
              //return Text('OOps Something is gone wrong! ${snapshot.error}');
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        */
            /*
          ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          /*
          ElevatedButton(
            child: Text('Update'),
            onPressed: () {
              final docUser = FirebaseFirestore.instance
                  .collection('users')
                  .doc('jpiGM1pKJGclbUOC0Fwa');

              //update specific fields
              docUser.update({
                'name': 'EmmaABCE', //to update
                //'name': FieldValue.delete(), //to delete the field for the record
              });
            },
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            child: Text('Delete'),
            onPressed: () {
              final docUser = FirebaseFirestore.instance
                  .collection('users')
                  .doc('jpiGM1pKJGclbUOC0Fwa');

              //update specific fields
              docUser.delete(); //deletes user
            },
          ),
          */
          FutureBuilder<List<User>>(
            //vs a StreamBuilder
            future: readUsers().first,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong! ${snapshot.error}');
              } else if (snapshot.hasData) {
                final users = snapshot.data!;

                return ListView(
                  children: users.map(buildUser).toList(),
                );
              } else {
                return Text('Something went wrong! ${snapshot.error}');
                //Center(child: CircularProgressIndicator());
              }
            },
          ),
          /*
          FutureBuilder<User?>(
            future: readUser('wWjFa3Q9ndSjTZJOnZkC'),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something is gone wrong! ${snapshot.error}');
              } else if (snapshot.hasData) {
                final user = snapshot.data;

                return user == null
                    ? Center(child: Text('No User'))
                    : buildUser(user);
              } else {
                //return Text('OOps Something is gone wrong! ${snapshot.error}');
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          */
        ],
      )
      */

            FutureBuilder<List<User>>(
          future: readUsers().first,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.age}')),
        title: Text(user.name),
        subtitle: Text(user.birthday.toIso8601String()),
      );

  /*
  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      );
  */

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future<User?> readUser(String sID) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(sID);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }
  }
  /*
  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    /*
    final user = User(
      id: docUser.id,
      name: name,
      age: 21,
      birthday: DateTime(2001, 7, 28),
    );
    */

    final json = user.toJson();
    await docUser.set(json);
  }
  */
}
//---------------------end list users

class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        birthday: (json['birthday'] as Timestamp).toDate(),
      );
}

*/