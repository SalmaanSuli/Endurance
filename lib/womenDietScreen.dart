///
///Women (Diet) Screen
///This class contains the UI elements for Women: Diet
///This displays the perfect diet for a women to stay in healthy shape
///

//Imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:endurance_fitness/women_workout.dart';
import 'package:endurance_fitness/endurance_theme.dart';
import 'women_diet_rec.dart';
//End Imports

//These function is responsible for the look of the Women's diet screen

class DietWomenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.pink,
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
                child: IconButton(
                  //Close women diet screen and go to home screen
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
                  "Womens Diet",
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
                  i < WomenDietRec.length;
                  i++) //Loops through the entire diet list and position classes in their positions
                Column(
                  children: <Widget>[
                    for (int j = 0; j < WomenDietRec[i].length; j++)
                      ListTile(
                        leading: Container(
                          //Diet image container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(255, 244, 244, 245),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            WomenDietRec[i][j].imagePath,
                            width: 45,
                            height: 45,
                            //color: Colors.white,
                          ),
                        ),
                        title: Text(
                          //Name of the food, diet recommendation
                          WomenDietRec[i][j].name,
                          style: TextStyle(
                            color: Color.fromARGB(255, 43, 228, 10),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          // Instruction of how is the died helpful, and what can you archieve
                          WomenDietRec[i][j].instruction,
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
