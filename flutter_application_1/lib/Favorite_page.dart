import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Favorite'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  TextEditingController _searchController = TextEditingController();

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
                  'Favorite',
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
                name: "Tom Yum Kung",
                description: "Estimate Time: 15 minutes",
                Detail: "See More>>",
                image: "https://asianinspirations.com.au/wp-content/uploads/2018/07/R00067_Tom-Yum-Goong-589x412.jpg",
              ),
              ProductBox(
                name: "Tom Kha Kai ",
                description: "Estimate Time: 17 minutes",
                Detail: "See More>>",
                image: "https://hot-thai-kitchen.com/wp-content/uploads/2014/06/Tom-kha-gai-new-sq.jpg",
              ),
              ProductBox(
                name: "Hamberger",
                description: "Estimate Time: 10 minutes",
                Detail: "See More>>",
                image: "https://www.recettesetcabas.com/data/recettes/2379-1-fiche@64E36067-hamburger-a-la-tomme-de-savoie-bacon-et-salade.webp",
              ),
              ProductBox(
                name: "Suhsi Roll",
                description:
                    "Estimate Time: 25 minutes",
                Detail: "See More>>",
                image: "https://www.happyfoodstube.com/wp-content/uploads/2016/03/homemade-sushi-image-500x500.jpg",
              ),
              ProductBox(
                name: "French Fried",
                description: "Estimate Time: 15 minutes",
                Detail: "See More>>",
                image: "https://www.recipetineats.com/wp-content/uploads/2022/09/Fries-with-rosemary-salt_1.jpg",
              ),
              ProductBox(
                name: "Pad Kra Pao",
                description:
                    "Estimate Time: 23 minutes",
                Detail: "See More>>",
                image: "https://www.foodandwine.com/thmb/Z5FeE6c1mJfx6A6x1FBWSfzzo80=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Pad-Krapow-1-FT-RECIPE0423-212e69119f6d4d2589117ead80cccc4d.jpg",
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
    required this.Detail,
    required this.image,
  }) : super(key: key);

  final String name;
  final String description;
  final String Detail;
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
                  Text(this.Detail),
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
  ResultsPage({required this.searchQuery});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Center(
        child: Text('Displaying results for: $searchQuery'),
      ),
    );
  }
}