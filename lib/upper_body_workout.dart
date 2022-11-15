///
///Upper Body Workout
///This class is a helper for displaying static information in the app, and to not clutter the code with many constants
///

class UpperBodyWorkout {
  final String imagePath, name, instruction;

  UpperBodyWorkout(
      {required this.imagePath, required this.name, required this.instruction});
}

final upperBody = [
  [
    UpperBodyWorkout(
      imagePath: "assets/chest.jpg",
      name: "Bench press",
      instruction: "3 sets - 10-12 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/chest.jpg",
      name: "Dumbell press",
      instruction: "4 sets - 10-12 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/chest.jpg",
      name: "Dips",
      instruction: "2 sets - 10-12 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/back.jpg",
      name: "Pull ups",
      instruction: "2 sets - 12-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/back.jpg",
      name: "Deadlift",
      instruction: "2 sets - 12-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/back.jpg",
      name: "Lat pulldown",
      instruction: "4 sets - 12-15 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/biceps.jpg",
      name: "Biceps curl",
      instruction: "2 sets - 15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/biceps.jpg",
      name: "Hammer curl",
      instruction: "2 sets - 15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/biceps.jpg",
      name: "Barbell curl",
      instruction: "4 sets - 15 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/abs.jpg",
      name: "Plank",
      instruction: "2 sets - 45 seconds",
    ),
    UpperBodyWorkout(
      imagePath: "assets/abs.jpg",
      name: "Bicycle crunch",
      instruction: "2 sets - 30 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/abs.jpg",
      name: "Russian Twist",
      instruction: "4 sets - 30 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/shoulder.jpg",
      name: "Side lateral raise",
      instruction: "3 sets - 10-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/shoulder.jpg",
      name: "overheard press",
      instruction: "3 sets - 10-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/shoulder.jpg",
      name: "Front raise",
      instruction: "4 sets - 10-15 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/legs.jpg",
      name: "Squats",
      instruction: "3 sets - 15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/legs.jpg",
      name: "Leg press",
      instruction: "3 sets - 15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/legs.jpg",
      name: "Lunge",
      instruction: "4 sets - 15 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/chest.jpg",
      name: "Dumbbell Flyes",
      instruction: "3 sets - 15-20 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/chest.jpg",
      name: "Inclined Dumbell press",
      instruction: "4 sets - 15-20 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/chest.jpg",
      name: "Cable Crossover",
      instruction: "2 sets - 10-15 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/back.jpg",
      name: "Seated cable rows",
      instruction: "2 sets - 12-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/back.jpg",
      name: "Reverse Fly",
      instruction: "2 sets - 10-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/back.jpg",
      name: "Bent over row",
      instruction: "4 sets - 10-15 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/biceps.jpg",
      name: "Overhead cable curl",
      instruction: "2 sets - 12-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/biceps.jpg",
      name: "Drag curl",
      instruction: "2 sets - 12-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/biceps.jpg",
      name: "Ez-bar curl",
      instruction: "4 sets - 12-15 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/abs.jpg",
      name: "Leg raises",
      instruction: "3 sets - 50 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/abs.jpg",
      name: "Sit ups",
      instruction: "3 sets - 40 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/abs.jpg",
      name: "Cable crunch",
      instruction: "4 sets - 50 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/shoulder.jpg",
      name: "Cable lateral raises",
      instruction: "3 sets - 12-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/shoulder.jpg",
      name: "Fly",
      instruction: "3 sets - 12-15 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/shoulder.jpg",
      name: "Front cable raises",
      instruction: "4 sets - 12-15 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/legs.jpg",
      name: "Split squads",
      instruction: "3 sets - 20 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/legs.jpg",
      name: "Walkig lunges",
      instruction: "3 sets - 20 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "assets/legs.jpg",
      name: "Step up",
      instruction: "4 sets - 20 repitions",
    ),
  ],
];
