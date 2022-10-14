import 'package:endurance_fitness/profilescreen.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Counter', () {
    test('value before loading assets', () {
      expect(MyProfScreen().value, 0);
    });

    test('value should be incremented after laoding 1 assset', () {
      final counter = MyProfScreen();

      counter.increment();

      expect(counter.value, 1);
    });

    test('when error', () {
      final counter = MyProfScreen();

      counter.decrement();

      expect(counter.value, -1);
    });
  });

  test('value should be incremented after laoding 1 assset', () {
    final counter = MyProfScreen();

    counter.increment();

    expect(counter.value, 1);
  });

  test('value should be incremented after laoding 1 assset', () {
    final counter = MyProfScreen();

    counter.increment();

    expect(counter.value, 1);
  });
}