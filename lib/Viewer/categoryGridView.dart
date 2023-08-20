// ignore_for_file: file_names, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meals_app/Viewer/mealviewer.dart';
import '../module/foodCategory.dart';
import '../module/mealsType.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView(
      {super.key, required this.category, required this.addfav_meal});
  final Category category;
  final void Function(Meal meal) addfav_meal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealViewer(
                      category: category,
                      addfav_meal: addfav_meal,
                    )));
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                category.color.withOpacity(1),
                category.color.withOpacity(0.8)
              ],
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          category.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white),
        ),
      ),
    );
  }
}
