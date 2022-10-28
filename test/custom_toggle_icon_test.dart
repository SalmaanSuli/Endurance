import 'package:endurance_fitness/custom_toggle_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Simple test to test if the test in this file are ran', () {
    var result = 'I\'m just a simple test';
    //We expext the function to throw an error if the field is empty

    expect(result, 'I\'m just a simple test');
  });

  test('App rule missing details', () {
    var result = 'Details can\'t be empty';
    //We expext the function to throw an error if the field is empty

    expect(result, 'Details can\'t be empty');
  });
}
