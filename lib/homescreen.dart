import 'package:endurance_fitness/endurance_animations.dart';
import 'package:endurance_fitness/endurance_theme.dart';
//import 'package:endurance_fitness/endurance_util.dart';
import 'package:endurance_fitness/endurance_widgets.dart';

//import '../login/login_widget.dart';
//import '../sign_up/sign_up_widget.dart';

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:endurance_fitness/main.dart';
import 'package:endurance_fitness/loginscreen.dart';
import 'package:endurance_fitness/signupscreen.dart';

class Welcome {
  String value = "Begin";

  void increment() => value;

  void decrement() => value;
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 420,
      //hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 74),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 250,
      //hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 64),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: scaffoldKey,
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
                                          LoginWidget(), //WelcomeScreen(), //LOGIN
                                    ),
                                  );
                                },
                                text: 'Login',
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
                              ).animated([
                                animationsMap['buttonOnPageLoadAnimation1']!
                              ]),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpWidget(), //SIGNUP
                                    ),
                                  );
                                },
                                text: 'Sign Up',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 70,
                                  color:
                                      EnduranceTheme.of(context).primaryBlack,
                                  textStyle: EnduranceTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: EnduranceTheme.of(context)
                                            .lineColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: EnduranceTheme.of(context).lineColor,
                                    width: 1,
                                  ),
                                  //borderRadius: BorderRadius.circular(8),
                                ),
                              ).animated([
                                animationsMap['buttonOnPageLoadAnimation2']!
                              ]),
                            ),
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
