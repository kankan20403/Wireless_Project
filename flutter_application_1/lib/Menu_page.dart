import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Search Page'),
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
                    decoration: InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  items: <String>[
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
                  hint: Text('Select Ingredients'),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black),
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
                  padding: EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    ProductBox(
                      name: "Tom Yum Kung",
                      description: "Estimate Time: 15 minutes",
                      Detail: "See More>>",
                      image: "https://d3h1lg3ksw6i6b.cloudfront.net/media/image/2023/04/24/5608757681874e1ea5df1aa41d5b2e3d_How_To_Make_Tom_Yam_Kung_The_Epitome_Of_Delicious_And_Nutritious_Thai_Cuisine3.jpg",
                    ),
                    ProductBox(
                      name: "Kaeng Khiao Wan",                      description: "Estimate Time: 17 minutes",
                      Detail: "See More>>",
                      image: "https://i.guim.co.uk/img/media/2f18f5a49694c482c1476bc51949e38a07b1c097/86_1686_4662_4662/master/4662.jpg?width=700&quality=85&auto=format&fit=max&s=0410e79f847cf5d3ddfebc5604cdd2f2",
                    ),
                    ProductBox(
                      name: "Yam Nua",
                      description: "Estimate Time: 10 minutes",
                      Detail: "See More>>",
                      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyiDay_1xYbI77ug2fxiCGzX4dceQz23HtsvszmUvXQ&",                    ),
                    ProductBox(
                      name: "Lemon Tiramisu",
                      description: "Estimate Time: 45 minutes",
                      Detail: "See More>>",
                      image: "https://www.allrecipes.com/thmb/F0WKVaHvq_jb01FeuaebxQQAk68=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8416444-Lemon-Tiramisu-2101-4x3-fcbe2aaa0a1e4c7db4fcc68ca1be042c.jpg",
                    ),
                    ProductBox(
                      name: "Peanut Butter Banana Smoothie",
                      description: "Estimate Time: 5 minutes",
                      Detail: "See More>>",
                      image: "https://www.allrecipes.com/thmb/4rP9U1N8yhd3lXCmF0XmBZi5I1A=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/221261-Peanut-Butter-Banana-Smoothie-DDMFS-4x3-79533eeb04c84b42aae440d643fc9a31.jpg",
                    ),
                    ProductBox(
                      name: "Pad Kra Pao",
                      description: "Estimate Time: 23 minutes",
                      Detail: "See More>>",
                      image: "https://www.foodandwine.com/thmb/Z5FeE6c1mJfx6A6x1FBWSfzzo80=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Pad-Krapow-1-FT-RECIPE0423-212e69119f6d4d2589117ead80cccc4d.jpg",
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
