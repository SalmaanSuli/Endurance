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

import 'package:endurance_fitness/tasksscreen.dart';

import 'package:endurance_fitness/rulesscreen.dart';

class fKEY {
  late String frequency;

  fKEY(this.frequency);
}

class MyProfScreen {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({Key? key}) : super(key: key);

  @override
  _MyProfileWidgetState createState() => _MyProfileWidgetState();
}

//String freq_task = "fff";

class _MyProfileWidgetState extends State<MyProfileWidget>
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
  int _selectedIndex = 0; //0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
                'MY PROFILE', //'ENDURANCE',
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
                                'Social Fitness Page: Coming Soon',
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
                              children: const <Widget>[
                                Text(
                                  "Showing results for goals.",
                                  //textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontSize: 16,
                                  ),
                                )
                              ]),
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
            ],
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
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
