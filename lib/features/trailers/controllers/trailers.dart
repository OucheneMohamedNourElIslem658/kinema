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
      .networkUrl(Uri.parse('https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/The%20Fast%20and%20the%20Furious%20Official%20Trailer%20%231%20-%20(2001)%20HD.mp4?alt=media&token=e413bcbc-9657-40d1-9f8f-7c72eced158d'))
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