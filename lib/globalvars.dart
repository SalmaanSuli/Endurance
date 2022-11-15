///
///Global Vars
///A class that contains variables used throughout the app across different classes
///

//Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//End Imports

//STORES
bool isLoggedIn_GLOBAL = false;
String email_GLOBAL = "";
BuildContext? context_GLOBAL;
String id_GLOBAL = "";

//For multiples uses, depending on the context
String freq_GLOBAL = "";
String wkDAY_GLOBAL = "";
String freq_initial_GLOBAL = "all";
String wkDAY_initial_GLOBAL = "all";

//Tasks
String taskName_db_GLOBAL = "MyName";
String taskDescription_db_GLOBAL = "Desc";
String taskEmail_db_GLOBAL = email_GLOBAL;
bool taskState_db_GLOBAL = false;
DateTime datePicked_GLOBAL = DateTime(2000, 1, 10);
String taskFreq_db_GLOBAL = "None";
//END Tasks

bool clickedUpdateTask = false;
String taskCheckComplete = "Complete";

//RULES
int countRule = 0;

String ruleName_db_GLOBAL = "MyName";
String ruleDescription_db_GLOBAL = "Desc";
String ruleID_GLOBAL = "";
//END RULES

//WOKROUTS
String wkDay_db_GLOBAL = "All";
String wkExercise_db_GLOBAL = "Exercise";
String wkDescription_db_GLOBAL = "Description";
String wkEmail_db_GLOBAL = email_GLOBAL;
int wkSets_db_GLOBAL = 0;
int wkReps_db_GLOBAL = 0;

String wkDayInitial_db_GLOBAL = "All";

String wkid_GLOBAL = "";

//END WORKOUTS

//This function allows one to logout of the app
//It logs them out, resets the global email variable, and displays a message
void logoutGLOBAL(BuildContext context) {
  isLoggedIn_GLOBAL = false;
  email_GLOBAL = "";
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("Logged out...")));
}
