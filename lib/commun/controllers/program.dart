import 'package:get/get.dart';
import 'package:kinema/models/movie.dart';

import '../constents/movies_list.dart';

class ProgramController extends GetxController {

  List<Movie> getActionMovies() {
    return program.where((movie) => movie.type == 'Action').toList();
  }

  List<Movie> getDramaMovies() {
    return program.where((movie) => movie.type == 'Drama').toList();
  }

  List<Movie> getAdventureMovies() {
    return program.where((movie) => movie.type == 'Adventure').toList();
  }

  List<Movie> getCrimeMovies() {
    return program.where((movie) => movie.type == 'Crime').toList();
  }

  List<Movie> getBiographyMovies() {
    return program.where((movie) => movie.type == 'Biography').toList();
  }

  List<Movie> getScienceFictionMovies() {
    return program.where((movie) => movie.type == 'Science Fiction').toList();
  }
}