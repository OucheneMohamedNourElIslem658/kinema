import 'package:get/get.dart';
import '../../../commun/models/movie.dart';

enum SeatStatus {
  available,
  blocked,
  selected
}

class ReservationsController extends GetxController {
  List<Movie> reservations = [];
  final seats = [
    [SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available],
    [SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available],
    [SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available],
    [SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available],
    [SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.blocked],
    [SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available],
    [SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.available],
    [SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available],
    [SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.blocked,SeatStatus.blocked,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available,SeatStatus.available],
  ];

  final List<String> reservedPlaces = [];

  double totalPrice = 0;
  double singleSeatPrice = 800;

  void reserveSeat(int row, int column){
    final rowLetter = String.fromCharCode(row + 65);
    switch (seats[row][column]) {
      case SeatStatus.available:
        seats[row][column] = SeatStatus.selected;
        totalPrice += singleSeatPrice;
        reservedPlaces.add('$rowLetter${column+1}');
        break;
      case SeatStatus.selected:
        seats[row][column] = SeatStatus.available;
        totalPrice -= singleSeatPrice;
        reservedPlaces.removeLast();
        break;
      default: break;
    }
    update();
  }

  void cancelReservation(int index){
    reservations.removeAt(index);
    update();
  }

  void addReserVation(Movie movie){
    reservations.add(
      movie
    );
    update();
  }

}