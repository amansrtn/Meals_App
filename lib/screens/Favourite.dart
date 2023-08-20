// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../Viewer/recipeshower.dart';
import '../module/mealsType.dart';
import 'StartingPage.dart';

class Favourite extends StatefulWidget {
  const Favourite(
      {super.key, required this.addfav_meal, required this.favourite_meal});

  final void Function(Meal meal) addfav_meal;
  final List<Meal> favourite_meal;

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    void indexnav(int index) {
      if (index == 1) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => (Favourite(
                      addfav_meal: widget.addfav_meal,
                      favourite_meal: widget.favourite_meal,
                    ))));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => (StartingPage(
                      favourite_meal: widget.favourite_meal,
                    ))));
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourites",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          for (final meal in widget.favourite_meal)
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeShower(
                              meal: meal,
                              addfav_meal: widget.addfav_meal,
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
