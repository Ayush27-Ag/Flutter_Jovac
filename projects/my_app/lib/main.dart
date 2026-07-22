import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodListScreen(),
    );
  }
}

class FoodListScreen extends StatelessWidget {
  FoodListScreen({super.key});

  final List<Map<String, String>> foodList = [
    {
      "name": "French Fries",
      "price": "₹99",
      "image": "assets/images/frenchfries.jpg",
    },
    {
      "name": "Chocolate Cake",
      "price": "₹179",
      "image": "assets/images/chocolate cake.jpeg",
    },
    {"name": "Pasta", "price": "₹159", "image": "assets/images/pasta.jpeg"},
    {"name": "Burger", "price": "₹149", "image": "assets/images/burger.jpg"},
    {
      "name": "Cold Coffee",
      "price": "₹89",
      "image": "assets/images/cold coffee.jpeg",
    },
    {"name": "Pizza", "price": "₹249", "image": "assets/images/pizza.jpeg"},
    {
      "name": "Ice Cream",
      "price": "₹69",
      "image": "assets/images/icecream.jpeg",
    },
    {
      "name": "Sandwich",
      "price": "₹119",
      "image": "assets/images/sandwich.jpg",
    },
    {
      "name": "Cold Drink",
      "price": "₹49",
      "image": "assets/images/colddrink.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Example"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  foodList[index]["image"]!,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                foodList[index]["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(foodList[index]["price"]!),
              trailing: const Icon(Icons.shopping_cart, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
