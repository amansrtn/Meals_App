// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meals_app/Viewer/categoryGridView.dart';

import '../data/categorydata.dart';
import '../module/mealsType.dart';
import 'Favourite.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key,required this.favourite_meal});
  final List<Meal> favourite_meal;
  @override
  
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {

    
    void addfav_meal(Meal meal) {
      if (widget.favourite_meal.contains(meal)) {
        setState(() {
          widget.favourite_meal.remove(meal);
        });
      } else {
        setState(() {
          widget.favourite_meal.add(meal);
        });
      }
    }

    void indexnav(int index) {
      if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => (Favourite(
              addfav_meal: addfav_meal,
              favourite_meal: widget.favourite_meal,
            )),
          ),
        );
        
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome Foody",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.3),
        children: [
          for (final category in availableCategories)
            CategoryGridView(
              category: category,
              addfav_meal: addfav_meal,
            )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favourites"),
        ],
        onTap: (index) {
          indexnav(index);
        },
      ),
    );
  }
}
