import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:sexel/src/pages/bot_page.dart';
import 'package:sexel/src/pages/course_page.dart';
import 'package:sexel/src/providers/ui_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    final uiState = Provider.of<UiProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sexel'),
        toolbarHeight: h * 0.1,
      ),
      bottomNavigationBar: GNav(
        onTabChange: (i) {
          setState(() {
            uiState.selectedMenuOpt = i;
          });
        },
        selectedIndex: uiState.selectedMenuOpt,
        textStyle: Theme.of(context).primaryTextTheme.button,
        rippleColor:
            Colors.red.shade200, // tab button ripple color when pressed
        hoverColor: Colors.red.shade300, // tab button hover color
        haptic: true, // haptic feedback
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(
            color: Colors.red.shade300, width: 1), // tab button border
        tabBorder:
            Border.all(color: Colors.grey, width: 1), // tab button border
        curve: Curves.easeOutExpo, // tab animation curves
        duration: Duration(milliseconds: 900), // tab animation duration
        gap: 8, // the tab button gap between icon and text
        color: Colors.red.shade200, // unselected icon color
        activeColor: Colors.white, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor:
            Colors.red.shade200, // selected tab background color
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 5), // navigation bar padding
        tabs: [
          GButton(
            icon: Icons.android,
            text: 'Xelbot',
          ),
          GButton(
            icon: Icons.book,
            text: 'Aprende',
          ),
          GButton(
            icon: Icons.question_answer,
            text: 'Comunidad',
          ),
          GButton(
            icon: Icons.bookmark,
            text: 'Guardado',
          )
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final uiState = Provider.of<UiProvider>(context);

    switch (uiState.selectedMenuOpt) {
      case 0:
        return BotPage();
        break;
      case 1:
        return CoursePage();
        break;
      case 2:
        return CoursePage();
        break;
      case 3:
        return CoursePage();
        break;
      default:
        return Container();
    }
  }
}
