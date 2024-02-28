import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/MainPage': (context) => const MainPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
            DetailWidget(
              data: {
                'image':
                    'https://staticmapmaker.com/img/google-placeholder.png',
              },
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

class DetailWidget extends StatelessWidget {
  final Map<String, String> data;

  const DetailWidget({Key? key, required this.data}) : super(key: key);

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
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 4), // Yellow frame
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Adjust this value as needed
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 1.2,
                  color: Colors.white, // Add white color behind the image
                  child: Image.network(
                    data['image']!,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
                'https://static.thenounproject.com/png/4411488-200.png',
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
