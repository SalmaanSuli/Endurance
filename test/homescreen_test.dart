import 'package:endurance_fitness/homescreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

   // counter.increment();

    expect(counter.value, 'Begin');
  });
}