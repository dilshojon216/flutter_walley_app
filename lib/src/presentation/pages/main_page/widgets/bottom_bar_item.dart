import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/theme/app_theme.dart';

BottomNavigationBarItem bottomBarIcon(String text, String text1) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      text,
      color: AppTheme.secondaryColor,
      width: 35,
    ),
    label: text1,
  );
}
