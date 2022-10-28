import 'package:endurance_fitness/tasksscreen.dart';
import 'package:flutter/material.dart';
import 'package:endurance_fitness/homescreen.dart'; //import 'package:flutter/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:endurance_fitness/endurance_animations.dart';

import 'package:endurance_fitness/endurance_theme.dart';

import 'package:endurance_fitness/endurance_widgets.dart';

import 'package:endurance_fitness/globalvars.dart' as globalV;

//void main() => runApp(MyApp());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreenWidget()));
    */
    return MaterialApp(
      title: 'Endurance Home', //'Flutter Demo',
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: scaffoldKey,
      backgroundColor: EnduranceTheme.of(context).primaryBlack,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: EnduranceTheme.of(context).primaryBlack,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              'assets/welcomePage_2.jpg',
            ).image,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '',
                      style: EnduranceTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            fontSize: 0,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 24, 24),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreenWidget(), //WelcomeScreen(), //LOGIN
                                    ),
                                  );
                                },
                                text: 'Begin',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 70,
                                  color: EnduranceTheme.of(context).darkBG,
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF9AC62B),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Color(0xFF9AC62B),
                                    width: 1,
                                  ),
                                  //borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            /*
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 24, 24),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  globalV.email_GLOBAL = "sal6@gmail.com";
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MyTasksWidget(), //MyTasksWidget( fkey: "daily"), //WelcomeScreen(), //LOGIN
                                    ),
                                  );
                                },
                                text: 'Bypass Login (Testing)',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 70,
                                  color: EnduranceTheme.of(context).darkBG,
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF9AC62B),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Color(0xFF9AC62B),
                                    width: 1,
                                  ),
                                  //borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            */
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
