import 'package:flutter/material.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';
import 'package:vertical_videos/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoRepository;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoRepository});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));
    // final List<VideoPost> newVideos = videoPosts
    //     .map((vid) => LocalVideoModel.fromJson(vid).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoRepository.getTrendingVideosByPage(1);
    initialLoading = false;
    videos.addAll(newVideos);
    notifyListeners();
  }
}
