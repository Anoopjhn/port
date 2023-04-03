import 'package:flutter/material.dart';
import 'package:portfolio/src/features/educational_videos/data/models/video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../core/constants/app_text_theme.dart';

class EducationalVideoDetailsUI extends StatefulWidget {
  const EducationalVideoDetailsUI({Key? key, required this.videoModel})
      : super(key: key);
  final VideoModel videoModel;

  @override
  State<EducationalVideoDetailsUI> createState() =>
      _EducationalVideoDetailsUIState();
}

class _EducationalVideoDetailsUIState extends State<EducationalVideoDetailsUI> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(widget.videoModel.videoUrl ?? "") ??
                "",
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        builder: (BuildContext context, Widget player) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.videoModel.title ?? "",
                      style: AppTextTheme.regularLargeStyle
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                    Text(
                      widget.videoModel.publishDate ?? "",
                      style: AppTextTheme.lightStyle,
                    ),
                  ],
                ),
              )
              //some other widgets
            ],
          );
        },
      )),
    );
  }
}
