import 'package:flutter_test/flutter_test.dart';
import 'package:endurance_fitness/signupscreen.dart';

main(){
  test("Sign Up screen", (){
    //setup

    //run

    //verify

  });

  test('empty email', (){
    var result = EmailFieldValidator.validate('');
    expect(result, 'Please fill in all fields');
  });

  test('empty name field', (){
    var result = NameFieldValidator.validate('');
    expect(result, 'Please fill in all fields');
  });

  test('short password', (){
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password must be at least 8 characters.');
  });
/*
  test('empty password', (){
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password cannot be empty');
  });

  test('password with no upper case', (){
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password must have an Uppercase letter.');
  });

  test('password with no numerical values', (){
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password must contain a digit.');
  });

  test('password with no lower cases', (){
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password must have an Lowercase letter.');
  });

  test('password with no special character', (){
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password must contain a special character, like &,#,%.');
  });

  test('empty password', (){
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password cannot be empty');
  });

  */
  test('Passwords doesnt match', (){
    var result = ConfirmPasswordFieldValidator.validate('');
    expect(result, 'Passwords doesn\'t match');
  });

}
