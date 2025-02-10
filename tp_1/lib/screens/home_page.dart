import 'package:flutter/material.dart';
import 'favorites_page.dart';
import 'songs_page.dart';
import 'about_page.dart';
import 'albums_page.dart';

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
        page = AlbumsPage();
        break;
      case 2:
        page = FavoritesPage();
        break;
      case 3:
        page = AboutPage();
        break;
      default:
        page = SongsPage();
        break;
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
                        icon: Icon(Icons.music_note),
                        label: Text('Songs'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.album),
                        label: Text('Albums'),
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
              color: Theme.of(context).colorScheme.secondaryContainer, // Ajout du fond
              child: page,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              selectedItemColor: Colors.black,  // Force les icônes sélectionnées en noir
              unselectedItemColor: Colors.grey, // Icônes non sélectionnées en gris
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.music_note),
                  label: 'Songs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.album),
                  label: 'Albums',
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
