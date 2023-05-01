import 'package:flutter/material.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';
import 'package:vertical_videos/presentation/widgets/shared/video_buttons.dart';
import 'package:vertical_videos/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                url: videoPost.videoUrl,
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(
                video: videoPost,
              ),
            )
          ],
        );
      },
    );
  }
}
