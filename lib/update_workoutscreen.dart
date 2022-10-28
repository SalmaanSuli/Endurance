//import '../auth/auth_util.dart';
//import '../backend/backend.dart';

import 'package:endurance_fitness/endurance_theme.dart';
import 'package:endurance_fitness/endurance_util.dart';
import 'package:endurance_fitness/endurance_widgets.dart';

import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:endurance_fitness/AppTaskClass.dart';

import 'package:endurance_fitness/globalvars.dart' as globalV;

import 'package:endurance_fitness/appWorkouts.dart';

class NameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

class DetailsFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

class UpdateWorkoutNewWidget extends StatefulWidget {
  const UpdateWorkoutNewWidget({Key? key}) : super(key: key);

  @override
  _UpdateWorkoutNewWidgetState createState() => _UpdateWorkoutNewWidgetState();
}

class _UpdateWorkoutNewWidgetState extends State<UpdateWorkoutNewWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;

  //String dropdownvalue = 'None';

  // List of items in our dropdown menu
  var items = [
    'All',
    'M',
    'T',
    'W',
    'Th',
    'F',
    'Sa',
    'Su',
    'None',
  ];

  //final oldT = readAppTask(globalV.id_GLOBAL);

  String wkName_db = globalV.wkExercise_db_GLOBAL;
  String wkDescription_db = globalV.wkDescription_db_GLOBAL;
  String wkEmail_db = globalV.email_GLOBAL;
  bool wkState_db = globalV.taskState_db_GLOBAL;
  String wkDay_db = globalV.wkDay_db_GLOBAL;

  int wkSets_db = globalV.wkSets_db_GLOBAL;
  int wkReps_db = globalV.wkReps_db_GLOBAL;

  String dropdownvalue = globalV.wkDayInitial_db_GLOBAL;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 9,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xD60E151B),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: EnduranceTheme.of(context).lineColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 610, //500,
                  decoration: BoxDecoration(
                    color: EnduranceTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Color(0x5D000000),
                        offset: Offset(0, -2),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Update Exercise',
                                style: EnduranceTheme.of(context).title2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Fill out the details to update them.',
                                style: EnduranceTheme.of(context).subtitle2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: TextFormField(
                            controller: textController1,
                            //initialValue: taskName_db,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: wkName_db,
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: wkName_db,
                              hintStyle: EnduranceTheme.of(context).subtitle2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor:
                                  EnduranceTheme.of(context).primaryBackground,
                            ),
                            validator: (value) =>
                                NameFieldValidator.validate(''),
                            style: EnduranceTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: TextFormField(
                            controller: textController2,
                            //initialValue: taskDescription_db,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: wkDescription_db,
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: wkDescription_db,
                              hintStyle: EnduranceTheme.of(context).subtitle2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor:
                                  EnduranceTheme.of(context).primaryBackground,
                            ),
                            validator: (value) =>
                                DetailsFieldValidator.validate(''),
                            style: EnduranceTheme.of(context).bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: 'Day',
                                labelStyle:
                                    EnduranceTheme.of(context).subtitle2,
                                hintText: wkDay_db,
                                hintStyle: EnduranceTheme.of(context).subtitle2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: EnduranceTheme.of(context)
                                        .primaryBackground,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: EnduranceTheme.of(context)
                                        .primaryBackground,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: EnduranceTheme.of(context)
                                    .primaryBackground,
                              ),
                              style: EnduranceTheme.of(context).bodyText1,

                              // Initial Value
                              value: dropdownvalue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              }),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: TextFormField(
                            controller: textController3,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Sets',
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: wkSets_db.toString(),
                              hintStyle: EnduranceTheme.of(context).subtitle2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor:
                                  EnduranceTheme.of(context).primaryBackground,
                            ),
                            validator: (value) =>
                                NameFieldValidator.validate(''),
                            style: EnduranceTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: TextFormField(
                            controller: textController4,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Reps',
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: wkReps_db.toString(),
                              hintStyle: EnduranceTheme.of(context).subtitle2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor:
                                  EnduranceTheme.of(context).primaryBackground,
                            ),
                            validator: (value) =>
                                NameFieldValidator.validate(''),
                            style: EnduranceTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  Navigator.pop(
                                      context); //pop twice to also pop the update wrapper on tasksscreen
                                },
                                text: 'Cancel',
                                options: FFButtonOptions(
                                  width: 110,
                                  height: 50,
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: EnduranceTheme.of(context)
                                            .primaryText,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  //borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  String wkExercise = textController1!.text;
                                  String wkDescription = textController2!.text;
                                  final String wkEmail = globalV.email_GLOBAL;
                                  final bool wkState = false;
                                  final String wkDay = dropdownvalue;

                                  if (wkExercise == "") {
                                    wkExercise = wkName_db;
                                  }
                                  if (wkDescription == "") {
                                    wkDescription = wkDescription_db;
                                  }

                                  int wkSets = 0;
                                  int wkReps = 0;

                                  bool bUpdateWorkout = true;
                                  if (textController3!.text == "") {
                                    wkSets = wkSets_db;
                                  } else {
                                    if (isNumeric(textController3!.text)) {
                                      wkSets = int.parse(textController3!.text);
                                    } else {
                                      bUpdateWorkout = false;
                                    }
                                  }
                                  if (textController4!.text == "") {
                                    wkReps = wkReps_db;
                                  } else {
                                    if (isNumeric(textController4!.text)) {
                                      wkReps = int.parse(textController4!.text);
                                    } else {
                                      bUpdateWorkout = false;
                                    }
                                  }

                                  if (bUpdateWorkout) {
                                    final updatedWorkout = AppWorkout(
                                        id: globalV.wkid_GLOBAL,
                                        workoutExercise: wkExercise,
                                        workoutDay: wkDay,
                                        workoutDescription: wkDescription,
                                        workoutEmail: wkEmail,
                                        workoutSets: wkSets,
                                        workoutReps: wkReps,
                                        workoutState: wkState);

                                    updateAppWorkoutPage(updatedWorkout);
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Note: Sets and Reps must be numbers.")));

                                  Navigator.pop(context);
                                  Navigator.pop(
                                      context); //pop twice to also pop the update wrapper on tasksscreen
                                },
                                text: 'Update Task',
                                options: FFButtonOptions(
                                  width: 170,
                                  height: 50,
                                  color:
                                      EnduranceTheme.of(context).primaryColor,
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: EnduranceTheme.of(context)
                                            .primaryWhite,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  //borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//checks if the string is an integer
bool isNumeric(String s) {
  if (s == "") {
    return false;
  }
  return double.tryParse(s) != null;
}
