import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final PodPlayerController controller;

  @override
  void initState() {
    // controller = PodPlayerController(
    //   playVideoFrom: PlayVideoFrom.network(
    //     'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    //   ),
    // )..initialise();

    // controller = PodPlayerController(
    //     playVideoFrom: PlayVideoFrom.network(
    //       'https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/ndtv24x7master.m3u8',
    //     ),
    //     podPlayerConfig: const PodPlayerConfig(
    //         forcedVideoFocus: true, wakelockEnabled: true))
    //   ..initialise();

    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(
            "https://www.youtube.com/watch?v=F03m5y0v4lw"))
      ..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: controller.isFullScreen
                ? MediaQuery.of(context).size.height
                : 280,
            child: PodVideoPlayer(
              videoTitle: const Text("Somoy TV"),
              controller: controller,
              alwaysShowProgressBar: false,
              onLoading: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black87,
                    color: Colors.red,
                    strokeWidth: 2,
                  ),
                );
              },
              podPlayerLabels: const PodPlayerLabels(
                play: "Play label customized",
                pause: "Pause label customized",
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
