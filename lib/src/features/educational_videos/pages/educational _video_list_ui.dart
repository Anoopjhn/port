import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/core/constants/app_text_theme.dart';
import 'package:portfolio/src/features/educational_videos/widgets/video_list_item_widget.dart';

import '../data/models/video_model.dart';

class EducationalVideoListUI extends StatefulWidget {
  const EducationalVideoListUI({Key? key}) : super(key: key);

  @override
  State<EducationalVideoListUI> createState() => _EducationalVideoListUIState();
}

class _EducationalVideoListUIState extends State<EducationalVideoListUI> {
  DatabaseReference ref = FirebaseDatabase.instance.ref("videos");
  late Stream<DatabaseEvent> stream;

  @override
  void initState() {
    stream = ref.onValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DatabaseEvent>(
        stream: stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text(
                  'Something Went Wrong Try later',
                  style: AppTextTheme.regularLargeStyle,
                );
              } else if (snapshot.hasData) {
                List data = snapshot.data!.snapshot.value as List;
                return ListView.separated(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 24),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    VideoModel item = VideoModel.fromJson(data[index]);
                    return VideoListItemWidget(
                      videoModel: item,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                );
                // return Text("Data", style: AppTextTheme.heading1Style,);
              } else {
                return Text(
                  'Something Went Wrong',
                  style: AppTextTheme.regularLargeStyle,
                );
              }
          }
        },
      ),
    );
  }
}
