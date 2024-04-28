import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PopularTrailersController extends GetxController {
  final trailers = [
    {
      'path': 'https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/Rebel%20Moon%20-%20Part%20Two_%20The%20Scargiver%20_%20Official%20Teaser%20_%20Netflix.mp4?alt=media&token=feebfa58-56b5-489c-ac10-ed575aa8a554',
      'title': 'Spiderman: Into The Spiderverse',
      'type': 'Action',
      'time': 'March 2, 2024',
      'isPlaying': false,
    },
    {
      'path': 'https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/Rebel%20Moon%20-%20Part%20Two_%20The%20Scargiver%20_%20Official%20Teaser%20_%20Netflix.mp4?alt=media&token=feebfa58-56b5-489c-ac10-ed575aa8a554',
      'title': 'Jumanji: The Next Level',
      'type': 'Adventure',
      'time': 'Mai 1, 2024',
      'isPlaying': false,
    },
    {
      'path': 'https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/Rebel%20Moon%20-%20Part%20Two_%20The%20Scargiver%20_%20Official%20Teaser%20_%20Netflix.mp4?alt=media&token=feebfa58-56b5-489c-ac10-ed575aa8a554',
      'title': 'Jumanji: The Next Level',
      'type': 'Adventure',
      'time': 'Mai 1, 2024',
      'isPlaying': false,
    },
  ];

  void initVideoPlayerForEachVideo(){
    for (var i = 0; i < trailers.length; i++) {
      final videoPlayerController = VideoPlayerController
      .networkUrl(Uri.parse(trailers[i]['path'] as String))
      ..initialize();
      trailers[i]['controller'] = videoPlayerController;
    }
    update();
  }

  @override
  void onInit() {
    initVideoPlayerForEachVideo();
    super.onInit();
  }
}