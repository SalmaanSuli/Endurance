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
import 'package:endurance_fitness/tasksscreen.dart';
import 'package:endurance_fitness/appWorkouts.dart';
import 'package:endurance_fitness/create_workout_new_widget.dart';
import 'package:endurance_fitness/update_workoutscreen.dart';
import 'package:endurance_fitness/workout_screen.dart';
import 'package:endurance_fitness/workoutWomen_screen.dart';
import 'package:endurance_fitness/loseWeight_screen.dart';
import 'package:endurance_fitness/meal_detail_screen.dart';

class fKEY {
  late String frequency;

  fKEY(this.frequency);
}

class MyWorkoutsWidget extends StatefulWidget {
  const MyWorkoutsWidget({Key? key}) : super(key: key);

  @override
  _MyWorkoutsWidgetState createState() => _MyWorkoutsWidgetState();
}


class _MyWorkoutsWidgetState extends State<MyWorkoutsWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String day_workout = "";
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
  int _selectedIndex = 0; //0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
    //UI
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
                'MY WORKOUTS', //'ENDURANCE',
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
                    child: CreateWorkoutNewWidget(),
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
                                '',
                                textAlign: TextAlign.center,
                                style: EnduranceTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 0,
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
                                'assets/ENDURANCE_header_workouts.jpg',
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
                                  day_workout = "";
                                  //fKEY(freq_task);
                                  globalV.wkDAY_GLOBAL = day_workout;
                                  globalV.wkDAY_initial_GLOBAL = "";

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyWorkoutsWidget()));
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
                                  day_workout = "M";
                                  //fKEY(freq_task);
                                  globalV.wkDAY_GLOBAL = day_workout;
                                  globalV.wkDAY_initial_GLOBAL = day_workout;

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyWorkoutsWidget()));
                                },
                                text: 'M',
                                options: FFButtonOptions(
                                  width: 30,
                                  height: 30,
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
                                  day_workout = "T";
                                  //fKEY(freq_task);
                                  globalV.wkDAY_GLOBAL = day_workout;
                                  globalV.wkDAY_initial_GLOBAL = day_workout;

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyWorkoutsWidget()));
                                },
                                text: 'T',
                                options: FFButtonOptions(
                                  width: 30,
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
                                  day_workout = "W";
                                  //fKEY(freq_task);
                                  globalV.wkDAY_GLOBAL = day_workout;
                                  globalV.wkDAY_initial_GLOBAL = day_workout;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              //MyTasksWidget(fKey: fKey.frequency)));
                                              MyWorkoutsWidget()));
                                },
                                text: 'W',
                                options: FFButtonOptions(
                                  width: 30,
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
                                  day_workout = "Th";
                                  //fKEY(freq_task);
                                  globalV.wkDAY_GLOBAL = day_workout;
                                  globalV.wkDAY_initial_GLOBAL = day_workout;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyWorkoutsWidget()));
                                  //MyTasksWidget( fKey: fKey.frequency)));
                                },
                                text: 'T',
                                options: FFButtonOptions(
                                  width: 30,
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
                                  day_workout = "F";
                                  //fKEY(freq_task);
                                  globalV.wkDAY_GLOBAL = day_workout;
                                  globalV.wkDAY_initial_GLOBAL = day_workout;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyWorkoutsWidget()));
                                  //MyTasksWidget( fKey: fKey.frequency)));
                                },
                                text: 'F',
                                options: FFButtonOptions(
                                  width: 30,
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
                                  day_workout = "Sa";
                                  //fKEY(freq_task);
                                  globalV.wkDAY_GLOBAL = day_workout;
                                  globalV.wkDAY_initial_GLOBAL = day_workout;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyWorkoutsWidget()));
                                  //MyTasksWidget( fKey: fKey.frequency)));
                                },
                                text: 'Sa',
                                options: FFButtonOptions(
                                  width: 30,
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
                                  day_workout = "Su";
                                  //fKEY(freq_task);
                                  globalV.wkDAY_GLOBAL = day_workout;
                                  globalV.wkDAY_initial_GLOBAL = day_workout;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyWorkoutsWidget()));
                                  //MyTasksWidget( fKey: fKey.frequency)));
                                },
                                text: 'Su',
                                options: FFButtonOptions(
                                  width: 30,
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
              Spacer(),
              FFButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProfileWidget()));
                  //MyTasksWidget( fKey: fKey.frequency)));
                },
                text: 'View Your Workout Guide',
                options: FFButtonOptions(
                  width: 220,
                  height: 40,
                  color: Color.fromARGB(255, 23, 23, 22),
                  textStyle: EnduranceTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFFFFFFFF),
                      ),
                  elevation: 0,
                  borderSide: BorderSide(
                    color: Colors.lightGreen,
                    width: 0,
                  ),
                  //borderRadius: BorderRadius.circular(0),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 1,
                child: Text(
                  "Showing results for " +
                      globalV.wkDay_db_GLOBAL +
                      " workouts.",
                  //textAlign: TextAlign.left,
                  style: EnduranceTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        fontSize: 16,
                      ),
                ),
              ),
              Expanded(
                flex: 14,
                //child: FutureBuilder<List<AppTask>>( //StreamBuilder

                child: StreamBuilder<List<AppWorkout>>(
                  //future: readAppTasks().first,
                  //stream: readAppTasks_wrapper(fKEY.fkey), //.first,
                  //stream: readAppTasks_wrapper(freq_task),
                  stream: readAppWorkouts_wrapper(
                      globalV.wkDAY_GLOBAL, globalV.email_GLOBAL),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong! ${snapshot.error}',
                          style: TextStyle(color: Colors.white));
                    } else if (snapshot.hasData) {
                      final wk = snapshot.data!;
                      //print("email is " + globalV.email_GLOBAL);

                      return ListView(
                        //children: tasks.map(buildAppTask).toList(),
                        children: wk.map(buildAppWorkout_check).toList(),
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
                icon: Icon(Icons.restaurant),
                label: 'Diet',
                backgroundColor: Colors.black,
                //backgroundColor: Colors.black12,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout_rounded),
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
                  break;
                case 1:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyTasksWidget()));
                  break;
                case 2:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyRulesWidget()));
                  break;
                case 3:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DietPage()));
                  break;
                case 4:
                  globalV.logoutGLOBAL(context);
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

