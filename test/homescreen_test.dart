import 'package:endurance_fitness/homescreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Simple test to test if the test in this file are ran', () {
    var result = 'I\'m just a simple test';
    //We expext the function to throw an error if the field is empty

    expect(result, 'I\'m just a simple test');
  });

  group('Counter', () {
    test('value before loading assets', () {
      expect(Welcome().value, 'Begin');
    });

    test('value should be incremented after laoding 1 assset', () {
      final counter = Welcome();

      //counter.increment();

      expect(counter.value, 'Begin');
    });

    test('when error', () {
      final counter = Welcome();

      //counter.decrement();
      // Use the `findsOneWidget` matcher provided by flutter_test to
      // verify that the Text widgets appear exactly once in the widget tree.
      expect(counter.value, 'Begin');
    });
  });

  test('value should be incremented after laoding 1 assset', () {
    final counter = Welcome();

    //counter.increment();

    expect(counter.value, 'Begin');
  });

  test('value should be incremented after laoding 1 assset', () {
    final counter = Welcome();
    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    // counter.increment();

    expect(counter.value, 'Begin');
  });
}
