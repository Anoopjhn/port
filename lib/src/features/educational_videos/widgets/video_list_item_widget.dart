import 'package:flutter/material.dart';
import 'package:portfolio/src/core/portfolio_assets/portfolio_assets.dart';
import 'package:portfolio/src/features/educational_videos/data/models/video_model.dart';
import 'package:portfolio/src/features/educational_videos/pages/educational_video_details_ui.dart';
import '../../../core/constants/app_text_theme.dart';
import '../../../core/widgets/common_square_image_widget.dart';
import '../../../core/widgets/common_utilis.dart';

class VideoListItemWidget extends StatelessWidget {
  const VideoListItemWidget({Key? key, required this.videoModel})
      : super(key: key);
  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,


          MaterialPageRoute(
              builder: (context) =>
                  EducationalVideoDetailsUI(videoModel: videoModel))),
      child: Container(
        height: height(context, 0.3),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonSquareImageWidget(
              height: height(context, 0.20),
              networkImageUrl: videoModel.thumbnailImage ?? "",
              assetImageUrl: PortFolioAssets.dummyImage,
              isCustomBorderRadius: true,
              customBorderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
              width: width(context, 1),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      videoModel.title ?? "",
                      style: AppTextTheme.regularLargeStyle
                          .copyWith(fontWeight: FontWeight.w500),
                      maxLines: 2,
                    ),
                    Text(
                      videoModel.publishDate ?? "",
                      style: AppTextTheme.lightStyle,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
