/*
import 'package:flutter_test/flutter_test.dart';
import 'package:endurance_fitness/create_task_new_widget.dart';

main() {
  test("Login screen", () {
    //setup

    //run

    //verify
  });

  test('Task name field empty', () {
    var result = TaskNameFieldValidator.validate('');
    expect(result, 'Please fill in all fields');
  });

  test('Detail field empty', () {
    var result = DetailsFieldValidator.validate('');
    expect(result, 'Please fill in all fields');
  });
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:endurance_fitness/create_task_new_widget.dart';

void main(){
  
  test("Login screen", (){
    //setup

    //run

    //verify

  });

  test('Task name field empty', (){
    var result = TaskNameFieldValidator.validate('');
    expect(result, 'Please fill in all fields');
  });

  test('Detail field empty', (){
    var result = DetailsFieldValidator.validate('');
    expect(result, 'Please fill in all fields');
  });
/*
  testWidgets('Create new task', (WidgetTester tester) async{
    await tester.pumpWidget(const CreateTaskNewWidget());

    expect(find.text('Showing results for all goals'), findsOneWidget);

  }); */
  

}


