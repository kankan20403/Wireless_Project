import 'package:flutter/material.dart';
import 'Category_page.dart';
import 'Map_page.dart';
import 'Favorite_page.dart';
import 'Menu_page.dart';
import 'SettingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainMenuPage(),
        '/MainPage': (context) => const SoupDetailedPage(),
      },
    );
  }
}

class SoupDetailedPage extends StatelessWidget {
  const SoupDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const TitleWidget(),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const DetailWidget(
              image:
                  'https://www.seannaskitchen.com/wp-content/uploads/2021/04/Cheesy-Potato-Soup-Hero-3.jpg',
              name: 'Potato Soup',
              ingredients: '¼ cup butter \n'
              '1 large onion, chopped\n'
              '6 potatoes, peeled and dice\n'
              '2 carrots, diced\n'
              '3 cups water\n'
              '2 tablespoons chicken bouillon powder\n'
              'ground black pepper to taste\n'
              '3 tablespoons all-purpose flour\n'
              '3 cups milk\n'
              '1 tablespoon dried parsley\n'
              '1 large onion, chopped',
              method: '1. Melt butter in a saucepan over medium heat. Stir in onion; cook and stir until onion has softened and turned translucent, about 5 minutes. \n'
                  '2. While onions are cooking, place diced potatoes, carrots, water, and chicken bouillon in another pot and bring to a boil. Cook until vegetables are tender, about 10 minutes. Do not overcook. Season with ground black pepper to taste. \n'
                  '3. Add flour to cooked onions to make a paste. Cook, stirring constantly, for 2 minutes. Gradually add milk and stir well. Cook over low heat stirring constantly until warmed through. Add potato and carrot mixture. Stir in parsley and thyme and heat through. Serve hot. \n'
                  'Finished!!',
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Add functionality here
                print('Button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: const Text(
                'Favorite',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(), // Use the custom bottom navigation bar
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

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

class DetailWidget extends StatefulWidget {
  final String image;
  final String name;
  final String ingredients;
  final String method;

  const DetailWidget({super.key, 
    required this.image,
    required this.name,
    required this.ingredients,
    required this.method,
  });

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Add functionality here
              print('Image tapped');
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.yellow, // Box color
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingredients:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.ingredients,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Method:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.method,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});
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
