import 'package:vertical_videos/domain/datasources/video_post_datasource.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';
import 'package:vertical_videos/infraestructure/models/local_video_model.dart';
import 'package:vertical_videos/shared/data/local_video_post.dart';

class LocalVideosDatasourcesImp extends VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavouriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((vid) => LocalVideoModel.fromJson(vid).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
