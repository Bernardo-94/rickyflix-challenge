/* import 'package:flutter/material.dart';
import 'package:rickyflix_challenge/navigation-bar/characters/characters-list-page.view.dart';

class CharactersPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const CharactersPage({super.key, required this.navigatorKey});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) =>
              CharactersListScreen(navigatorKey: widget.navigatorKey),
        );
      },
    );
  }
}
 */