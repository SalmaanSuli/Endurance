///
/// Meals (dieting guide): Main Screen
///This UI screen allows the user to view different mealplans
///

//Imports
import 'package:animations/animations.dart';
import 'package:endurance_fitness/workoutWomen_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:endurance_fitness/workout_screen.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:endurance_fitness/endurance_theme.dart';
import 'diet_screen.dart';
import 'loseWeightDietScreen.dart';
import 'loseWeight_screen.dart';
import 'menDietScreen.dart';
import 'womenDietScreen.dart';
import 'package:endurance_fitness/profilescreen.dart';
import 'package:endurance_fitness/rulesscreen.dart';
import 'package:endurance_fitness/tasksscreen.dart';
import 'package:endurance_fitness/workoutscreen.dart';
import 'package:endurance_fitness/meal.dart';
import 'homescreen.dart';
import 'meal.dart';
import 'main.dart';
import 'globalvars.dart' as globalV;
//End Imports

class DietPage extends StatefulWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  //for navigation bar at bottom
  int _selectedIndex = 3; //0;

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
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();

    return Scaffold(
      backgroundColor: EnduranceTheme.of(context).primaryBlack,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.20,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: EnduranceTheme.of(context).primaryBlack,
                padding: const EdgeInsets.only(
                    top: 40, left: 32, right: 16, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color.fromARGB(255, 248, 249, 249),
                        ),
                      ),
                      subtitle: Text(
                        "CHOOSE YOUR DIET PLAN",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Color.fromARGB(255, 15, 223, 60),
                        ),
                      ),
                      //trailing: ClipOval(child: Image.asset("assets/user.jpg")),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.15,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: const Duration(milliseconds: 1000),
                      closedColor: EnduranceTheme.of(context).primaryBlack,
                      openBuilder: (context, _) {
                        return DietMenScreen();
                      },
                      closedBuilder: (context, VoidCallback openContainer) {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 0, right: 0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 7, 213, 31),
                                  Color.fromARGB(255, 11, 227, 29),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 16),
                                  /*child: Text(
                                    "YOUR NEXT WORKOUT",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ), */
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 16),
                                  child: Text(
                                    "DIET RECOMMENDATION FOR BODYBUILDERS",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Color.fromARGB(
                                              255, 243, 242, 245),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/fruits.jpg",
                                          width: 50,
                                          height: 50,
                                          // color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Color.fromARGB(
                                              255, 242, 241, 247),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/eggs.jpg",
                                          width: 50,
                                          height: 50,
                                          //color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Color.fromARGB(
                                              255, 244, 244, 246),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/drinks.jpg",
                                          width: 50,
                                          height: 50,
                                          //color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.40,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: const Duration(milliseconds: 1000),
                      closedColor: EnduranceTheme.of(context).primaryBlack,
                      openBuilder: (context, _) {
                        return DietWomenScreen();
                      },
                      closedBuilder: (context, VoidCallback openContainer) {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 0, right: 0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 7, 213, 31),
                                  Color.fromARGB(255, 11, 227, 29),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 16),
                                  /*child: Text(
                                    "YOUR NEXT WORKOUT",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ), */
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 16),
                                  child: Text(
                                    "DIET RECOMMENDATION FOR WOMEN FITNESS",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Color.fromARGB(
                                              255, 247, 247, 248),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/fruit.jpg",
                                          width: 50,
                                          height: 50,
                                          //color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Color.fromARGB(
                                              255, 250, 250, 251),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/veggies.jpg",
                                          width: 50,
                                          height: 50,
                                          //color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Color.fromARGB(
                                              255, 247, 246, 248),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/protein.jpg",
                                          width: 50,
                                          height: 50,
                                          //color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.65,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: const Duration(milliseconds: 1000),
                      closedColor: EnduranceTheme.of(context).primaryBlack,
                      openBuilder: (context, _) {
                        return DietLoseWeightScreen();
                      },
                      closedBuilder: (context, VoidCallback openContainer) {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 0, right: 0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 7, 213, 31),
                                  Color.fromARGB(255, 11, 227, 29),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 16),
                                  /*child: Text(
                                    "YOUR NEXT WORKOUT",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ), */
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 16),
                                  child: Text(
                                    "DIET RECOMMENDATION LOSING WEIGHT",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/pesto_pasta.jpg",
                                          width: 50,
                                          height: 50,
                                          //color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Color.fromARGB(
                                              255, 247, 246, 248),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/fruit_granola.jpg",
                                          width: 50,
                                          height: 50,
                                          //color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: Color.fromARGB(
                                              255, 249, 248, 250),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/keto_snack.jpg",
                                          width: 50,
                                          height: 50,
                                          //color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyWorkoutsWidget()));
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
    );
  }
}
