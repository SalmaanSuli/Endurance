import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:endurance_fitness/update_task_widget.dart';

void main() {
  testWidgets('Updating task', (WidgetTester tester) async {
    //await tester.pumpWidget(const UpdateTaskNewWidget());

    //expect(find.text('Update Task'), findsOneWidget);
  });

  testWidgets('Deleting task', (WidgetTester tester) async {
    //await tester.pumpWidget(const UpdateTaskNewWidget());
  });

  testWidgets('Adding tasks', (WidgetTester tester) async {
    //await tester.pumpWidget(const UpdateTaskNewWidget());
  });

  test('Enter task name', () {
    var result = TaskNameFieldValidator.validate('');
    expect(result, 'Please fill in all fields');
  });

  test('fill in details', () {
    var result = DetailsFieldValidator.validate('');
    expect(result, 'Please fill in all fields');
  });
}
