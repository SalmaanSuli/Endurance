import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:endurance_fitness/signupscreen.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:endurance_fitness/globalvars.dart' as globalV;
import 'package:mockito/mockito.dart';

import 'package:crypto/crypto.dart';
import 'package:crypt/crypt.dart';

import 'package:endurance_fitness/AppTaskClass.dart';
//import 'package:endurance_fitness/main.dart';

import 'package:endurance_fitness/appWorkouts.dart';
//import 'package:endurance_fitness/workoutscreen.dart';

import 'package:endurance_fitness/slim_diet_rec.dart';

import 'package:endurance_fitness/women_diet_rec.dart' as womanRec;
import 'package:endurance_fitness/diet_men_rec.dart' as manRec;
import 'package:endurance_fitness/lose_weight.dart' as loseRec;
import 'package:endurance_fitness/meal.dart';
import 'package:endurance_fitness/upper_body_workout.dart' as UBW;
import 'package:endurance_fitness/women_workout.dart' as WW;

//import 'package:endurance_fitness/endurance_util.dart';
//import 'package:endurance_fitness/custom_toggle_icon.dart';

const MessagesCollection = 'appWorkout';

class MockBuildContext extends Mock implements BuildContext {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //navigatorKey: NavigationService.materialKey,
      debugShowCheckedModeBanner: false,
      title: 'Endurance Home',
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: scaffoldKey,
        backgroundColor: Colors.green,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.green,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/welcomePage_2.jpg',
              ).image,
            ),
          ),
          child: Spacer(),
        ));
  }
}

//Check if the password is valid
//Must not be empty
//Must be at least 8 characters long
//Must have an uppercase character
//Must have an lowercase character
//Must have a digit
//Must have a special character
//If any of the above are not true, an error message is displayed
bool isValidPass(String pass, BuildContext context, [int minLength = 8]) {
  bool valid = false;

  bool notEmpty = !pass.isEmpty;
  bool notShort = pass.length >= minLength;

  bool hasUppercase = pass.contains(new RegExp(r'[A-Z]'));
  bool hasDigits = pass.contains(new RegExp(r'[0-9]'));
  bool hasLowercase = pass.contains(new RegExp(r'[a-z]'));
  bool hasSpecial = pass.contains(new RegExp(r'[!@#$%^&*()-=,.<>:"{}?`~]'));

  valid = notEmpty &&
      notShort &&
      hasUppercase &&
      hasLowercase &&
      hasDigits &&
      hasSpecial;

  String errorMsg =
      "Password must be 8 characters, have an uppercase, lowercase, special, and digit.";
  if (!valid) {
    if (!notEmpty) {
      errorMsg = "Password cannot be empty.";
    } else if (!notShort) {
      errorMsg = "Password must be at least 8 characters.";
    } else if (!hasUppercase) {
      errorMsg = "Password must have an Uppercase letter.";
    } else if (!hasLowercase) {
      errorMsg = "Password must have a lowercase letter.";
    } else if (!hasDigits) {
      errorMsg = "Password must contain a digit.";
    } else if (!hasSpecial) {
      errorMsg = "Password must contain a special character, like &,#,%.";
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorMsg)));
  }

  return valid;
}

//Takes in a password, converts it to a hashed string that is secure to store in the database
//uses sha256 hashing algorithm
String hashPass(String pass) {
  String hashedPass;
  hashedPass = pass;

  hashedPass =
      Crypt.sha256(pass, rounds: 10000, salt: 'abcdefghijklmnop').toString();
  //final h = Crypt(hashString);

  //const correctValue = 'p@ssw0rd';
  //const wrongValue = '123456';
  /*
    if (!h.match(correctValue)) {
      print('Error: unexpected non-match: $correctValue');
    }

    if (h.match(wrongValue)) {
      print('Error: unexpected match: $wrongValue');
    }
    """;
    */

  return hashedPass;
}

