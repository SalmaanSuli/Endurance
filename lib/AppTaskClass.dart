import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.task,
    required this.description,
  });
  final String task;
  final String description;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App class',
      home: Scaffold(
        appBar: AppBar(
          title: Text(task),
        ),
        body: Center(
          child: Text(description),
        ),
      ),
    );
  }
}

class AppTask {
  String id;
  final String taskName;
  final String taskDescription;
  final String taskEmail;
  final bool taskState;
  final DateTime taskDate;
  final String taskFreq; //daily, weekly, monthly, yearly

  AppTask({
    this.id = '',
    required this.taskName,
    required this.taskDescription,
    required this.taskEmail,
    required this.taskState,
    required this.taskDate,
    required this.taskFreq,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'Name': taskName,
        'Description': taskDescription,
        'Email': taskEmail,
        'State': taskState,
        'Date': taskDate,
        'Freq': taskFreq,
      };

  static AppTask fromJson(Map<String, dynamic> json) => AppTask(
        id: json['id'] ?? '',
        taskName: json['Name'] ?? '',
        taskDescription: json['Description'] ?? '',
        taskEmail: json['Email'] ?? '',
        taskState: json['State'] ?? '',
        taskDate:
            (json['Date'] as Timestamp).toDate(), // ?? DateTime(2000, 1, 10),
        taskFreq: json['Freq'] ?? '',
      );
}

Future createAppTask(
    {required String id,
    required String taskName,
    required String taskDescription,
    required String taskEmail,
    required bool taskState,
    required DateTime taskDate,
    required String taskFreq}) async {
  final docUser = FirebaseFirestore.instance.collection('appTasks').doc();

  final _task = AppTask(
    id: docUser.id, //taskEmail,
    taskName: taskName,
    taskDescription: taskDescription,
    taskEmail: taskEmail,
    taskState: taskState,
    taskDate: taskDate,
    taskFreq: taskFreq,
  );

  final json = _task.toJson();

  await docUser.set(json);
}

Future updateAppTaskPage(AppTask t) async {
  final docUser = FirebaseFirestore.instance.collection('appTasks').doc(t.id);

  //debugPrint(t.id);
  bool newState = t.taskState;

  await docUser.update({
    'State': newState, //!bValue, //to update
    'Date': t.taskDate,
    'Description': t.taskDescription,
    'Freq': t.taskFreq,
    'Name': t.taskName,
    //'hello': FieldValue.delete(), //to delete the field for the record
  });
}

Stream<List<AppTask>> readAppTasks_wrapper(String _freq, String email) {
  //_freq = varToUse().freq;
  if (_freq == "") {
    return readAppTasks_noQuery(email);
    //return readAppTasks_noQuery(freq);
  } else {
    return readAppTasks(_freq, email);
  }
}

Stream<List<AppTask>> readAppTasks_noQuery(String email) =>
    FirebaseFirestore.instance
        .collection('appTasks')
        .where("Email", isEqualTo: email)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => AppTask.fromJson(doc.data())).toList());

Stream<List<AppTask>> readAppTasks(String freq, String email) =>
    FirebaseFirestore.instance
        .collection('appTasks')
        //.orderBy('State')
        .where("Freq", isEqualTo: freq)
        .where("Email", isEqualTo: email)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => AppTask.fromJson(doc.data())).toList());

Future<AppTask?> readAppTask(String sID) async {
  final docUser = FirebaseFirestore.instance.collection('appTasks').doc(sID);
  final snapshot = await docUser.get();

  if (snapshot.exists) {
    return AppTask.fromJson(snapshot.data()!);
  }
}

String getTaskFreq(String value) {
  if (value == "Daily") {
    return "daily";
  } else if (value == "Weekly") {
    return "weekly";
  } else if (value == "Monthly") {
    return "monthly";
  } else if (value == "Yearly") {
    return "yearly";
  } else if (value == "None") {
    return "none";
  }
  return "";
}

String getReverseTaskFreq(String value, bool display) {
  if (value == "daily") {
    return "Daily";
  } else if (value == "weekly") {
    return "Weekly";
  } else if (value == "monthly") {
    return "Monthly";
  } else if (value == "yearly") {
    return "Yearly";
  } else if (value == "none") {
    if (display) {
      return "No";
    }
    return "None";
  }
  return "";
}
