import 'package:flutter/material.dart';
import 'Category_page.dart';
import 'Favorite_page.dart';
import 'Map_page.dart';
import 'Menu_page.dart';
import 'SettingPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Potato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CoachCook Category Layout'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
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
                  'Potato',
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
                    'Main Course',
                    'Appetizer',
                    'Salad',
                    'Soup',
                    'Dessert',
                    'Beverage',
                    'Breakfast',
                    'Lunch'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                  hint: const Text('Select Category'),
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
            children: const <Widget>[
              ProductBox(
                name: "Patatas Bravas",
                description: "Estimate Time: 1 hours",
                detail: "See More>>",
                image: "https://hips.hearstapps.com/hmg-prod/images/delish-202211-patatasbravas-109-1669137072.jpg?crop=0.835xw:1.00xh;0.0714xw,0&resize=980:*",
              ),
              ProductBox(
                name: "Classic Potato Salad",
                description: "Estimate Time: 25 minutes",
                detail: "See More>>",
                image: "https://hips.hearstapps.com/hmg-prod/images/classic-potato-salad-secondary-6425b6f83589a.jpg?crop=0.669xw:1.00xh;0.0780xw,0&resize=980:*",
              ),
              ProductBox(
                name: "Whipped Feta Roasted Potatoes",
                description: "Estimate Time: 40 minutes",
                detail: "See More>>",
                image: "https://hips.hearstapps.com/hmg-prod/images/whipped-feta-roasted-potatoes-vertical-1677517959.jpg?crop=0.805xw:0.805xh;0.0842xw,0.105xh&resize=980:*",
              ),
              ProductBox(
                name: "Perfect Mashed Potatoes",
                description: "Estimate Time: 30 minutes",
                detail: "See More>>",
                image: "https://hips.hearstapps.com/hmg-prod/images/delish-mashed-potatoes-018-1541717344.jpg?crop=0.825xw:0.826xh;0.0842xw,0.0849xh&resize=980:*",
              ),
              ProductBox(
                name: "Melting Potatoes",
                description: "Estimate Time: 50 minutes",
                detail: "See More>>",
                image: "https://hips.hearstapps.com/hmg-prod/images/melting-potatoes-vertical-2-1676485815.jpg?crop=0.835xw:1.00xh;0.0867xw,0&resize=980:*",
              ),
              ProductBox(
                name: "Chili Oil Smashed Potatoes",
                description: "Estimate Time: 1 hours",
                detail: "See More>>",
                image: "https://hips.hearstapps.com/hmg-prod/images/chilioilsmashedpotatoes-3-1654723498.jpeg?crop=0.835xw:1.00xh;0.0748xw,0&resize=980:*",
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
    super.key,
    required this.name,
    required this.description,
    required this.detail,
    required this.image,
  });

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
  const ResultsPage({super.key, required this.searchQuery});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
