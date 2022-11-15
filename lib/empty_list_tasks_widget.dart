///
///Tasks is Empty
///This is the UI element that displays a picture for empty tasks
///

//Imports
import 'package:endurance_fitness/create_task_new_widget.dart';
import 'package:endurance_fitness/endurance_theme.dart';
import 'package:endurance_fitness/endurance_util.dart';
import 'package:endurance_fitness/endurance_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//End Imports

class EmptyListTasksWidget extends StatefulWidget {
  const EmptyListTasksWidget({Key? key}) : super(key: key);

  @override
  _EmptyListTasksWidgetState createState() => _EmptyListTasksWidgetState();
}

class _EmptyListTasksWidgetState extends State<EmptyListTasksWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/BG.jpg',
          width: 230,
          height: 150,
          fit: BoxFit.fitHeight,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You don\'t have any tasks',
                textAlign: TextAlign.center,
                style: EnduranceTheme.of(context).title3,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Create tasks by tapping the button below.',
                  textAlign: TextAlign.center,
                  style: EnduranceTheme.of(context).subtitle2,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: FFButtonWidget(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Color(0x230E151B),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: double.infinity,
                      child: CreateTaskNewWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            text: 'Create Task',
            options: FFButtonOptions(
              width: 170,
              height: 50,
              color: EnduranceTheme.of(context).primaryColor,
              textStyle: EnduranceTheme.of(context).subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
              elevation: 2,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              //borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.taskName,
    required this.description,
  });
  final String taskName;
  final String description;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness app',
      home: Scaffold(
        appBar: AppBar(
          title: Text(taskName),
        ),
        body: Center(
          child: Text(description),
        ),
      ),
    );
  }
}
