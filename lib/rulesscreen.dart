import 'package:endurance_fitness/endurance_animations.dart';
import 'package:endurance_fitness/endurance_theme.dart';
import 'package:endurance_fitness/endurance_util.dart';
import 'package:endurance_fitness/endurance_widgets.dart';

import 'package:endurance_fitness/create_rule_new_widget.dart';
import 'package:endurance_fitness/custom_toggle_icon.dart';
import 'package:endurance_fitness/empty_list_tasks_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:endurance_fitness/loginscreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:endurance_fitness/AppRuleClass.dart';

import 'package:endurance_fitness/main.dart';
import 'package:endurance_fitness/update_tasksscreen.dart';
import 'package:endurance_fitness/update_tasksscreen_wrapper.dart';

import 'package:endurance_fitness/globalvars.dart' as globalV;

import 'package:holding_gesture/holding_gesture.dart';

import 'package:push/push.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:endurance_fitness/profilescreen.dart';
import 'package:endurance_fitness/tasksscreen.dart';

import 'package:endurance_fitness/update_rule_widget.dart';

class fKEY {
  late String frequency;

  fKEY(this.frequency);
}

class MyRulesWidget extends StatefulWidget {
  const MyRulesWidget({Key? key}) : super(key: key);

  @override
  _MyRulesWidgetState createState() => _MyRulesWidgetState();
}

class _MyRulesWidgetState extends State<MyRulesWidget>
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
  int _selectedIndex = 2; //0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
                'MY RULES', //'ENDURANCE',
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
                    child: CreateRuleNewWidget(),
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
                flex: 12,
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
                                'My Rules',
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                'assets/ENDURANCE_header_rules2.jpg',
                              ).image,
                            ),
                          ),
                        )
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
                  ),
                ),
              ),
              Expanded(
                flex: 15,
                child: StreamBuilder<List<AppRule>>(
                  //future: readAppTasks().first,
                  //stream: readAppTasks_wrapper(fKEY.fkey), //.first,
                  //stream: readAppTasks_wrapper(freq_task),
                  stream: readAppRules_wrapper(
                      globalV.freq_GLOBAL, globalV.email_GLOBAL),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong! ${snapshot.error}',
                          style: TextStyle(color: Colors.white));
                    } else if (snapshot.hasData) {
                      final tasks = snapshot.data!;
                      //print("email is " + globalV.email_GLOBAL);

                      return ListView(
                        children: tasks.map(buildAppRule).toList(),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyProfileWidget()));
                  break;
                case 1:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyTasksWidget()));
                  break;
                case 2:
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

Widget buildAppRule(AppRule t) => ListTile(
    leading: CircleAvatar(
        child: Text('o', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green),
    title: Text(t.ruleName,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    subtitle: Text(t.ruleDescription,
        style: const TextStyle(color: Color(0xFFE0E3E7))),
    onTap: () async {
      globalV.ruleName_db_GLOBAL = t.ruleName;
      globalV.ruleDescription_db_GLOBAL = t.ruleDescription;
      globalV.ruleID_GLOBAL = t.id;
      print(t.id);
      await showDialog<void>(
        context: globalV.context_GLOBAL!,
        builder: (BuildContext context) {
          return updateRulePrompt_bottom(context);
        },
      );
    });

Future updateRuleTask(AppRule t) async {
  final docUser = FirebaseFirestore.instance.collection('appRules').doc(t.id);

  await docUser.update({
    'Name': t.ruleName, //!bValue, //to update
    'Description': t.ruleDescription,
    //'hello': FieldValue.delete(), //to delete the field for the record
  });
}

//////////////////////////////////////////////////
///

Widget updateRulePrompt_bottom(BuildContext context) {
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
                          'Click to Delete or Modify your Rule.',
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
                            final docUser = FirebaseFirestore.instance
                                .collection('appRules')
                                .doc(globalV.ruleID_GLOBAL)
                                .delete();

                            Navigator.pop(context);
                          },
                          text: '🗑️ Delete',
                          options: FFButtonOptions(
                            width: 110,
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
                        Spacer(),
                        FFButtonWidget(
                          onPressed: () {
                            BuildContext? ctx = globalV.context_GLOBAL;
                            context = ctx!;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateRuleNewWidget(),
                                ));
                            //Navigator.pop(context);
                          },
                          text: 'Update Rule',
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
