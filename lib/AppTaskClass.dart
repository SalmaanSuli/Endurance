///
///AppTaskClass
///------------
///This is a class of "Tasks", which are goals set out by the user for them to accomplish
///------------
///A Goal has a name, description, date, and frequency (daily, monthly, etc.)
///It can be created, updated, deleted, and displayed as a list, as well as queried

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

//This is a class of Task/Goal, which contains name, description, email, state (checked/unchecked), date, and frequency(d/m/y)
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


//For UX, since the values in the database are lowercase, but sound appear on the UI as capitalized.
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

//For UX, since the values in the database are lowercase, but sound appear on the UI as capitalized.
//The reverse process of the above function
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
