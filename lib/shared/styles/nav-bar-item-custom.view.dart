import 'package:flutter/material.dart';

class NavBarItemCustom extends StatefulWidget {
  final IconData icon;
  final Function touched;
  final bool active;
  final String name;
  const NavBarItemCustom({
    super.key,
    required this.icon,
    required this.touched,
    required this.active,
    this.name = '-',
  });
  @override
  State<NavBarItemCustom> createState() => _NavBarItemCustomState();
}

class _NavBarItemCustomState extends State<NavBarItemCustom> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.touched();
        },
        splashColor: Colors.white,
        hoverColor: Colors.white12,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            children: [
              SizedBox(
                height: 60.0,
                width: 120.0,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 475),
                      height: 35.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color:
                            widget.active ? Colors.white : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      widget.icon,
                      color:
                          widget.active ? Colors.grey : const Color(0xff328a3b),
                      size: 19.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.name)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
