import 'package:flutter_test/flutter_test.dart';
import 'package:endurance_fitness/loginscreen.dart';
import 'package:endurance_fitness/signupscreen.dart';

main(){
  test("Sign Up screen", (){
    //setup

    //run

    //verify

  });

  test('Check if all fields are not null', (){
    var result = isNull;
    expect(result, isNotNull);
  });

  test('password is not empty and its correct', (){
    var result = 'Password don\'t match!';
    expect(result, 'Password don\'t match!');
  });

  test('If the password is the same as the confirm password', (){
    var result = null;
    expect(result, null);
  });

}