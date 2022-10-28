import 'package:flutter_test/flutter_test.dart';
import 'package:endurance_fitness/signupscreen.dart';

main() {
  test("Sign Up screen", () {
    //setup

    //run

    //verify
  });

  test('empty email', () {
    //Validate email from the user
    var result = EmailFieldValidator.validate('');
    //If no input return:
    expect(result, 'Please fill in all fields');
  });

  test('empty name field', () {
    //Validate input name from the user
    var result = NameFieldValidator.validate('');
    //If no input return:
    expect(result, 'Please fill in all fields');
  });

  test('short password', () {
    //Validate password input
    var res = PasswordFieldValidator.validate('');
    //initialise result
    var result = 'Password must be at least 8 characters.';
    //The expected value when password is shirt i.e. less than 8 characters;
    expect(result, 'Password must be at least 8 characters.');
  });

  test('empty password', () {
    //Validate password input
    var res = PasswordFieldValidator.validate('');
    //initialise result
    var result = 'Password cannot be empty';
    //The expected value when password empty;
    expect(result, 'Password cannot be empty');
  });

  test('password with no upper case', () {
    //Validate password input
    var res = PasswordFieldValidator.validate('');
    //initialise result
    var result = 'Password must have an Uppercase letter.';
    //The expected valuue when password doesn't include upper case;
    expect(result, 'Password must have an Uppercase letter.');
  });

  test('password with no numerical values', () {
    //Validate password input
    var res = PasswordFieldValidator.validate('');
    //initialise result
    var result = 'Password must contain a digit.';
    //The expected value when password doesn't contain a didgit;
    expect(result, 'Password must contain a digit.');
  });

  test('password with no lower cases', () {
    //Validate password input
    var res = PasswordFieldValidator.validate('');
    //initialise result
    var result = 'Password must have an Lowercase letter.';
    //The expected value when password doesn't have lower case;
    expect(result, 'Password must have an Lowercase letter.');
  });

  test('password with no special character', () {
    //Validate password input
    var res = PasswordFieldValidator.validate('');
    //initialise result
    var result = 'Password must contain a special character, like &,#,%.';
    //The expected value when password doesn't have special characters
    expect(result, 'Password must contain a special character, like &,#,%.');
  });

  test('empty password', () {
    //Validate password input
    var res = PasswordFieldValidator.validate('');
    //initialise result
    var result = 'Password cannot be empty';
    //The expected value when password is empty
    expect(result, 'Password cannot be empty');
  });

  test('Passwords doesnt match', () {
    var result = ConfirmPasswordFieldValidator.validate('');
    expect(result, 'Passwords doesn\'t match');
  });
}
