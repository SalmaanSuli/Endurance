import 'package:endurance_fitness/endurance_animations.dart';
import 'package:endurance_fitness/endurance_theme.dart';
import 'package:endurance_fitness/endurance_util.dart';
import 'package:endurance_fitness/endurance_widgets.dart';

import 'package:endurance_fitness/create_task_new_widget.dart';
import 'package:endurance_fitness/custom_toggle_icon.dart';
import 'package:endurance_fitness/empty_list_tasks_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:endurance_fitness/loginscreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:endurance_fitness/AppTaskClass.dart';

import 'package:endurance_fitness/main.dart';
import 'package:endurance_fitness/update_tasksscreen.dart';
import 'package:endurance_fitness/update_tasksscreen_wrapper.dart';

import 'package:endurance_fitness/globalvars.dart' as globalV;

import 'package:holding_gesture/holding_gesture.dart';

import 'package:push/push.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:endurance_fitness/profilescreen.dart';
import 'package:endurance_fitness/rulesscreen.dart';

import 'package:endurance_fitness/workoutscreen.dart';

class fKEY {
  late String frequency;

  fKEY(this.frequency);
}

class MyTasksWidget extends StatefulWidget {
  //String? freqKey; // = "daily";
  //MyTasksWidget({Key? key, this.freqKey}) : super(key: key);

  //const MyTasksWidget({Key? key, required this.fKey}) : super(key: key);
  //final fKEY fKey;

  const MyTasksWidget({Key? key}) : super(key: key);

  @override
  _MyTasksWidgetState createState() => _MyTasksWidgetState();
}

//String freq_task = "fff";

