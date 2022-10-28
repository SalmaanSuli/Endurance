import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

//import 'package:flutter/widgets.dart';
class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.message,
  });
  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App class',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}

class AppRule {
  String id;
  final String ruleName;
  final String ruleDescription;
  final String ruleEmail;

  AppRule({
    this.id = '',
    required this.ruleName,
    required this.ruleDescription,
    required this.ruleEmail,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'Name': ruleName,
        'Description': ruleDescription,
        'Email': ruleEmail,
      };

  static AppRule fromJson(Map<String, dynamic> json) => AppRule(
        id: json['id'] ?? '',
        ruleName: json['Name'] ?? '',
        ruleDescription: json['Description'] ?? '',
        ruleEmail: json['Email'] ?? '',
      );
}

Future createAppRule(
    {required String id,
    required String ruleName,
    required String ruleDescription,
    required String ruleEmail}) async {
  final docUser = FirebaseFirestore.instance.collection('appRules').doc();

  final _rule = AppRule(
    id: docUser.id, //taskEmail,
    ruleName: ruleName,
    ruleDescription: ruleDescription,
    ruleEmail: ruleEmail,
  );

  final json = _rule.toJson();

  await docUser.set(json);
}

Future updateAppRulePage(AppRule t) async {
  final docUser = FirebaseFirestore.instance.collection('appRules').doc(t.id);

  await docUser.update({
    'Description': t.ruleDescription,
    'Name': t.ruleName,
    //'hello': FieldValue.delete(), //to delete the field for the record
  });
}

Stream<List<AppRule>> readAppRules_wrapper(String _freq, String email) {
  //_freq = varToUse().freq;
  return readAppRules_noQuery(email);

  /*
  if (_freq == "") {
    return readAppRules_noQuery(email);
  } else {
    return readAppRules(_freq, email);
  }
  */
}

Stream<List<AppRule>> readAppRules_noQuery(String email) =>
    FirebaseFirestore.instance
        .collection('appRules')
        .where("Email", isEqualTo: email)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => AppRule.fromJson(doc.data())).toList());

Stream<List<AppRule>> readAppRules(String freq, String email) =>
    FirebaseFirestore.instance
        .collection('appRules')
        //.orderBy('State')
        .where("Freq", isEqualTo: freq)
        .where("Email", isEqualTo: email)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => AppRule.fromJson(doc.data())).toList());

Future<AppRule?> readAppRule(String sID) async {
  final docUser = FirebaseFirestore.instance.collection('appRules').doc(sID);
  final snapshot = await docUser.get();

  if (snapshot.exists) {
    return AppRule.fromJson(snapshot.data()!);
  }
}
