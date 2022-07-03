import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/routes/main_route.dart';
import '../../../config/theme/app_theme.dart';
import 'widgets/background_image.dart';
import 'widgets/gradient_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 3000),
      () => Navigator.popAndPushNamed(
        context,
        MainNavigationRouteNames.mainScreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: Stack(
          children: [
            backgroundImage(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome  to",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.secondaryColor),
                  ),
                  const SizedBox(height: 10),
                  GradientText(
                    'Walley ',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                    gradient: const LinearGradient(colors: [
                      AppTheme.grandelTopColor,
                      AppTheme.grandelBottomColor,
                    ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GradientText(
                  "Find Wallpapers of your choice",
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w500),
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.grandelTopColor,
                      AppTheme.grandelBottomColor,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
