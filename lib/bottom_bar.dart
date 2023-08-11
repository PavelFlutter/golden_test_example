import 'package:flutter/material.dart';


class BottomNavigation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    final colorsTheme = Theme.of(context).colorScheme;
    int tab_index = 0;


    return BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (value) {
        switch (value) {
          case 0:
            tab_index = value;
            break;
          case 1:
            tab_index = value;
            break;
          case 2:
            tab_index = value;
            break;
          case 3:
            tab_index = value;
            break;
          default:
        }
      },
      currentIndex: tab_index,
      unselectedItemColor: colorsTheme.primary.withOpacity(0.5),
      selectedItemColor: colorsTheme.primary,
      unselectedLabelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Icon(Icons.mic_rounded),
          ),
          label: 'nb_news',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Icon(Icons.percent),
          ),
          label: 'nb_promo',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Icon(Icons.credit_card),
          ),
          label: 'nb_card',
        ),
        BottomNavigationBarItem(
          icon: Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Icon(Icons.map)),
          label: 'nb_map',
        ),
        BottomNavigationBarItem(
          icon: Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Icon(Icons.view_list)),
          label: 'nb_catalog',
        ),
        BottomNavigationBarItem(
          icon: Container(
              margin: EdgeInsets.only(bottom: 7),
              child: Icon(Icons.person)),
          label: 'nb_profile',
        ),
      ],
    );


  }
}
