import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:endurance_fitness/endurance_animations.dart';
import 'package:endurance_fitness/endurance_theme.dart';
import 'package:endurance_fitness/endurance_util.dart';
import 'package:endurance_fitness/endurance_widgets.dart';

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:endurance_fitness/main.dart';
import 'package:endurance_fitness/homescreen.dart';
import 'package:endurance_fitness/signupscreen.dart';
import 'package:endurance_fitness/tasksscreen.dart';

import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

import 'package:crypt/crypt.dart';

import 'package:endurance_fitness/globalvars.dart' as globalV;

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'incorrect password' : '';
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;

  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String tempText = "";

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: EnduranceTheme.of(context).darkBG,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: EnduranceTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/loginPage.jpg',
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: formKey,
              //autovalidateMode: AutovalidateMode.always,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '',
                          style: EnduranceTheme.of(context).bodyText1.override(
                                fontFamily: 'Outfit',
                                fontSize: 0,
                                color: Color(0x9AFFFFFF),
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 300, 24, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TextFormField(
                                    controller: emailTextController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Email Address',
                                      hintText: 'Your email...',
                                      hintStyle: EnduranceTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0x9AFFFFFF),
                                          ),
                                      labelStyle:
                                          TextStyle(color: Color(0x9AFFFFFF)),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: EnduranceTheme.of(context)
                                              .secondaryText,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: EnduranceTheme.of(context)
                                              .secondaryText,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFB62929),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFB62929),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: EnduranceTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    validator: (value) =>
                                        EmailFieldValidator.validate(''),
                                    style: EnduranceTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: EnduranceTheme.of(context)
                                              .primaryWhite,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: TextFormField(
                                      controller: passwordTextController,
                                      obscureText: !passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        hintText: 'Password',
                                        hintStyle: EnduranceTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0x9AFFFFFF),
                                            ),
                                        labelStyle:
                                            TextStyle(color: Color(0x9AFFFFFF)),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: EnduranceTheme.of(context)
                                                .secondaryText,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: EnduranceTheme.of(context)
                                                .secondaryText,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFB62929),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFB62929),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        prefixIcon: Icon(
                                          Icons.vpn_key,
                                          color: EnduranceTheme.of(context)
                                              .secondaryText,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility =
                                                !passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0x80FFFFFF),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      validator: (value) =>
                                          PasswordFieldValidator.validate(''),
                                      style: EnduranceTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: EnduranceTheme.of(context)
                                                .lineColor,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 24, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        /*
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MyTasksWidget(), //LOGIN
                                          ),
                                          (r) => false,
                                        );
                                        */
                                        final email = emailTextController!.text;
                                        final password =
                                            passwordTextController!.text;

                                        doLogin(context, email, password);

                                        /*

                                        final docUser = FirebaseFirestore
                                            .instance
                                            .collection('appUsers')
                                            .doc(email);

                                        final snapshot = await docUser.get();

                                        final dUser =
                                            User.fromJson(snapshot.data()!);

                                        final dbPass = dUser.password;

                                        bool correctPass = isCorrectPass(
                                            password, dbPass, context);
                                        if (correctPass) {
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyTasksWidget(), //LOGIN
                                            ),
                                            (r) => false,
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Incorrect Password")));
                                        }
                                        */
                                      },
                                      text: 'Login',
                                      options: FFButtonOptions(
                                        width: 200,
                                        height: 50,
                                        color: Color(0xFF2BC63D),
                                        textStyle: EnduranceTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        //borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 44, 0, 30),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 6),
                                          child: Text(
                                            'Don’t have an account yet? ',
                                            style: EnduranceTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xAA95A1AC),
                                                ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          /*
                                          onPressed: 
                                          () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 200),
                                                reverseDuration:
                                                    Duration(milliseconds: 200),
                                                child:
                                                    WelcomeScreen(), //SIGNUP SignUpWidget(),
                                              ),
                                            );
                                          },
                                          */

                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpWidget(), //SIGNUP
                                              ),
                                            );
                                          },
                                          text: 'Create one.',
                                          options: FFButtonOptions(
                                            width: 100,
                                            height: 32,
                                            color: Color(0x009AC62B),
                                            textStyle:
                                                EnduranceTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF9AC62B),
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            //borderRadius: BorderRadius.circular(0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isCorrectPass(
  String pass,
  String hashedPass,
  BuildContext context,
) {
  //String hashedPass;
  //hashedPass = pass;

  /*
  if (pass == hashedPass) {
    return true;
  }
  */

  final h =
      Crypt.sha256(pass, rounds: 10000, salt: 'abcdefghijklmnop').toString();
  print("toprint");
  print(h);
  debugPrint(h);

  //printSM(context, "hashed: " + h);
  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("hash")));

  if (h == hashedPass) {
    return true;
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Incorrect Password")));
  }
  return false;
  //final h = Crypt(hashString);
}

Stream<List<User>> readUsers() => FirebaseFirestore.instance
    .collection('allUsers')
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

class User {
  String id;
  final String email;
  final String name;
  final String password;

  User({
    this.id = '',
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      password: json['password']);
}

String hashPass(String pass) {
  String hashedPass;
  hashedPass = pass;

  hashedPass = Crypt.sha256(pass).toString();
  //final h = Crypt(hashString);

  const correctValue = 'p@ssw0rd';
  const wrongValue = '123456';
  """
    if (!h.match(correctValue)) {
      print('Error: unexpected non-match: $correctValue');
    }

    if (h.match(wrongValue)) {
      print('Error: unexpected match: $wrongValue');
    }
    """;

  return hashedPass;
}

Future doLogin(BuildContext context, String email, String password) async {
  if (email == "" || password == "") {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Please fill in all fields")));
    return;
  }

  /*
  String searchKey = email;
  Stream streamQuery = FirebaseFirestore.instance
      .collection('appUsers')
      .where('email', isEqualTo: searchKey)
      //.where('fieldName', isLessThan: searchKey +'z')
      .snapshots();

  final snapshot = await streamQuery.first;
  */

  final docUser = FirebaseFirestore.instance.collection('appUsers').doc(email);

  final snapshot = await docUser.get();
  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(email + " " + password)));
  /*
  final dUser = User.fromJson({
    'id': 'id',
    'email': email,
    'name': 'name',
    'password': password,
  });
  */
  String dbPass = "";
  if (snapshot.exists) {
    final dUser = User.fromJson(snapshot.data()!);
    dbPass = dUser.password;
  }

  //ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("hello  " + password + " " + dbPass)));
  //final dbPass = dUser.password;

  bool correctPass = isCorrectPass(password, dbPass, context);

  if (correctPass) {
    globalV.email_GLOBAL = email;
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MyTasksWidget(), // MyTasksWidget(fkey: "daily"), //LOGIN
      ),
      (r) => false,
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Logging in...")));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Incorrect Password")));
  }
}

void printSM(
  BuildContext context,
  String s,
) {
  //show message
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
}
