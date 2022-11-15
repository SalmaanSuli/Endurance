///
///Rule (Update) Screen
///This class contains the UI elements for updating a Rule
///It also allows updating a Rule
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
import 'package:endurance_fitness/AppRuleClass.dart';
import 'package:endurance_fitness/globalvars.dart' as globalV;
//End Imports

//This is for testing purposes (Name)
class RuleNameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

//This is for testing purposes (Details)
class RuleDetailsFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

//This is for testing purposes (Desc)
class RuleDescriptionFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

class UpdateRuleNewWidget extends StatefulWidget {
  const UpdateRuleNewWidget({Key? key}) : super(key: key);

  @override
  _UpdateRuleNewWidgetState createState() => _UpdateRuleNewWidgetState();
}

//UI
class _UpdateRuleNewWidgetState extends State<UpdateRuleNewWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;

  //Variables to be used throughout this class:
  String ruleName_db = globalV.ruleName_db_GLOBAL;
  String ruleDescription_db = globalV.ruleDescription_db_GLOBAL;
  String ruleEmail_db = globalV.email_GLOBAL;

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
                                'Update Rule',
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
                                'Fill out the details to update your rule.',
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
                              labelText: ruleName_db,
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: ruleName_db,
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
                                RuleNameFieldValidator.validate(''),
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
                              labelText: ruleDescription_db,
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: ruleDescription_db,
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
                                RuleDetailsFieldValidator.validate(''),
                            style: EnduranceTheme.of(context).bodyText1,
                            textAlign: TextAlign.start,
                            maxLines: 3,
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
                                  String ruleName = textController1!.text;
                                  String ruleDescription =
                                      textController2!.text;

                                  if (ruleName == "") {
                                    ruleName = ruleName_db;
                                  }
                                  if (ruleDescription == "") {
                                    ruleDescription = ruleDescription_db;
                                  }

                                  final updatedRule = AppRule(
                                    id: globalV.ruleID_GLOBAL,
                                    ruleName: ruleName,
                                    ruleDescription: ruleDescription,
                                    ruleEmail: globalV.email_GLOBAL,
                                  );

                                  updateAppRulePage(updatedRule);

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

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.rule,
    required this.detail,
  });
  final String rule;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness app',
      home: Scaffold(
        appBar: AppBar(
          title: Text(rule),
        ),
        body: Center(
          child: Text(detail),
        ),
      ),
    );
  }
}
