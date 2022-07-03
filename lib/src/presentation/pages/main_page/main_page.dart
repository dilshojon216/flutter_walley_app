import 'package:flutter/material.dart';
import 'package:flutter_walley_app/src/config/theme/app_theme.dart';
import 'package:flutter_walley_app/src/presentation/pages/collocation_page/collocation_page.dart';
import 'package:flutter_walley_app/src/presentation/pages/home_page/home_page.dart';
import 'package:flutter_walley_app/src/presentation/pages/save_page/save_page.dart';

import 'widgets/bottom_bar_item.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: _currentIndex == 0
          ? HomePage()
          : _currentIndex == 1
              ? CollocationPage()
              : const SaveAllPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF000000),
        items: [
          bottomBarIcon("assets/icons/icon_home.svg", ""),
          bottomBarIcon("assets/icons/colloction_icon.svg", ""),
          bottomBarIcon("assets/icons/save_icon.svg", ""),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
