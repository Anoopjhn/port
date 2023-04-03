import 'package:flutter/material.dart';
import 'package:portfolio/src/core/constants/app_colors.dart';
import 'package:portfolio/src/core/constants/app_text_theme.dart';
import 'package:portfolio/src/core/portfolio_assets/portfolio_assets.dart';
import 'package:portfolio/src/features/home/pages/bottom_navigation_ui.dart';

class SplashUI extends StatefulWidget {
  const SplashUI({Key? key}) : super(key: key);

  @override
  State<SplashUI> createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const BottomNavigationUI())));
    super.initState();
  }


  List<dynamic> data = [
  {
  "thumbnailImage" : "https://img.youtube.com/vi/P3l9o31AoeQ/sddefault.jpg",
  "videoUrl" : "https://www.youtube.com/watch?v=P3l9o31AoeQ",
  "title" : "Best Video Player in Flutter",
  "publishDate" : "19 Aug 2022",
},
{
"thumbnailImage" : "https://img.youtube.com/vi/5vDq5DXXxss/sddefault.jpg",
"videoUrl" : "https://www.youtube.com/watch?v=5vDq5DXXxss&t=57s",
"title" : "Top 30 Flutter Tips and Tricks",
"publishDate" : "7 Jun 2021",
}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Image.asset(PortFolioAssets.splashImage, height: 250),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to",
                  style: AppTextTheme.heading1Style.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Anoop's Portfolio",
                  style: AppTextTheme.heading1Style.copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.centerRight,
              child: Image.asset(PortFolioAssets.vectorSplashImage),
            ),
          ),
        ],
      ),
    );
  }
}
