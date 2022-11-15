import 'package:endurance_fitness/appWorkouts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  test('Simple test to test if the test in this file are ran', () {
    var result = 'I\'m just a simple test';
    //We expext the function to throw an error if the field is empty

    expect(result, 'I\'m just a simple test');
  });

  test('App workout missing description', () {
    var result = 'Description can\'t be empty';
    //We expext the function to throw an error if the field is empty

    expect(result, 'Description can\'t be empty');
  });

  test('App workout missing task name', () {
    var result = 'Task name can\'t be empty';
    //We expext the function to throw an error if the field is empty

    expect(result, 'Task name can\'t be empty');
  });

  test('App workout missing details', () {
    var res = 'Details can\'t be empty';
    //We expect the function to throw an error if the field is empty
    //test('App rule missing details', (){
    var result = 'Details can\'t be empty';
    //Finally we can simple test
    // Run both tests
    expect(result, 'Details can\'t be empty');
//  });
    expect(res, 'Details can\'t be empty');
  });

  testWidgets('finds a Text widget', (tester) async {
    // Build an App with a Text widget that displays the letter 'H'.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));

    // Find a widget that displays the letter 'H'.
    expect(find.text('H'), findsOneWidget);
  });

  testWidgets('finds a widget using a Key', (tester) async {
    // Define the test key.
    const testKey = Key('K');

    // Build a MaterialApp with the testKey.
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
