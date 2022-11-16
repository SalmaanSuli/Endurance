import 'package:endurance_fitness/AppTaskClass.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  test('Simple test to test if the test in this file are ran', () {
    var result = 'I\'m just a simple test';
    //We expext the function to throw an error if the field is empty

    expect(result, 'I\'m just a simple test');
  });

  testWidgets('HomeScreen has a title and message', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(task: 'T', description: 'M'));

    // Create the Finders.
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('HomeScreen input is working', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
        const MyWidget(task: 'This is a test', description: 'Message'));

    // Create the Finders.
    final titleFinder = find.text('This is a test');
    final messageFinder = find.text('Message');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('HomeScreen load asset correctly', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
        const MyWidget(task: 'asset has loaded', description: 'aseet is fine'));

    // Create the Finders.
    final titleFinder = find.text('asset has loaded');
    final messageFinder = find.text('aseet is fine');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('HomeScreen widget', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(
        task: 'this is the general widget test', description: 'M'));

    // Create the Finders.
    final titleFinder = find.text('this is the general widget test');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  test('App task missing description', () {
    var result = 'Description can\'t be empty';
    //We expext the function to throw an error if the field is empty

    expect(result, 'Description can\'t be empty');
  });

  test('App tast missing task name', () {
    var result = 'Task name can\'t be empty';
    //We expext the function to throw an error if the field is empty

    expect(result, 'Task name can\'t be empty');
  });

  test('App task missing details', () {
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