class _MyTasksWidgetState extends State<MyTasksWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String freq_task = "";
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      //hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  //for navigation bar at bottom
  int _selectedIndex = 1; //0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  /*
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
  ];
  */

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyProfileWidget()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    globalV.context_GLOBAL = context;
    return Container(
      decoration: BoxDecoration(
        color: EnduranceTheme.of(context).secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/page__bg.jpg',
          ).image,
        ),
        shape: BoxShape.rectangle,
      ),
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(3),
          child: AppBar(
            backgroundColor: Color(0xFF171717),
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(3, 5, 3, 3),
              child: Text(
                'MY GOALS', //'ENDURANCE',
                textAlign: TextAlign.center,
                style: EnduranceTheme.of(context).subtitle1.override(
                      fontFamily: 'Outfit',
                      color: EnduranceTheme.of(context).primaryWhite,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
            actions: [],
            elevation: 2,
          ),
        ),
        backgroundColor: EnduranceTheme.of(context).darkBG,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: EnduranceTheme.of(context).primaryColor,
              barrierColor: Color(0x230E151B),
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    child: CreateTaskNewWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
          backgroundColor: EnduranceTheme.of(context).primaryColor,
          elevation: 8,
          child: Icon(
            Icons.add_rounded,
            color: EnduranceTheme.of(context).primaryWhite,
            size: 28,
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 13,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: EnduranceTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/page__bg.jpg',
                        ).image,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'My Goals',
                                textAlign: TextAlign.center,
                                style: EnduranceTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 2,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 0,
                          width: 300,
                          color: Colors.green,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Text('TESTING'),
                              ),
                            ),
                          ),
                        ),
                        /////////////error here
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                'assets/ENDURANCE_header_goals.jpg',
                              ).image,
                            ),
                          ),
                        )
                        /*
                        Container(
                          height: 10,
                          width: double.infinity,
                          color: Colors.green,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/page__bg.jpg',
                              ).image,
                            ),
                            shape: BoxShape.rectangle,
                        ),
                        ),
                        */
                        /////////////end error here
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: EnduranceTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/page__bg.jpg',
                        ).image,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: () {
                                  freq_task = "";
                                  //fKEY(freq_task);
                                  globalV.freq_GLOBAL = freq_task;
                                  globalV.freq_initial_GLOBAL = "all";

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyTasksWidget()));
                                },
                                text: 'All',
                                options: FFButtonOptions(
                                  width: 60,
                                  height: 32,
                                  color: Color(0xFF9AC62B),
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFFFFFFFF),
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  //borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              Spacer(),
                              FFButtonWidget(
                                onPressed: () {
                                  freq_task = "daily";
                                  //fKEY(freq_task);
                                  globalV.freq_GLOBAL = freq_task;
                                  globalV.freq_initial_GLOBAL = freq_task;

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyTasksWidget()));
                                },
                                text: 'Day',
                                options: FFButtonOptions(
                                  width: 60,
                                  height: 32,
                                  color: Color(0xFF9AC62B),
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFFFFFFFF),
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  //borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              Spacer(),
                              FFButtonWidget(
                                onPressed: () {
                                  freq_task = "weekly";
                                  //fKEY(freq_task);
                                  globalV.freq_GLOBAL = freq_task;
                                  globalV.freq_initial_GLOBAL = freq_task;

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyTasksWidget()));
                                },
                                text: 'Week',
                                options: FFButtonOptions(
                                  width: 60,
                                  height: 32,
                                  color: Color(0xFF9AC62B),
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFFFFFFFF),
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  //borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              Spacer(),
                              FFButtonWidget(
                                onPressed: () {
                                  freq_task = "monthly";
                                  //fKEY(freq_task);
                                  globalV.freq_GLOBAL = freq_task;
                                  globalV.freq_initial_GLOBAL = freq_task;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              //MyTasksWidget(fKey: fKey.frequency)));
                                              MyTasksWidget()));
                                },
                                text: 'Month',
                                options: FFButtonOptions(
                                  width: 60,
                                  height: 32,
                                  color: Color(0xFF9AC62B),
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFFFFFFFF),
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  //borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              Spacer(),
                              FFButtonWidget(
                                onPressed: () {
                                  freq_task = "yearly";
                                  //fKEY(freq_task);
                                  globalV.freq_GLOBAL = freq_task;
                                  globalV.freq_initial_GLOBAL = freq_task;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyTasksWidget()));
                                  //MyTasksWidget( fKey: fKey.frequency)));
                                },
                                text: 'Year',
                                options: FFButtonOptions(
                                  width: 60,
                                  height: 32,
                                  color: Color(0xFF9AC62B),
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFFFFFFFF),
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
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Showing results for " +
                      globalV.freq_initial_GLOBAL +
                      " goals.",
                  //textAlign: TextAlign.left,
                  style: EnduranceTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        fontSize: 16,
                      ),
                ),
              ),
              Expanded(
                flex: 15,
                //child: FutureBuilder<List<AppTask>>( //StreamBuilder

                child: StreamBuilder<List<AppTask>>(
                  //future: readAppTasks().first,
                  //stream: readAppTasks_wrapper(fKEY.fkey), //.first,
                  //stream: readAppTasks_wrapper(freq_task),
                  stream: readAppTasks_wrapper(
                      globalV.freq_GLOBAL, globalV.email_GLOBAL),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong! ${snapshot.error}',
                          style: TextStyle(color: Colors.white));
                    } else if (snapshot.hasData) {
                      final tasks = snapshot.data!;
                      //print("email is " + globalV.email_GLOBAL);

                      return ListView(
                        //children: tasks.map(buildAppTask).toList(),
                        children: tasks.map(buildAppTask_check).toList(),
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green)));
                    }
                  },
                ),
              ),
            ],
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: 'Workouts',
                backgroundColor: Colors.black,
                //backgroundColor: Colors.black12,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task_alt_outlined),
                label: 'Goals',
                backgroundColor: Colors.black,
                //backgroundColor: Colors.black12,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.style), //signal_cellular_alt_outlined),
                label: 'Rules',
                backgroundColor: Colors.black,
                //backgroundColor: Colors.black12,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Logout',
                backgroundColor: Colors.black,
                //backgroundColor: Colors.black12,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.lightGreen,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            onTap: (int index) {
              switch (index) {
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyWorkoutsWidget()));
                  break;
                case 1:
                  break;
                case 2:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyRulesWidget()));
                  break;
                case 3:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                  break;
              }
              setState(
                () {
                  _selectedIndex = index;
                },
              );
            }),
      ),
    );
  }
}

Widget buildAppTask(AppTask t) => ListTile(
      leading: CircleAvatar(child: Text('o')),
      title: Text(t.taskName),
      //subtitle: Text(t.taskDescription),
      subtitle: Text(getDateTimeForAppTaskWidget(
          t.taskDate)), //(t.taskDate.toIso8601String()),
      /*
      Checkbox(
      checkColor: Colors.white,
      shape: CircleBorder(),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        }),
    */
    );

