import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:endurance_fitness/loginscreen.dart';

main() {
  test("Login screen", () {
    //setup

    //run

    //verify
  });

  test('empty or wrong password returns null', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'incorrect password');
  });

  test('password is not empty and its correct', () {
    var result = PasswordFieldValidator.validate('#123abcdeF');
    expect(result, '');
  });

  test('non-empty email returns null', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Please fill in all fields');
  });

  test('non-empty email returns null', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'incorrect password');
  });

  test('non-empty email returns null', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'incorrect password');
  });

  test('Email and password correct', () {
    var resultEmail = EmailFieldValidator.validate('sal6@gmail.com');
    var resultPass = PasswordFieldValidator.validate('#123abcdeF');
    var result = resultEmail + resultPass;
    expect(result, '');
  });
/*
  Widget makeTestableWidget({required Widget child}){
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    LoginWidget page = LoginWidget(onSignedIn: () {});

    await tester.pumpWidget(makeTestableWidget(child: page));

  });

  */
}
