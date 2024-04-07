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
      title: 'Result',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResultPage(),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

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
              'https://hot-thai-kitchen.com/wp-content/uploads/2022/10/pad-gaprao-beef-sq-2.jpg',
              name: 'Pad Kra Pao',
              ingredients: '100 g pork\n'
                  '1 cup holy basil leaves\n'
                  '3 garlic cloves, peeled\n'
                  '3 red chilies\n'
                  '1 tablespoon Oyster Sauce\n'
                  '1 tablespoon Fish Sauce\n'
                  '½ tablespoon sugar\n'
                  '1 tablespoon water\n'
                  '2 tablespoons oil for frying',
              method: '1. Mix water, sugar, fish sauce, and oyster sauce together and set aside. \n'
                  '2. If you have a mortar and pestle, pound garlic and chilies together. Otherwise you can chop them or slice thinly. \n'
                  '3. Heat a non-stick saucepan over high heat and add the oil. When the oil is hot, add chilies and garlic and stir-fry till fragrant, about 10 seconds. \n'
                  '4. Add pork and stir continuously for few minutes. When it is starting to look like cooked, add sauce mix and stir-fry till the sauce coats the meat evenly. If it is too dry, you can add a small splash of water. \n'
                  '5. Add basil leaves and stir-fry for few more seconds until wilted, then turn off the heat immediately. \n'
                  '6. Serve Pad Kra Pao over rice, topped with a Thai-style crispy fried egg. \n'
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
