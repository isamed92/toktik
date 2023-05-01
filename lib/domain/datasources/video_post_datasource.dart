import 'package:vertical_videos/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavouriteVideosByUser(String userId);
}
