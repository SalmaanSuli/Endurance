import 'package:endurance_fitness/update_rule_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  test('Simple test to test if the test in this file are ran', () {
    var result = 'I\'m just a simple test';
    //We expext the function to throw an error if the field is empty

    expect(result, 'I\'m just a simple test');
  });

  test('empty rule details', () {
    //Simple init test to check when the rule is not filled
    var result = RuleDetailsFieldValidator.validate('');
    //If the rule detail field is empty, should display Please fill in all field
    expect(result, 'Please fill in all fields');
  });

  test('empty rule name field', () {
    var result = RuleNameFieldValidator.validate('');
    //Validate result
    //If the rule name field is empty, should display Please fill in all field
    expect(result, 'Please fill in all fields');
  });

  testWidgets('Simple test on rule and detail fields', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(rule: 'T', detail: 'M'));

    // Create the Finders.
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('Multi text on fields', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester
        .pumpWidget(const MyWidget(rule: 'This is a test', detail: 'Message'));

    // Create the Finders.
    final titleFinder = find.text('This is a test');
    final messageFinder = find.text('Message');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('Everything filled correctly load asset correctly',
      (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
        const MyWidget(rule: 'asset has loaded', detail: 'aseet is fine'));

    // Create the Finders.
    final titleFinder = find.text('asset has loaded');
    final messageFinder = find.text('aseet is fine');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('Update rule if all filled are valid widget', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester
        .pumpWidget(const MyWidget(rule: 'finish sprint 2', detail: 'marking'));

    // Create the Finders.
    final titleFinder = find.text('finish sprint 2');
    final messageFinder = find.text('marking');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
  //////////////////////////////////////////
  ///
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
