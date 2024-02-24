import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoryPage(title: 'CoachCook Category Layout'),
    );
  }
}

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(vertical: 40.0),
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
                // Add space here
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Table(
            border: TableBorder.all(),
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: CategoryBox(
                      image: 'https://www.foodandwine.com/thmb/20Fp26wbzSMgOtCdCZy0vpIK8Mo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/garlic-butter-prime-rib-FT-RECIPE0621-fca73e5fa8e046b0b03982757db51628.jpg',
                      text: 'Main Course',
                    ),
                  ),
                  TableCell(
                    child: CategoryBox(
                      image: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Marinated-Cheese_EXPS_THCA18_41873_B01_23_3b-5.jpg',
                      text: 'Appetizer',
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: CategoryBox(
                      image: 'https://www.foodandwine.com/thmb/q9tccMZgV9aifYtmlvh9qcPmb_8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Greek-Salad-Romaine-FT-RECIPE1222-8a49c63ede714dfb8fdc0c35088fcd18.jpg',
                      text: 'Salad',
                    ),
                  ),
                  TableCell(
                    child: CategoryBox(
                      image: 'https://www.inspiredtaste.net/wp-content/uploads/2023/08/Creamy-Chicken-Noodle-Soup-Recipe-Video.jpg',
                      text: 'Soup',
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: CategoryBox(
                      image: 'https://www.foodandwine.com/thmb/ckc6L6xKox0WfpfO6dMkuVGPQOY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Angel-Food-Cake-with-Three-Berry-Compote-FT-RECIPE0323-541a780b871441e0ab14383ee38acc44.jpg',
                      text: 'Dessert',
                    ),
                  ),
                  TableCell(
                    child: CategoryBox(
                      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBC69MdMGh5GTOrgSt8MGavi6G_HZtZNS_3BLbpCxxNUGsJp1Z9951s9QHDBu9rEd8D-0&usqp=CAU',
                      text: 'Beverage',
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: CategoryBox(
                      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVDyE-niK51KE8qs1CAbbMEOYNlfW4QuW1Ku3q9ThuoQ&s',
                      text: 'Breakfast',
                    ),
                  ),
                  TableCell(
                    child: CategoryBox(
                      image: 'https://simply-delicious-food.com/wp-content/uploads/2018/07/mexican-lunch-bowls-3.jpg',
                      text: 'Lunch',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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

class CategoryBox extends StatelessWidget {
  final String image;
  final String text;

  const CategoryBox({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), // Adjust the opacity to control darkness
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