void main() {
  MockBuildContext _mockContext;
  testWidgets('Main Run App', (WidgetTester tester) async {
    // Populate the fake database.
    final firestore = FakeFirebaseFirestore();
    await firestore.collection(MessagesCollection);

    // Render the widget.
    await tester
        .pumpWidget(MaterialApp(title: 'Endurance Home', home: MyApp()));
    // Let the snapshots stream fire a snapshot.
    await tester.idle();
    // Re-render.
    await tester.pump();
    // // Verify the output.
    expect(find.text('Hello world!'), findsNothing);
  });

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

  //Workouts
  AppWorkout t = AppWorkout(
      workoutDay: 'M',
      workoutExercise: 'workoutExercise',
      workoutSets: 3,
      workoutReps: 5,
      workoutDescription: 'workoutDescription',
      workoutEmail: 'sal6@gmail.com',
      workoutState: false);

  group("Group: Workouts", () {
    test('Get correct color', () {
      Color c = Colors.black;

      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      c = getColor(interactiveStates);

      expect(c, Colors.lightGreen);
    });

    test('Testing the workout class', () {
      expect(t.workoutState, false);
    });

    test('Get (in)correct color', () {
      Color c = Colors.black;

      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.dragged
      };
      c = getColor(interactiveStates);

      expect(c, Colors.green);
    });
  });

  group("Signing up:", () {
    test("is a valid password", () {
      _mockContext = MockBuildContext();
      bool b = isValidPass("#123abcdeF", _mockContext);
      expect(b, true);
    });
    test("hashes password", () {
      String hash = hashPass("hello");
      String hashedPass =
          Crypt.sha256("hello", rounds: 10000, salt: 'abcdefghijklmnop')
              .toString();
      expect(hash, hashedPass);
    });
  });

  group("Diet and Workout Guides", () {
    test('Slim Diet', () {
      bool b = false;
      UpperBodyWorkout UB = UpperBodyWorkout(
        imagePath: "assets/drinks.jpg",
        name: "Fruit milkshake",
        instruction: "They accelerate your metabolism and detoxify your body",
      );
      for (int i = 0; i < SlimDietRec.length; i++) {
        for (int j = 0; j < 3; j++) {
          if (SlimDietRec[i][j].imagePath == UB.imagePath) {
            b = true;
          }
        }
      }
      expect(b, true);
    });

    test('Woman Diet', () {
      bool b = false;
      womanRec.UpperBodyWorkout UB = womanRec.UpperBodyWorkout(
        imagePath: "assets/drinks.jpg",
        name: "Fruit milkshake",
        instruction: "They accelerate your metabolism and detoxify your body",
      );
      for (int i = 0; i < womanRec.WomenDietRec.length; i++) {
        for (int j = 0; j < 3; j++) {
          if (womanRec.WomenDietRec[i][j].imagePath == UB.imagePath) {
            b = true;
          }
        }
      }
      expect(b, true);
    });

    test('Men Diet', () {
      bool b = false;
      manRec.UpperBodyWorkout UB = manRec.UpperBodyWorkout(
        imagePath: "assets/drinks.jpg",
        name: "Chia Pudding",
        instruction:
            "They are high in protein and contain ALA, a plant-based form of omega 3 essential fatty acids.",
      );
      for (int i = 0; i < manRec.MenDietRec.length; i++) {
        for (int j = 0; j < 3; j++) {
          if (manRec.MenDietRec[i][j].imagePath == UB.imagePath) {
            b = true;
          }
        }
      }
      expect(b, true);
    });

    test('Lose Diet', () {
      bool b = false;
      loseRec.UpperBodyWorkout UB = loseRec.UpperBodyWorkout(
        imagePath: "assets/weight4.jpg",
        name: "Step up",
        instruction: "4 sets - 20 repitions",
      );
      for (int i = 0; i < loseRec.looseWeight.length; i++) {
        for (int j = 0; j < 3; j++) {
          if (loseRec.looseWeight[i][j].imagePath == UB.imagePath) {
            b = true;
          }
        }
      }
      expect(b, true);
    });

    Meal mealM = Meal(
        mealTime: "SNACK",
        name: "Keto Snack",
        kiloCaloriesBurnt: "414",
        timeTaken: "16",
        imagePath: "assets/keto_snack.jpg",
        ingredients: [
          "1 cup of granola",
          "1 banana",
          "1/2 cup of raisins",
          "1 tbsp of honey",
        ],
        preparation:
            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum tempus egestas sed sed risus pretium quam. Platea dictumst quisque sagittis purus sit. Senectus et netus et malesuada fames ac turpis egestas sed. Nibh cras pulvinar mattis nunc. Amet consectetur adipiscing elit duis tristique. Interdum velit euismod in pellentesque massa placerat duis ultricies lacus. Lectus proin nibh nisl condimentum id venenatis. Sit amet massa vitae tortor condimentum lacinia quis vel eros. Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Enim tortor at auctor urna. In dictum non consectetur a.

Sit amet risus nullam eget. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Turpis cursus in hac habitasse platea dictumst quisque sagittis. Eget mi proin sed libero. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Neque viverra justo nec ultrices dui. Gravida neque convallis a cras semper. Morbi tempus iaculis urna id volutpat lacus laoreet non. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Amet mattis vulputate enim nulla aliquet. Lectus urna duis convallis convallis tellus. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Adipiscing vitae proin sagittis nisl. Sed libero enim sed faucibus turpis in. Pulvinar mattis nunc sed blandit. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Sed id semper risus in hendrerit.

Consectetur adipiscing elit duis tristique sollicitudin nibh. Dictumst quisque sagittis purus sit amet volutpat. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Mauris pharetra et ultrices neque. Leo duis ut diam quam nulla porttitor. Sit amet facilisis magna etiam tempor orci eu lobortis elementum. Blandit massa enim nec dui. Aliquam id diam maecenas ultricies mi eget mauris. Mattis rhoncus urna neque viverra justo nec ultrices. Nibh tellus molestie nunc non blandit. Non diam phasellus vestibulum lorem. Ut diam quam nulla porttitor massa id neque aliquam. Eget mauris pharetra et ultrices neque ornare aenean euismod. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Tellus in hac habitasse platea dictumst vestibulum.

Adipiscing commodo elit at imperdiet. Mollis nunc sed id semper risus. Magna fermentum iaculis eu non. Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Amet consectetur adipiscing elit ut aliquam purus sit amet. Ultrices sagittis orci a scelerisque purus semper. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Massa tempor nec feugiat nisl pretium. Etiam dignissim diam quis enim lobortis scelerisque. Duis ut diam quam nulla.

Ultricies lacus sed turpis tincidunt id aliquet risus feugiat. Vitae aliquet nec ullamcorper sit amet risus. Malesuada nunc vel risus commodo viverra. Id aliquet risus feugiat in ante metus dictum at tempor. Commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Ipsum dolor sit amet consectetur. In nibh mauris cursus mattis molestie a. Duis at consectetur lorem donec massa sapien faucibus et molestie. Amet nisl purus in mollis nunc sed id. Sagittis vitae et leo duis ut. Purus in mollis nunc sed id. Mauris ultrices eros in cursus turpis.''');

    test('meal', () {
      bool b = false;
      for (int i = 0; i < meals.length; i++) {
        //for (int j = 0; j < 3; j++) {
        if (meals[i].preparation == mealM.preparation) {
          b = true;
        }
        //}
      }
      expect(b, true);
    });

    test('Upper Body Workout', () {
      bool b = false;
      UBW.UpperBodyWorkout UB = UBW.UpperBodyWorkout(
        imagePath: "assets/legs.jpg",
        name: "Step up",
        instruction: "4 sets - 20 repitions",
      );
      for (int i = 0; i < UBW.upperBody.length; i++) {
        for (int j = 0; j < 3; j++) {
          if (UBW.upperBody[i][j].imagePath == UB.imagePath) {
            b = true;
          }
        }
      }
      expect(b, true);
    });

    test('Woman Workout', () {
      bool b = false;
      WW.UpperBodyWorkout UB = WW.UpperBodyWorkout(
        imagePath: "assets/lady6.png",
        name: "Wide curl",
        instruction: "4 sets - 20 repitions",
      );
      for (int i = 0; i < WW.Women.length; i++) {
        for (int j = 0; j < 3; j++) {
          if (WW.Women[i][j].imagePath == UB.imagePath) {
            b = true;
          }
        }
      }
      expect(b, true);
    });
  });

/*
  group("Utils:", () {
    test("datetime format", () {
      String s = dateTimeFormat('yyyy-MM-dd – kk:mm', DateTime.now());
      //_mockContext = MockBuildContext();
      //showSnackbar(_mockContext, "hello");
      expect(s, DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()));
    });
*/
  /*
    test("Toggle Icon", () {
      final bool value;

      Widget testFunction() {
        return Container(
          child: Text("Hello World"),
          icon: 
        );
      }

      ;

      final Function() onPressed = testFunction;
      final Widget onIcon;
      final Widget offIcon;

      ToggleIcon TI = ToggleIcon(true, onPressed, Icons.print, Icons.link);
    });
    */
  //});

/*
  group("Global Variables", () {
    test("Logging Out", () {
      _mockContext = MockBuildContext();
      globalV.logoutGLOBAL(_mockContext);
    });
  });
*/
}
