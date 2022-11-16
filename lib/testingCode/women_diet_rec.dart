///
///Women (Diet) Records
///This class is a helper for displaying static information in the app, and to not clutter the code with many constants
///

class UpperBodyWorkout {
  final String imagePath, name, instruction;

  UpperBodyWorkout(
      {required this.imagePath, required this.name, required this.instruction});
}

final WomenDietRec = [
  [
    UpperBodyWorkout(
      imagePath: "assets/veggies.jpg",
      name: "Broccoli",
      instruction: "Packed With Vitamins, Minerals and Bioactive Compounds",
    ),
    UpperBodyWorkout(
      imagePath: "assets/veggies.jpg",
      name: "Cauliflower",
      instruction:
          "Contains Many Nutrients. The nutrition profile of cauliflower is quite impressive",
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
      name: "Apple",
      instruction: "increase endurance during exercise.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/fruit.jpg",
      name: "Kiwi",
      instruction:
          "Has enough vitamins, minerals and potassium will be helpful for a faster recovery.",
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
      name: "Cheese",
      instruction:
          "The calcium and protein in cheese makes it great for building strong bones and muscle.  Since cheese is made from milk, it's also packed with calcium.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/protein.jpg",
      name: "Eggs",
      instruction:
          "eggs stimulate muscle growth and repair even more than just eating egg whites alone.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/protein.jpg",
      name: "Chicken",
      instruction:
          "Help to build stronger muscles and promote healthier bones, decreasing the risk of injuries and diseases such as osteoporosis.",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "assets/drinks.jpg",
      name: "Vegetable Juice",
      instruction:
          "It is important to take an oat meal before you start a dayit helps build muscle mass and gives them additional energy to maximize your workout.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/drinks.jpg",
      name: "Water",
      instruction:
          "Water help to maintain your concentration and performance, increase your endurance, and prevent excessive elevations in heart rate and body temperature.",
    ),
    UpperBodyWorkout(
      imagePath: "assets/drinks.jpg",
      name: "Fruit milkshake",
      instruction: "They accelerate your metabolism and detoxify your body",
    ),
  ],
];
