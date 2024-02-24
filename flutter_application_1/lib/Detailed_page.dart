import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/MainPage': (context) => MainPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TitleWidget(),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            DetailWidget(
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
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Add functionality here
                print('Button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: Text(
                'Favorite',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(), // Use the custom bottom navigation bar
    );
  }
}

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
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

  DetailWidget({
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
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
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
          SizedBox(height: 20),
          Text(
            widget.name,
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.yellow, // Box color
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  widget.ingredients,
                ),
                SizedBox(height: 10),
                Text(
                  'Method:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
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
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: Container(
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.network(
                'https://cdn-icons-png.flaticon.com/256/25/25694.png',
                width: 50,
                height: 50,
              ),
              Image.network(
                'https://i.pinimg.com/originals/8b/5c/49/8b5c498ed69a64d629249d9abe4f44a6.png',
                width: 50,
                height: 50,
              ),
              Image.network(
                'https://cdn1.iconfinder.com/data/icons/ui-roundicons/480/circle_location-512.png',
                width: 50,
                height: 50,
              ),
              Image.network(
                'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3250939/bookmark-icon-md.png',
                width: 50,
                height: 50,
              ),
              Image.network(
                'https://static-00.iconduck.com/assets.00/settings-icon-1964x2048-8nigtrtt.png',
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
