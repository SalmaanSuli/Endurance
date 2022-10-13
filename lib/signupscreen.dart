import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:endurance_fitness/endurance_animations.dart';
import 'package:endurance_fitness/endurance_theme.dart';
import 'package:endurance_fitness/endurance_util.dart';
import 'package:endurance_fitness/endurance_widgets.dart';

//import '../login/login_widget.dart';
//import '../sign_up/sign_up_widget.dart';

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:endurance_fitness/main.dart';
import 'package:endurance_fitness/homescreen.dart';

import 'package:endurance_fitness/loginscreen.dart';
import 'package:endurance_fitness/tasksscreen.dart';

import 'package:crypto/crypto.dart';
import 'package:crypt/crypt.dart';
import 'dart:convert'; // for the utf8.encode method

//import '../auth/auth_util.dart';
//import '../backend/backend.dart';

class EmailFieldValidator{
  static String validate(String value){
    return value.isEmpty ? 'Please fill in all fields':'';
  }
}

class NameFieldValidator{
  static String validate(String value){
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

class PasswordFieldValidator{
  static String validate(String value){
    if (value.length < 8){
      return value.isEmpty ? 'Password must be at least 8 characters.' : '';
    }
    else if (!value.contains(new RegExp(r'[A-Z]'))){
      return value.isEmpty ? 'Password must have an Uppercase letter.' : '';
    }
    else if (!value.contains(new RegExp(r'[0-9]'))){
      return value.isEmpty ? 'Password must contain a digit.' : '';
    }
    else if (!value.contains(new RegExp(r'[a-z]'))){
      return value.isEmpty ? 'Password must have an Lowercase letter.' : '';
    }
    else if (!value.contains(new RegExp(r'[!@#$%^&*()-=,.<>:"{}?`~]'))){
      return value.isEmpty ? 'Password must contain a special character, like &,#,%.' : '';
    }
    return value.isEmpty ? 'Please fill in all fields' :'';
    
  }
}

class ConfirmPasswordFieldValidator{
  static String validate(String value){
    return value.isEmpty ? 'Passwords doesn\'t match' : '';
  }
}

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController? confirmPasswordTextController;

  late bool passwordVisibility2;
  TextEditingController? emailTextController;
  TextEditingController? textController1;
  TextEditingController? passwordTextController;

  late bool passwordVisibility1;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    confirmPasswordTextController = TextEditingController();
    passwordVisibility2 = false;
    emailTextController = TextEditingController();
    textController1 = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility1 = false;
  }

  @override
  void dispose() {
    confirmPasswordTextController?.dispose();
    emailTextController?.dispose();
    textController1?.dispose();
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
              'assets/BG_SINGUP.jpg',
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
                                  24, 250, 24, 0),
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
                                    validator: (value) => EmailFieldValidator.validate(''),
                                    style: EnduranceTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: EnduranceTheme.of(context)
                                              .lineColor,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: TextFormField(
                                      controller: textController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Name',
                                        hintText: 'Your first name...',
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
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: EnduranceTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      validator: (value) => NameFieldValidator.validate(''),
                                      style: EnduranceTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: EnduranceTheme.of(context)
                                                .lineColor,
                                          ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: TextFormField(
                                      controller: passwordTextController,
                                      obscureText: !passwordVisibility1,
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
                                            () => passwordVisibility1 =
                                                !passwordVisibility1,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility1
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0x80FFFFFF),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      validator: (value) => PasswordFieldValidator.validate(''),
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
                                        0, 20, 0, 0),
                                    child: TextFormField(
                                      controller: confirmPasswordTextController,
                                      obscureText: !passwordVisibility2,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        hintText: 'Re-type your password',
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
                                            () => passwordVisibility2 =
                                                !passwordVisibility2,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility2
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0x80FFFFFF),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      validator: (value) => ConfirmPasswordFieldValidator.validate(''),
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
                                        if (passwordTextController?.text !=
                                            confirmPasswordTextController
                                                ?.text) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Passwords don\'t match!',
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        final email = emailTextController!.text;
                                        final password =
                                            passwordTextController!.text;
                                        final confirmPassword =
                                            confirmPasswordTextController!.text;
                                        final name = textController1!.text;

                                        if (password == confirmPassword &&
                                            email != "" &&
                                            name != "" &&
                                            isValidPass(password, context)) {
                                          final hashedPassword =
                                              hashPass(password);
                                          createUser(
                                              id: email,
                                              email: email,
                                              name: name,
                                              password:
                                                  hashedPassword); // hashedPassword);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyTasksWidget(), //SIGNUP
                                            ),
                                          );
                                        }
                                      },
                                      text: 'Sign Up',
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
                                            'Already have an account?',
                                            style: EnduranceTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xAA95A1AC),
                                                ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginWidget(), //LOGIN
                                              ),
                                            );
                                          },
                                          text: 'Login.',
                                          options: FFButtonOptions(
                                            width: 60,
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

Future createUser(
    {required String id,
    required String email,
    required String name,
    required String password}) async {
  final docUser = FirebaseFirestore.instance.collection('appUsers').doc(email);

  /*
    final json = {
      'name': name,
      'age': 21,
      'birthday': DateTime(2001, 7, 28),
    };
    */

  final user = User(
    id: id, //docUser.id,
    email: email,
    name: name,
    password: password,
  );

  final json = user.toJson();

  await docUser.set(json);
}

bool isValidPass(String pass, BuildContext context, [int minLength = 8]) {
  bool valid = false;

  bool notEmpty = !pass.isEmpty;
  bool notShort = pass.length >= minLength;

  bool hasUppercase = pass.contains(new RegExp(r'[A-Z]'));
  bool hasDigits = pass.contains(new RegExp(r'[0-9]'));
  bool hasLowercase = pass.contains(new RegExp(r'[a-z]'));
  bool hasSpecial = pass.contains(new RegExp(r'[!@#$%^&*()-=,.<>:"{}?`~]'));

  valid = notEmpty &&
      notShort &&
      hasUppercase &&
      hasLowercase &&
      hasDigits &&
      hasSpecial;

  String errorMsg =
      "Password must be 8 characters, have an uppercase, lowercase, special, and digit.";
  if (!valid) {
    if (!notEmpty) {
      errorMsg = "Password cannot be empty.";
    } else if (!notShort) {
      errorMsg = "Password must be at least 8 characters.";
    } else if (!hasUppercase) {
      errorMsg = "Password must have an Uppercase letter.";
    } else if (!hasLowercase) {
      errorMsg = "Password must have a lowercase letter.";
    } else if (!hasDigits) {
      errorMsg = "Password must contain a digit.";
    } else if (!hasSpecial) {
      errorMsg = "Password must contain a special character, like &,#,%.";
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorMsg)));
  }

  return valid;
}

String hashPass(String pass) {
  String hashedPass;
  hashedPass = pass;

  hashedPass =
      Crypt.sha256(pass, rounds: 10000, salt: 'abcdefghijklmnop').toString();
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

class User {
  String id;
  final String email;
  final String name;
  final String password;

  User({
    //this.id = '',

    required this.id,
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