Widget buildAppTask_check(AppTask t) => CheckboxListTile(
      contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 12),
      title: Text(t.taskName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white)), //
      subtitle: Text(
          t.taskDescription +
              "\n\n" +
              getDateTimeForAppTaskWidget(t.taskDate) +
              "\n" +
              getReverseTaskFreq(t.taskFreq, true) +
              " Reminder",
          //" f2" + freq_task, //+
          //t.id +
          //t.taskState.toString(),
          style: const TextStyle(color: Color(0xFFE0E3E7))),
      //value: t.taskState, //true, //false, //t.taskState,

      onChanged: (bool? value) async {
        globalV.clickedUpdateTask = false;
        globalV.id_GLOBAL = t.id;
        globalV.taskName_db_GLOBAL = t.taskName;
        globalV.taskDescription_db_GLOBAL = t.taskDescription;
        globalV.taskEmail_db_GLOBAL = globalV.email_GLOBAL;
        globalV.taskState_db_GLOBAL = t.taskState;
        globalV.datePicked_GLOBAL = t.taskDate;
        globalV.taskFreq_db_GLOBAL = t.taskFreq;

        if (t.taskState) {
          globalV.taskCheckComplete = "Uncheck";
        } else {
          globalV.taskCheckComplete = "Complete";
        }
        //print(globalV.id_GLOBAL);
        await showDialog<void>(
          context: globalV.context_GLOBAL!,
          builder: (BuildContext context) {
            return updatePrompt_bottom(context);
          },
        );
        if (!globalV.clickedUpdateTask) {
          updateAppTask(t);
        }
      },
      value: t.taskState, //true, //t.taskState,
      side: BorderSide(width: 2.0, color: Colors.green),
      secondary: const Icon(Icons.done_outline, color: Color(0xFFE0E3E7)),
      checkboxShape: CircleBorder(),
      checkColor: Colors.white,
      activeColor: Colors.green,
      tileColor: Color(0xFF171717),
    );

Future updateAppTask(AppTask t) async {
  final docUser = FirebaseFirestore.instance
      .collection('appTasks')
      //.doc('rjNIpUpm0BVbRnbbiSCQ');
      .doc(t.id);

  //debugPrint(t.id);
  bool newState = !t.taskState;

  await docUser.update({
    'State': newState, //!bValue, //to update
    //'hello': FieldValue.delete(), //to delete the field for the record
  });
}

String getDateTimeForAppTaskWidget(DateTime dt) {
  //dt format: "2022-10-09T16:05:00.0000"
  String s = "";
  String sDT = dt.toIso8601String();

  String sYear = sDT.substring(0, 4);
  String sMonth = sDT.substring(5, 7);
  String sDay = sDT.substring(8, 10);
  String sTime = sDT.substring(11, 16);

  int month = int.parse(sMonth);

  switch (month) {
    case 1:
      sMonth = "Jan";
      break;
    case 2:
      sMonth = "Feb";
      break;
    case 3:
      sMonth = "Mar";
      break;
    case 4:
      sMonth = "Apr";
      break;
    case 5:
      sMonth = "May";
      break;
    case 6:
      sMonth = "June";
      break;
    case 7:
      sMonth = "July";
      break;
    case 8:
      sMonth = "Aug";
      break;
    case 9:
      sMonth = "Sep";
      break;
    case 10:
      sMonth = "Oct";
      break;
    case 11:
      sMonth = "Nov";
      break;
    case 12:
      sMonth = "Dec";
      break;
  }

  s = sDay + " " + sMonth + " at " + sTime;

  if (sYear != "2022") {
    s += " (" + sYear + ")";
  }

  return s;
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.lightGreen;
  }
  return Colors.green;
}

//////////////////////////////////////////////////
///

Widget updatePrompt_bottom(BuildContext context) {
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
                          'Click to Modify/Delete/Tick your goal.',
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
                          onPressed: () {
                            globalV.clickedUpdateTask = true;
                            BuildContext? ctx = globalV.context_GLOBAL;
                            context = ctx!;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateTaskNewWidget(),
                                ));
                            //Navigator.pop(context);
                          },
                          text: 'Update Goal',
                          options: FFButtonOptions(
                            width: 110,
                            height: 50,
                            color: EnduranceTheme.of(context).primaryBackground,
                            textStyle: EnduranceTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Outfit',
                                  color: EnduranceTheme.of(context).primaryText,
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
                            globalV.clickedUpdateTask = true;
                            //print(globalV.id_GLOBAL);
                            final docUser = FirebaseFirestore.instance
                                .collection('appTasks')
                                .doc(globalV.id_GLOBAL)
                                .delete();

                            Navigator.pop(context);
                          },
                          text: '🗑️',
                          options: FFButtonOptions(
                            width: 50,
                            height: 50,
                            color: Color.fromARGB(255, 233, 65, 52),
                            textStyle: EnduranceTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Outfit',
                                  color: EnduranceTheme.of(context).primaryText,
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
                            Navigator.pop(context);
                          },
                          text: globalV.taskCheckComplete, //'Complete',
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

int _onItemTapped_(int index, BuildContext context) {
  int _selectedIndex = index;
  if (_selectedIndex == 0) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MyProfileWidget()));
  }
  return _selectedIndex;
}
