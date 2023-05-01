import 'package:flutter/material.dart';
import 'package:vertical_videos/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  const FullScreenPlayer({super.key, required this.url, required this.caption});

  final String url;
  final String caption;

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  // bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.url)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        }
        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(controller),
              // GRadiente
              VideoBackground(
                stops: const [0.8, 1.0],
              ),
              // texto del video
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption),
              ),
            ]),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
