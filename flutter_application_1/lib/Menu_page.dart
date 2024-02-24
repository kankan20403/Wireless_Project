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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Coach",
              style: TextStyle(color: Colors.yellow, fontSize: 30),
            ),
            Text(
              "Cook",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ],
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
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                ProductBox(
                  name: "Tom Yam Kung",
                  description:
                      "Tom yam kung, or spicy shrimp soup, is the number one of the top ten Thai dishes loved by foreigners.",
                  image:
                      "https://hot-thai-kitchen.com/wp-content/uploads/2013/03/tom-yum-goong-blog.jpg",
                  boxColor: Colors.yellow,
                ),
                ProductBox(
                  name: "Kaeng Khiao Wan",
                  description:
                      "Ranking second among the ten Thai dishes ordered most frequently by foreigners, a green chicken curry gained an 85% popularity.",
                  image:
                      "https://i.guim.co.uk/img/media/2f18f5a49694c482c1476bc51949e38a07b1c097/86_1686_4662_4662/master/4662.jpg?width=700&quality=85&auto=format&fit=max&s=0410e79f847cf5d3ddfebc5604cdd2f2",
                  boxColor: Colors.yellow,
                ),
                ProductBox(
                  name: "Yam Nua",
                  description:
                      "Ranking seventh in the top ten list of Thai food loved by foreigners, Yam Nua or spicy beef salad is a mouth-watering dish.",
                  image:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyiDay_1xYbI77ug2fxiCGzX4dceQz23HtsvszmUvXQ&",
                  boxColor: Colors.yellow,
                ),
                ProductBox(
                  name: "Phat Kaphrao",
                  description:
                      "Ranking fourth among the ten Thai dishes ordered most frequently by foreigners, Phat Kaphrao can have any kind of meat as its main ingredient.",
                  image:
                      "https://hot-thai-kitchen.com/wp-content/uploads/2022/10/pad-gaprao-beef-sq-2.jpg",
                  boxColor: Colors.yellow,
                ),
              ],
            ),
          ),
          NavBarWidget(),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
    required this.boxColor,
  }) : super(key: key);

  final String name;
  final String description;
  final String image;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: boxColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  this.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(this.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {
                // Navigate to the first page when the first icon is tapped
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/256/25/25694.png',
                width: 50,
                height: 50,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage()));
              },
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Hand_ball_4_square.svg/600px-Hand_ball_4_square.svg.png?20140719060516',
                width: 50,
                height: 50,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LocationPage()));
              },
              child: Image.network(
                'https://cdn1.iconfinder.com/data/icons/ui-roundicons/480/circle_location-512.png',
                width: 50,
                height: 50,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage()));
              },
              child: Image.network(
                'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3250939/bookmark-icon-md.png',
                width: 50,
                height: 50,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
              },
              child: Image.network(
                'https://static-00.iconduck.com/assets.00/settings-icon-1964x2048-8nigtrtt.png',
                width: 50,
                height: 50,
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
