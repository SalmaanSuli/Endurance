import 'package:endurance_fitness/endurance_theme.dart';
import 'package:endurance_fitness/endurance_util.dart';
import 'package:endurance_fitness/endurance_widgets.dart';

import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:endurance_fitness/AppTaskClass.dart';
import 'package:endurance_fitness/update_tasksscreen.dart';

import 'package:endurance_fitness/globalvars.dart' as globalV;

import 'package:endurance_fitness/main.dart';

class UpdateTaskWrapperWidget extends StatefulWidget {
  const UpdateTaskWrapperWidget({Key? key}) : super(key: key);

  @override
  _UpdateTaskWrapperWidgetState createState() =>
      _UpdateTaskWrapperWidgetState();
}

class _UpdateTaskWrapperWidgetState extends State<UpdateTaskWrapperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: double.infinity,
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
              height: 180, //500,
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Update Task',
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
                            'Click update to modify your goal.',
                            style: EnduranceTheme.of(context).subtitle2,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
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
                              color:
                                  EnduranceTheme.of(context).primaryBackground,
                              textStyle: EnduranceTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        EnduranceTheme.of(context).primaryText,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              //borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              //Navigator.pop(context);
                              print("pushing");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateTaskNewWidget(),
                                  ));
                            },
                            text: 'Update Task',
                            options: FFButtonOptions(
                              width: 170,
                              height: 50,
                              color: EnduranceTheme.of(context).primaryColor,
                              textStyle: EnduranceTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        EnduranceTheme.of(context).primaryWhite,
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
    );
  }
}
