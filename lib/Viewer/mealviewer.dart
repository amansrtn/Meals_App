// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meals_app/Viewer/recipeshower.dart';
import 'package:meals_app/data/categorydata.dart';
import 'package:meals_app/module/foodCategory.dart';
import 'package:transparent_image/transparent_image.dart';
import '../module/mealsType.dart';

class MealViewer extends StatelessWidget {
  const MealViewer(
      {super.key, required this.category, required this.addfav_meal});
  final Category category;
  final void Function(Meal meal) addfav_meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            category.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            for (final meal in dummyMeals)
              if (meal.categories.contains(category.id))
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeShower(
                                  meal: meal,
                                  addfav_meal: addfav_meal,
                                )));
                  },
                  splashColor: Colors.white,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.black,
                    elevation: 2,
                    child: Column(
                      children: [
                        FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(meal.imageUrl),
                          fit: BoxFit.cover,
                          height: 230,
                          width: double.infinity,
                        ),
                        Text(
                          meal.title,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.watch_later_outlined),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${meal.duration} min",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
          ],
        ));
  }
}
