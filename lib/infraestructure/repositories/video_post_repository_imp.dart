import 'package:vertical_videos/domain/datasources/video_post_datasource.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';
import 'package:vertical_videos/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImp extends VideoPostRepository {
  final VideoPostDatasource videosDatasource;

  VideoPostsRepositoryImp({required this.videosDatasource});
  @override
  Future<List<VideoPost>> getFavouriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
