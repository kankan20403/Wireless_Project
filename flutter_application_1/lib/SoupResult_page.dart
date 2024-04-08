import 'package:flutter/material.dart';
import 'Menu_page.dart';
import 'PotatoSoup_page.dart';
import 'Category_page.dart';
import 'Map_page.dart';
import 'Favorite_page.dart';
import 'SettingPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SoupPage(title: 'CoachCook Soup'),
    );
  }
}

class SoupPage extends StatelessWidget {
  SoupPage({Key? key, required this.title}) : super(key: key);
  final String title;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115.0),
        child: AppBar(
          flexibleSpace: Container(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Coach',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFDE59),
                      ),
                    ),
                    Text(
                      'Cook',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.0), // Added space here
                Text(
                  'Soup',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  items: <String>[
                    'Potato',
                    'Pork',
                    'Chicken',
                    'Salmon',
                    'Chilli',
                    'Tomato',
                    'Lemon',
                    'Basil',
                    'Shrimp'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                  hint: const Text('Select Ingredient'),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {
                    String searchQuery = _searchController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(searchQuery: searchQuery),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 10.0,
                  padding: const EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    ProductBox(
                      name: "Tomato Soup",
                      description: "Estimate Time: 15 minutes",
                      detail: "See More>>",
                      image: "https://www.acouplecooks.com/wp-content/uploads/2021/09/Tomato-Soup-002s.jpg",
                    ),
                    ProductBox(
                      name: "Mushroom Soup",
                      description: "Estimate Time: 17 minutes",
                      detail: "See More>>",
                      image: "https://rainbowplantlife.com/wp-content/uploads/2022/11/Mushroom-soup-cover-image-1-of-1.jpg",
                    ),
                    ProductBox(
                      name: "Chicken Soup",
                      description: "Estimate Time: 10 minutes",
                      detail: "See More>>",
                      image: "https://food-images.files.bbci.co.uk/food/recipes/chickensoup_1918_16x9.jpg",
                    ),
                    ProductBox(
                      name: "Corn Soup",
                      description: "Estimate Time: 25 minutes",
                      detail: "See More>>",
                      image: "https://assets.unileversolutions.com/recipes-v2/175495.jpg",
                    ),
                    ProductBox(
                      name: "Spinach Soup",
                      description: "Estimate Time: 15 minutes",
                      detail: "See More>>",
                      image: "https://mypureplants.com/wp-content/uploads/2019/03/cream-of-spinach-soup-vegan-7.jpg",
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SoupDetailedPage())
                        );
                      },
                      child: ProductBox(
                        name: "Potato Soup",
                        description: "Estimate Time: 23 minutes",
                        detail: "See More>>",
                        image: "https://www.seannaskitchen.com/wp-content/uploads/2021/04/Cheesy-Potato-Soup-Hero-3.jpg",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100, // Adjust the height as needed
        child: Center(
          child: Container(
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenuPage()),
                    );
                  },
                  icon: Image.asset(
                    '/home.png', // Image URL
                    width: 50,
                    height: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryPage(title: 'CoachCook Category Layout')),
                    );
                  },
                  icon: Image.asset(
                    '/category.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                  icon: Image.asset(
                    '/location.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoritePage(title: 'Favorite')),
                    );
                  },
                  icon: Image.asset(
                    '/bookmark.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingPage()),
                    );
                  },
                  icon: Image.asset(
                    '/setting.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.detail,
    required this.image,
  }) : super(key: key);

  final String name;
  final String description;
  final String detail;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Card(
        color: Colors.yellow, // Set the color of the card to yellow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(description),
                  const SizedBox(height: 4),
                  Text(detail),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  final String searchQuery;
  const ResultsPage({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: Center(
        child: Text('Displaying results for: $searchQuery'),
      ),
    );
  }
}

