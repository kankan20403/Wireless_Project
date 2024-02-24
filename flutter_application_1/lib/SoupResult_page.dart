import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CoachCook Category Layout'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(115.0),
        child: AppBar(
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(vertical: 0.0),
            child: Column(
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
      body: ListView(
        children: [
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 10.0,
            padding: EdgeInsets.all(10.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
              ProductBox(
                name: "Potato Soup",
                description: "Estimate Time: 23 minutes",
                detail: "See More>>",
                image: "https://www.seannaskitchen.com/wp-content/uploads/2021/04/Cheesy-Potato-Soup-Hero-3.jpg",
              ),
            ],
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
                Image.network(
                  'https://cdn-icons-png.flaticon.com/256/25/25694.png', // Image URL
                  width: 50,
                  height: 50,
                ),
                Image.network(
                  'https://i.pinimg.com/originals/8b/5c/49/8b5c498ed69a64d629249d9abe4f44a6.png', // Image URL for the first icon
                  width: 50,
                  height: 50,
                ),
                Image.network(
                  'https://cdn1.iconfinder.com/data/icons/ui-roundicons/480/circle_location-512.png', // Image URL for the second icon
                  width: 50,
                  height: 50,
                ),
                Image.network(
                  'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3250939/bookmark-icon-md.png', // Image URL for the third icon
                  width: 50,
                  height: 50,
                ),
                Image.network(
                  'https://static-00.iconduck.com/assets.00/settings-icon-1964x2048-8nigtrtt.png', // Image URL for the fourth icon
                  width: 50,
                  height: 50,
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
  ProductBox({
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
      padding: EdgeInsets.all(5),
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
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(this.description),
                  SizedBox(height: 4),
                  Text(this.detail),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
