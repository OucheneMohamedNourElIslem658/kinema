import 'package:get/get.dart';

enum SeatStatus {
  available,
  blocked,
  selected
}

class ReservationsController extends GetxController {
  var reservations = [
    {
      'movie': 'The Lion King',
      'date': 'Tuesday, April 21st at 10:00 AM',
      'type': 'Horror',
      'startsAfter': "127 min",
      'rate': 7.5,
      'imageURL': 'https://www.digitaltrends.com/wp-content/uploads/2024/04/Ariana-DeBose-in-Wish.jpg?fit=720%2C479&p=1'
    },
    {
      'movie': 'The Matrix',
      'date': 'Thursday, April 23rd at 2:30 PM',
      'type': 'Action',
      'startsAfter': '136 min',
      'rate': 8.9,
      'imageURL': 'https://www.digitaltrends.com/wp-content/uploads/2024/04/Ariana-DeBose-in-Wish.jpg?fit=720%2C479&p=1'
    },
    {
      'movie': 'Inception',
      'date': 'Saturday, April 25th at 6:15 PM',
      'type': 'Sci-Fi',
      'startsAfter': '148 min',
      'rate': 9.3,
      'imageURL': 'https://www.digitaltrends.com/wp-content/uploads/2024/04/Ariana-DeBose-in-Wish.jpg?fit=720%2C479&p=1'
    },
    {
      'movie': 'The Conjuring',
      'date': 'Monday, April 27th at 8:45 PM',
      'type': 'Horror',
      'startsAfter': '112 min',
      'rate': 8.1,
      'imageURL': 'https://www.digitaltrends.com/wp-content/uploads/2024/04/Ariana-DeBose-in-Wish.jpg?fit=720%2C479&p=1'
    },
    {
      'movie': 'The Shining',
      'date': 'Wednesday, April 29th at 11:20 AM',
      'type': 'Horror',
      'startsAfter': '144 min',
      'rate': 8.4,
      'imageURL': 'https://www.digitaltrends.com/wp-content/uploads/2024/04/Ariana-DeBose-in-Wish.jpg?fit=720%2C479&p=1'
    }
  ];

  

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


}