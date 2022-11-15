///
///Diet (Men) Records
///This class is a helper for displaying static information in the app, and to not clutter the code with many constants
///

class UpperBodyWorkout {
  final String imagePath, name, instruction;

  UpperBodyWorkout(
      {required this.imagePath, required this.name, required this.instruction});
}

final MenDietRec = [
  [
    UpperBodyWorkout(
      imagePath: "assets/veggies.jpg",
      name: "Cale",
      instruction:
          "Packed With 45% protein, Vitamins, Minerals and Bioactive Compounds",
    ),
    UpperBodyWorkout(
      imagePath: "assets/veggies.jpg",
      name: "Mushrooms",
      instruction:
          "Contains Many Nutrients and has 38% protein. The nutrition profile of cauliflower is quite impressive",
    ),
    UpperBodyWorkout(
      imagePath: "assets/veggies.jpg",
      name: "Spinach",
      instruction: "Provide protein, iron, vitamins, and minerals",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/fruit.jpg",
      name: "Mango",
      instruction:
          "connected to lower blood pressure and a regular pulse,  reduce inflammation of the heart.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/fruit.jpg",
      name: "Avocado",
      instruction:
          "Avocados are the best fruits for muscle gain as they are loaded with potassium and are nutritionally dense with vitamins and minerals.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/fruit.jpg",
      name: "Bananas",
      instruction:
          "Bananas are rich in nutrients like carbs and potassium, both of which are important for exercise performance and muscle growth.",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/protein.jpg",
      name: "Lean Beef",
      instruction:
          "It improve muscle growth and maintenance, as well as exercise performance.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/protein.jpg",
      name: "Eggs",
      instruction:
          "eggs stimulate muscle growth and repair even more than just eating egg whites alone.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/protein.jpg",
      name: "Skinless Chicken",
      instruction:
          "The lean protein in chicken is an excellent source of amino acids.",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/drinks.jpg",
      name: "Low fat milk",
      instruction:
          "It is good sources of potassium, which can lower your blood pressure",
    ),
    UpperBodyWorkout(
      imagePath: "assets/drinks.jpg",
      name: "Water",
      instruction:
          "Water help to maintain your concentration and performance, increase your endurance, and prevent excessive elevations in heart rate and body temperature.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/drinks.jpg",
      name: "Chia Pudding",
      instruction:
          "They are high in protein and contain ALA, a plant-based form of omega 3 essential fatty acids.",
    ),
  ],
];
