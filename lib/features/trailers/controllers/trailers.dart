import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '/commun/constents/movies_list.dart';

class TrailersController extends GetxController {
  final List<Map<String,Object>> trailers = [];

  Future<void> initVideoPlayerForEachVideo() async {
    for (var i = 0; i < program.length; i++) {
      trailers.add({
        'movie': program[i]
      });
      update();
    }
    for (var i = 0; i < trailers.length; i++) {
      final videoPlayerController = VideoPlayerController
      //change the url to the movies.videoURL
      .asset('assets/videos/complete_dilevery_button.mp4')
      ..initialize().then((_) => update());
      trailers[i]['controller'] = videoPlayerController;
    }
  }
  
  @override
  void onInit() async {
    await initVideoPlayerForEachVideo();
    super.onInit();
  }
}