///
///AppWorkout
///------------
///This is a class of "Workouts", which are custom workout created by the user
///------------
///A Workout has a name, description, day, state (checked/unchecked), number of sets and reps, and the user's email
///It can be created, updated, deleted, and displayed as a list, as well as queried
///
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//This is a class of Workout, which contains a name (workoutExercise), description, day, state (checked/unchecked), number of sets and reps, and the user's email
class AppWorkout {
  String id;
  final String workoutDay;
  final String workoutExercise;
  final int workoutSets;
  final int workoutReps;
  final String workoutDescription;
  final String workoutEmail;
  final bool workoutState;

  AppWorkout({
    this.id = '',
    required this.workoutDay,
    required this.workoutExercise,
    required this.workoutSets,
    required this.workoutReps,
    required this.workoutDescription,
    required this.workoutEmail,
    required this.workoutState,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'Day': workoutDay,
        'Exercise': workoutExercise,
        'Sets': workoutSets,
        'Reps': workoutReps,
        'Description': workoutDescription,
        'Email': workoutEmail,
        'State': workoutState,
      };

  static AppWorkout fromJson(Map<String, dynamic> json) => AppWorkout(
        id: json['id'] ?? '',
        workoutDay: json['Day'] ?? '',
        workoutExercise: json['Exercise'] ?? '',
        workoutSets: json['Sets'] ?? 0,
        workoutReps: json['Reps'] ?? 0,
        workoutDescription: json['Description'] ?? '',
        workoutEmail: json['Email'] ?? '',
        workoutState: json['State'] ?? false,
      );
}

//A workout can be created by the user
Future createAppWorkout({
  required String id,
  required String workoutExercise,
  required String workoutDay,
  required String workoutDescription,
  required String workoutEmail,
  required int workoutSets,
  required int workoutReps,
  required bool workoutState,
}) async {
  final docUser = FirebaseFirestore.instance.collection('appWorkout').doc();

  final _workout = AppWorkout(
    id: docUser.id, //workoutEmail,
    workoutDay: workoutDay,
    workoutDescription: workoutDescription,
    workoutEmail: workoutEmail,
    workoutSets: workoutSets,
    workoutReps: workoutReps,
    workoutExercise: workoutExercise,
    workoutState: workoutState,
  );

  final json = _workout.toJson();

  await docUser.set(json);
}

//A workout can be updated by the user
Future updateAppWorkoutPage(AppWorkout t) async {
  final docUser = FirebaseFirestore.instance.collection('appWorkout').doc(t.id);

  print(t.id);
  //print("HELLLOOOO");

  await docUser.update({
    'Day': t.workoutDay,
    'Exercise': t.workoutExercise,
    'Sets': t.workoutSets,
    'Reps': t.workoutReps,
    'Description': t.workoutDescription,
    'State': t.workoutState,
    //'hello': FieldValue.delete(), //to delete the field for the record
  });
}

//To display a list of workouts: this is a wrapper that determines whether to display ALL workouts, or only queried ones
Stream<List<AppWorkout>> readAppWorkouts_wrapper(String _day, String email) {
  if (_day == "") {
    return readAppWorkouts_noQuery(email);
  } else {
    return readAppWorkouts(_day, email);
  }
}

//To display a list of ALL workouts
Stream<List<AppWorkout>> readAppWorkouts_noQuery(String email) =>
    FirebaseFirestore.instance
        .collection('appWorkout')
        .where("Email", isEqualTo: email)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AppWorkout.fromJson(doc.data()))
            .toList());

//To display a list of workouts, queried by day (M, T, W, Th, F, Sa, Su)
Stream<List<AppWorkout>> readAppWorkouts(String day, String email) =>
    FirebaseFirestore.instance
        .collection('appWorkout')
        .where("Day", isEqualTo: day)
        .where("Email", isEqualTo: email)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AppWorkout.fromJson(doc.data()))
            .toList());

//To display a single workout
Future<AppWorkout?> readAppWorkout(String sID) async {
  final docUser = FirebaseFirestore.instance.collection('appWorkout').doc(sID);
  final snapshot = await docUser.get();

  if (snapshot.exists) {
    return AppWorkout.fromJson(snapshot.data()!);
  }
}

/*
String getWorkoutFreq(String value) {
  if (value == "Daily") {
    return "daily";
  } else if (value == "Weekly") {
    return "weekly";
  } else if (value == "Monthly") {
    return "monthly";
  } else if (value == "Yearly") {
    return "yearly";
  } else if (value == "None") {
    return "none";
  }
  return "";
}

String getReverseWorkoutFreq(String value, bool display) {
  if (value == "daily") {
    return "Daily";
  } else if (value == "weekly") {
    return "Weekly";
  } else if (value == "monthly") {
    return "Monthly";
  } else if (value == "yearly") {
    return "Yearly";
  } else if (value == "none") {
    if (display) {
      return "No";
    }
    return "None";
  }
  return "";
}
*/