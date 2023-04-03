import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/src/core/constants/app_text_theme.dart';
import 'package:portfolio/src/core/portfolio_assets/portfolio_assets.dart';
import '../../../core/constants/app_colors.dart';

class CircularGraphItemWidget extends StatefulWidget {
  const CircularGraphItemWidget({Key? key}) : super(key: key);

  @override
  State<CircularGraphItemWidget> createState() =>
      _CircularGraphItemWidgetState();
}

class _CircularGraphItemWidgetState extends State<CircularGraphItemWidget> {
  List<Color> colors = [
    AppColors.lightBlueColor,
    AppColors.violetColor,
    AppColors.primaryColor,
    AppColors.lightRedColor
  ];

  List<String> texts = ["Flutter", "Dart", "Figma", "Digital Marketing"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircularPercentIndicator(
            animationDuration: 2500,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            radius: 120.0,
            lineWidth: 12.0,
            percent: .8,
            backgroundColor: Colors.grey.shade200,
            progressColor: AppColors.lightRedColor,
            center: CircularPercentIndicator(
              animationDuration: 2500,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              radius: 108.0,
              lineWidth: 12.0,
              percent: .4,
              progressColor: AppColors.primaryColor,
              backgroundColor: Colors.grey.shade200,
              center: CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                animationDuration: 2500,
                animation: true,
                radius: 96.0,
                lineWidth: 12.0,
                percent: .7,
                backgroundColor: Colors.grey.shade200,
                progressColor: AppColors.violetColor,
                center: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  animationDuration: 2500,
                  animation: true,
                  radius: 84.0,
                  lineWidth: 12.0,
                  percent: .9,
                  backgroundColor: Colors.grey.shade200,
                  progressColor: AppColors.lightBlueColor,
                  center: const CircleAvatar(
                    radius: 72,
                    backgroundImage: AssetImage(PortFolioAssets.profileImage),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: colors.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 36,
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      decoration: BoxDecoration(color: colors[index]),
                      height: 20,
                      width: 20),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    texts[index],
                    style: AppTextTheme.regularStyle,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
