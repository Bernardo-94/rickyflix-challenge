/* import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickyflix_challenge/main.dart';
import 'package:rickyflix_challenge/navigation-bar/characters/characters-list-page.view.dart';
import 'package:rickyflix_challenge/navigation-bar/characters/characters-page.view.dart';
import 'package:rickyflix_challenge/navigation-bar/home/home-page.view.dart';
import 'package:rickyflix_challenge/navigation-bar/n-bar.c.view.dart';
import 'package:rickyflix_challenge/navigation-bar/navifation-bar-custom-controller.dart';
import 'package:rickyflix_challenge/shared/pages/test-page.view.dart';
import 'package:rickyflix_challenge/shared/styles/nav-bar-item-custom.view.dart';
import 'package:feather_icons/feather_icons.dart';

class NavigationBarCustom extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const NavigationBarCustom({super.key, required this.navigatorKey});

  @override
  State<NavigationBarCustom> createState() => _NavigationBarCustomState();
}

class _NavigationBarCustomState extends State<NavigationBarCustom> {
  final NavigationBarCustomController controller =
      NavigationBarCustomController();
  List<bool> selected = [true, false, false];
  late Widget navButton = const HomePage();

  void select(int n) {
    for (int i = 0; i < 3; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;

        switch (i) {
          case 0:
            navButton = const HomePage();
            break;
          case 1:
            navButton = const TestPage();
            break;
          case 2:
            navButton = CharactersPage(navigatorKey: widget.navigatorKey);
            break;
          default:
            navButton = const TestPage();
            break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(
        child: NbarC(),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: 90.0,
                    color: const Color(0xff74c92a),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'RikyFlix',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.kanit(
                                textStyle: const TextStyle(
                                  fontSize: 22,
                                  color: Color(0xff328a3b),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: _buildNavButtons(context),
                        ),
                      ],
                    ),
                  ),
                  _buildBody(context, navButton),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButtons(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.9,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          NavBarItemCustom(
            icon: FeatherIcons.home,
            active: selected[0],
            touched: () {
              setState(() {
                select(0);
              });
            },
          ),
          NavBarItemCustom(
            icon: FeatherIcons.shield,
            active: selected[1],
            touched: () {
              setState(() {
                select(1);
              });
            },
          ),
          NavBarItemCustom(
            icon: FeatherIcons.users,
            active: selected[2],
            touched: () {
              setState(() {
                select(2);
              });
            },
          ),
          SizedBox(
            height: size.height * 0.6,
          ),
          _logutButton(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, Widget navButton) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.95,
      height: size.height,
      child: navButton,
    );
  }

  Widget _logutButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _showLogoutDialog(context);
        },
        child: const SizedBox(
          height: 60.0,
          width: 80.0,
          child: Icon(
            FeatherIcons.logOut,
            color: Colors.white54,
            size: 19.0,
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sair'),
          content: const Text('Deseja realmente sair?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.logoutUser();
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
 */