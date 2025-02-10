import 'package:flutter/material.dart';
import 'favorites_page.dart';
import 'songs_page.dart';
import 'about_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = SongsPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = AboutPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          // Utilisation de NavigationRail si la largeur est >= 600 pixels
          return Scaffold(
            body: Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: true,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Songs'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.info),
                        label: Text('About'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: page,
                  ),
                ),
              ],
            ),
          );
        } else {
          // Utilisation de BottomNavigationBar pour les petits écrans
          return Scaffold(
            body: Container(
              color: Theme.of(context).colorScheme.primaryContainer, // Ajout du fond
              child: page,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Songs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info),
                  label: 'About',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
