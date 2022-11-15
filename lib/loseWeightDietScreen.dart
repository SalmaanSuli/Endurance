///
///Lose Weight Diet Screen (SLim Diets)
///This is the UI of Diets for weight loss (slim body type)
///

//Imports
import 'package:endurance_fitness/slim_diet_rec.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:endurance_fitness/women_workout.dart';
import 'package:endurance_fitness/endurance_theme.dart';
//End Imports

class DietLoseWeightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    //These function is responsible for the look of the slimmer's diet screen

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 39, 119),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0), //Close slim diet screen and go to home screen
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}", //Shows the current date and current time
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  //Title
                  "Diet for weight loss",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              for (int i = 0;
                  i < SlimDietRec.length;
                  i++) //Loops through the entire diet list and position classes in their positions
                Column(
                  children: <Widget>[
                    for (int j = 0; j < SlimDietRec[i].length; j++)
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(255, 244, 244, 245),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            //Diet image container
                            SlimDietRec[i][j].imagePath,
                            width: 45,
                            height: 45,
                            //color: Colors.white,
                          ),
                        ),
                        title: Text(
                          //Name of the food, diet recommendation
                          SlimDietRec[i][j].name,
                          style: TextStyle(
                            color: Color.fromARGB(255, 7, 244, 31),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          // Instruction of how is the died helpful, and what can you archieve
                          SlimDietRec[i][j].instruction,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
