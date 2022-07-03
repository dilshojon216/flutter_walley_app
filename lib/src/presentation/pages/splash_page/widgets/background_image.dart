import 'package:flutter/cupertino.dart';

Widget backgroundImage() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/splash_background.png'),
        fit: BoxFit.fill,
      ),
    ),
  );
}
