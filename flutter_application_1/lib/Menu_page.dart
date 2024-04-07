import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Category_page.dart';
import 'Map_page.dart';
import 'Favorite_page.dart';
import 'SettingPage.dart';
import 'Menu_Page(dropdown).dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMenuPage(),
    );
  }
}

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const TitleWidget(),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const MenuPage(), // Display MenuPage as body
      bottomNavigationBar:
          const BottomBar(), // Use the custom bottom navigation bar
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Coach',
            style: TextStyle(color: Colors.yellow, fontSize: 40),
          ),
          TextSpan(
            text: 'Cook',
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ],
      ),
    );
  }
}

class Recipe {
  final String name;
  final String image;
  final String totalTime;

  Recipe({
    required this.name,
    required this.image,
    required this.totalTime,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] as String,
      image: json['images'][0]['hostedLargeUrl'] as String,
      totalTime: json['totalTime'] as String,
    );
  }
}

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    final response = await http.get(
      Uri.parse(
          'https://yummly2.p.rapidapi.com/feeds/list?limit=18&start=0&tag=list.recipe.popular'),
      headers: {
        "x-rapidapi-key": "4230bd5be4msh11946063cbd6fbcp154bb2jsn0ccd82a3a379",
        "x-rapidapi-host": "yummly2.p.rapidapi.com",
        "useQueryString": "true"
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['feed'];
      return data
          .map(
              (recipeJson) => Recipe.fromJson(recipeJson['content']['details']))
          .toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String totalTime;

  RecipeCard({
    required this.title,
    required this.imageUrl,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total Time: $totalTime',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late List<Recipe> _recipes;
  late List<Recipe> _filteredRecipes;
  bool _isLoading = true;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _recipes = [];
    _filteredRecipes = [];
    getRecipes();
  }

  Future<void> getRecipes() async {
    try {
      final recipes = await RecipeApi.getRecipe();
      setState(() {
        _recipes = recipes;
        _filteredRecipes = recipes;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching recipes: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterRecipes(String searchTerm) {
    setState(() {
      _filteredRecipes = _recipes
          .where((recipe) =>
              recipe.name.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterRecipes,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement ingredient selection logic here
                  print('Select Category');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                child: const Text(
                  'Select Category',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Display 2 columns
                    mainAxisSpacing: 10.0, // Spacing between rows
                    crossAxisSpacing: 10.0, // Spacing between columns
                  ),
                  itemCount: _filteredRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = _filteredRecipes[index];
                    return RecipeCard(
                      title: recipe.name,
                      imageUrl: recipe.image,
                      totalTime: recipe.totalTime,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SizedBox(
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
                    '/hone.png',
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
                  icon: Image.network(
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
