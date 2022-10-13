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

import 'package:endurance_fitness/AppRuleClass.dart';

import 'package:endurance_fitness/globalvars.dart' as globalV;

class TaskNameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

class DetailsFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please fill in all fields' : '';
  }
}

class CreateRuleNewWidget extends StatefulWidget {
  const CreateRuleNewWidget({Key? key}) : super(key: key);

  @override
  _CreateRuleNewWidgetState createState() => _CreateRuleNewWidgetState();
}

class _CreateRuleNewWidgetState extends State<CreateRuleNewWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;


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
                                'Add Rule',
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
                                'Fill out the details below to add a new rule.',
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
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Rule Name',
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: 'Enter your rule here....',
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
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Details',
                              labelStyle: EnduranceTheme.of(context).subtitle2,
                              hintText: 'Enter a description here...',
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
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
                                  final String ruleName = textController1!.text;
                                  final String ruleDescription =
                                      textController2!.text;
                                  final String ruleEmail = globalV
                                      .email_GLOBAL; //textController1!.text; //currentUserReference;]

                                  createAppRule(
                                      id: "id",
                                      ruleName: ruleName,
                                      ruleDescription: ruleDescription,
                                      ruleEmail: ruleEmail,);

                                  Navigator.pop(context);
                                },
                                text: 'Create Rule',
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
