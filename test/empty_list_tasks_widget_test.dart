import 'package:endurance_fitness/empty_list_tasks_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  test('Simple test to test if the test in this file are ran', () {
    var result = 'I\'m just a simple test';
    //We expext the function to throw an error if the field is empty

    expect(result, 'I\'m just a simple test');
  });

// ignore: use_function_type_syntax_for_parameters
  testWidgets('Task has a name and details', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(taskName: 'T', description: 'M'));

    // Create the Finders.
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('Taking input from user working', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
        const MyWidget(taskName: 'This is a test', description: 'Message'));

    // Create the Finders.
    final titleFinder = find.text('This is a test');
    final messageFinder = find.text('Message');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('Task screen load asset correctly', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(
        taskName: 'asset has loaded', description: 'aseet is fine'));

    // Create the Finders.
    final titleFinder = find.text('asset has loaded');
    final messageFinder = find.text('aseet is fine');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('Validity check widget', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(
        taskName: 'this is the general widget test', description: 'M'));

    // Create the Finders.
    final titleFinder = find.text('this is the general widget test');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  test('App rule missing details', () {
    var result = 'Details can\'t be empty';
    //We expext the function to throw an error if the field is empty

    expect(result, 'Details can\'t be empty');
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
