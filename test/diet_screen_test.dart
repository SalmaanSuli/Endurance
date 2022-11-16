import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:endurance_fitness/upper_body_workout.dart';
import 'package:endurance_fitness/endurance_theme.dart';

import 'package:endurance_fitness/diet_screen.dart';

import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MockBuildContext _mockContext;

  DietScreen ds = DietScreen();

  /*
  testWidgets("Diet screen widget", (WidgetTester tester) async {
    _mockContext = MockBuildContext();
    //await tester.pumpWidget(DietScreen());
    //await tester.pump();
    //await tester.find.byWidget()
    Widget childWidget = Padding(
        padding: const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 16,
    ));
    /*
    Widget childWidget = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(_mockContext).pop();
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          title: Text(
            "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            "BODYBUILDER",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Color.fromARGB(77, 255, 255, 255),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "60 mins",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.shutter_speed,
                    color: Colors.white30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Expects",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        for (int i = 0; i < upperBody.length; i++)
          Column(
            children: <Widget>[
              ///this loop displays a list of all upperbody workouts
              for (int j = 0; j < upperBody[i].length; j++)
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 244, 244, 245),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      upperBody[i][j].imagePath,
                      width: 45,
                      height: 45,
                      //color: Colors.white,
                    ),
                  ),
                  title: Text(
                    upperBody[i][j].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    upperBody[i][j].instruction,
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
    );
    */

    // Provide the childWidget to the Container.
    await tester.pumpWidget(ds.build(_mockContext));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsNothing);
  });
  */
}