Widget buildAppWorkout_check(AppWorkout t) => CheckboxListTile(
      contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 12),
      title: Text(t.workoutExercise,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white)), //
      subtitle: Text(
          t.workoutDescription +
              "\n\n" +
              t.workoutDay +
              "\n" +
              "Sets: " +
              t.workoutSets.toString() +
              " | Reps: " +
              t.workoutReps.toString(),
          style: const TextStyle(color: Color(0xFFE0E3E7))),

      onChanged: (bool? value) async {
        globalV.clickedUpdateTask = false;
        globalV.wkid_GLOBAL = t.id;

        globalV.wkDay_db_GLOBAL = t.workoutDay;
        globalV.wkExercise_db_GLOBAL = t.workoutExercise;
        globalV.wkDescription_db_GLOBAL = t.workoutDescription;
        globalV.wkEmail_db_GLOBAL = globalV.email_GLOBAL;
        globalV.wkSets_db_GLOBAL = t.workoutSets;
        globalV.wkReps_db_GLOBAL = t.workoutReps;

        if (t.workoutState) {
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
          updateAppWorkout(t);
        }
      },
      value: t.workoutState, //true, //t.taskState,
      side: BorderSide(width: 2.0, color: Colors.green),
      secondary: const Icon(Icons.fitness_center, color: Color(0xFFE0E3E7)),
      checkboxShape: CircleBorder(),
      checkColor: Colors.white,
      activeColor: Colors.green,
      tileColor: Color(0xFF171717),
    );

Future updateAppWorkout(AppWorkout t) async {
  final docUser = FirebaseFirestore.instance
      .collection('appWorkout')
      //.doc('rjNIpUpm0BVbRnbbiSCQ');
      .doc(t.id);

  //debugPrint(t.id);
  bool newState = !t.workoutState;

  await docUser.update({
    'State': newState, //!bValue, //to update
    //'hello': FieldValue.delete(), //to delete the field for the record
  });
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
                          'Click to Modify/Delete/Tick your exercise.',
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
                                  //builder: (context) => UpdateTaskNewWidget(),
                                  builder: (context) =>
                                      UpdateWorkoutNewWidget(),
                                ));
                            //Navigator.pop(context);
                          },
                          text: 'Update',
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
                                .collection('appWorkout')
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
