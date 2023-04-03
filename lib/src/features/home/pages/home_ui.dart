import 'dart:isolate';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:portfolio/src/core/constants/app_colors.dart';
import 'package:portfolio/src/core/constants/app_strings.dart';
import 'package:portfolio/src/core/constants/app_text_theme.dart';
import 'package:portfolio/src/core/widgets/common_button.dart';
import 'package:portfolio/src/core/widgets/common_outline_button.dart';
import 'package:portfolio/src/core/widgets/common_utilis.dart';
import 'package:portfolio/src/features/home/widgets/circular_graph_item_widget.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final ReceivePort _port = ReceivePort();
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircularGraphItemWidget(),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Hello, I'm Anoop P John",
              style: AppTextTheme.heading1Style
                  .copyWith(fontWeight: FontWeight.w900, fontSize: 24),
              textAlign: TextAlign.start,
            ),
            Text(
              "Flutter Developer",
              style: AppTextTheme.heading2Style.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  letterSpacing: 3),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.resumeDescription,
              style: AppTextTheme.regularStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonButton(
                    voidCallback: () {},
                    title: "Hire Me",
                    width: width(context, 0.45)),
                CommonOutlineButton(
                    voidCallback: () async {
                      var status = await Permission.storage.request();
                      if (status.isGranted) {
                        final directory = await getExternalStorageDirectory();
                        String? path = directory?.path;
                        final taskId = await FlutterDownloader.enqueue(
                          saveInPublicStorage: true,
                          url:
                              'https://drive.google.com/uc?export=download&id=1KloOmCZaYKgup_7H92nma13rIlf4uVyk',
                          headers: {}, // optional: header send with url (auth token etc)
                          savedDir: path!,
                          showNotification:
                              true, // show download progress in status bar (for Android)
                          openFileFromNotification:
                              true, // click on notification to open downloaded file (for Android)
                        );
                      }
                    },
                    title: "Resume",
                    width: width(context, 0.45))
              ],
            )
          ],
        ),
      ),
    );
  }
}
