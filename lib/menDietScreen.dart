///
///Dieting (MEN)
///This class displays diets for men to follow and bulk (gain muscle and get bigger)
///

//Imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:endurance_fitness/women_workout.dart';
import 'package:endurance_fitness/endurance_theme.dart';
import 'diet_men_rec.dart';
//End Imports

class DietMenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

//These function are responsible for the look of the Men's diet screen

    return Scaffold(
      backgroundColor: EnduranceTheme.of(context).primaryBlack,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),

                //Close Men diet screen and go to home screen
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
                //Display the current date

                title: Text(
                  "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  //Title
                  "BODYBUILDER Diet",
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
                  i < MenDietRec.length;
                  i++) //Loops through the entire diet list and position classes in their positions
                Column(
                  children: <Widget>[
                    for (int j = 0; j < MenDietRec[i].length; j++)
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(255, 244, 244, 245),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            //Diet image container
                            MenDietRec[i][j].imagePath,
                            width: 45,
                            height: 45,
                            //color: Colors.white,
                          ),
                        ),
                        title: Text(
                          //Name of the food, diet recommendation
                          MenDietRec[i][j].name,
                          style: TextStyle(
                            color: Color.fromARGB(255, 5, 230, 65),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          // Instruction of how is the died helpful, and what can you archieve
                          MenDietRec[i][j].instruction,
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
