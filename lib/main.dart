import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_videos/config/theme/app_theme.dart';
import 'package:vertical_videos/infraestructure/datasources/local_videos_datasource_impl.dart';
import 'package:vertical_videos/infraestructure/repositories/video_post_repository_imp.dart';
import 'package:vertical_videos/presentation/providers/discover_provider.dart';
import 'package:vertical_videos/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImp(videosDatasource: LocalVideosDatasourcesImp());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoRepository: videoPostRepository)
            ..loadNextPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TokTik',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
