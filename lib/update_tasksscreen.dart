///
///Task (Update) Screen
///This class contains the UI elements for updating a Task
///This allows for the actual updating of a Task
///

//Imports
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
//End Imports

//This is for testing purposes (Name)
class TaskNameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

//This is for testing purposes (Details)
class DetailsFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

class UpdateTaskNewWidget extends StatefulWidget {
  const UpdateTaskNewWidget({Key? key}) : super(key: key);

  @override
  _UpdateTaskNewWidgetState createState() => _UpdateTaskNewWidgetState();
}

//UI
class _UpdateTaskNewWidgetState extends State<UpdateTaskNewWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;

  // Initial Selected Value
  //String dropdownvalue = 'None';

  // List of items in our dropdown menu
  var items = [
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
    'None',
  ];

  //variables to be used throughout this file:
  String taskName_db = globalV.taskName_db_GLOBAL;
  String taskDescription_db = globalV.taskDescription_db_GLOBAL;
  String taskEmail_db = globalV.email_GLOBAL;
  bool taskState_db = globalV.taskState_db_GLOBAL;
  DateTime datePicked = globalV.datePicked_GLOBAL;
  String taskFreq_db = globalV.taskFreq_db_GLOBAL;
  String dropdownvalue = getReverseTaskFreq(globalV.taskFreq_db_GLOBAL, false);

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
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
                  height: 497, //500,
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
                                'Update Goal',
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
                                'Fill out the details to update your goal.',
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
                              labelText: taskName_db,
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: taskName_db,
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
                                TaskNameFieldValidator.validate(''),
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
                              labelText: taskDescription_db,
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: taskDescription_db,
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
                          child: InkWell(
                            onTap: () async {
                              await DatePicker.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() => datePicked = date);
                                },
                                currentTime: getCurrentTimestamp,
                                minTime: getCurrentTimestamp,
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 50,
                              decoration: BoxDecoration(
                                color: EnduranceTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: EnduranceTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat('MMMEd', datePicked),
                                        'Select a Date / Time',
                                      ),
                                      style:
                                          EnduranceTheme.of(context).subtitle2,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: Text(
                                        dateTimeFormat('jm', datePicked),
                                        style: EnduranceTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: 'Reminder',
                                labelStyle:
                                    EnduranceTheme.of(context).subtitle2,
                                hintText: taskFreq_db,
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
                                  String taskName = textController1!.text;
                                  String taskDescription =
                                      textController2!.text;
                                  final DateTime taskDate = datePicked;
                                  final String taskEmail = globalV
                                      .email_GLOBAL; //textController1!.text; //currentUserReference;
                                  final bool taskState = taskState_db;
                                  final String taskFreq =
                                      getTaskFreq(dropdownvalue);

                                  if (taskName == "") {
                                    taskName = taskName_db;
                                  }
                                  if (taskDescription == "") {
                                    taskDescription = taskDescription_db;
                                  }

                                  final updatedTask = AppTask(
                                    id: globalV.id_GLOBAL,
                                    taskName: taskName,
                                    taskDescription: taskDescription,
                                    taskEmail: taskEmail,
                                    taskState: taskState,
                                    taskDate: taskDate,
                                    taskFreq: taskFreq,
                                  );

                                  updateAppTaskPage(updatedTask);

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
