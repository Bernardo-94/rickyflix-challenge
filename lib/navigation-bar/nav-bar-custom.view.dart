import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickyflix_challenge/navigation-bar/home/home-page.view.dart';
import 'package:rickyflix_challenge/navigation-bar/nav-bar-custom-controller.dart';
import 'package:rickyflix_challenge/shared/pages/test-page.view.dart';
import 'package:rickyflix_challenge/shared/styles/nav-bar-item-custom.view.dart';

class NavBarCustom extends StatefulWidget {
  const NavBarCustom({super.key});

  @override
  State<NavBarCustom> createState() => _NavBarCustomState();
}

class _NavBarCustomState extends State<NavBarCustom> {
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
            navButton = const TestPage();
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
    return Column(
      children: [
        Text(
          'Menu',
          textAlign: TextAlign.left,
          style: GoogleFonts.kanit(
            textStyle: const TextStyle(
              fontSize: 22,
              color: Color(0xff328a3b),
            ),
          ),
        ),
        _buildNavButtons(context)
      ],
    );
  }

  Widget _buildNavButtons(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        NavBarItemCustom(
          name: 'Home',
          icon: FeatherIcons.home,
          active: selected[0],
          touched: () {
            setState(() {
              select(0);
              Navigator.pushNamed(context, '/home');
            });
          },
        ),
        NavBarItemCustom(
          name: 'Episodes',
          icon: FeatherIcons.shield,
          active: selected[1],
          touched: () {
            setState(() {
              select(1);
              Navigator.pushNamed(context, '/episodes');
            });
          },
        ),
        NavBarItemCustom(
          name: 'Characters',
          icon: FeatherIcons.users,
          active: selected[2],
          touched: () {
            setState(() {
              select(2);
              Navigator.pushNamed(context, '/characters');
            });
          },
        ),
        SizedBox(
          height: size.height * 0.6,
        ),
        _logutButton(context),
      ],
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
            color: Colors.grey,
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
