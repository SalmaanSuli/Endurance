//global vars

import 'package:flutter/cupertino.dart';

bool isLoggedIn_GLOBAL = false;
String freq_GLOBAL = "";
String freq_initial_GLOBAL = "all";
String email_GLOBAL = "";
BuildContext? context_GLOBAL;
String id_GLOBAL = "";

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
