import 'package:get/get.dart';

class SettingsController extends GetxController {
  final avatars = [
    {
      'imagePath': 'assets/images/avatar1.png',
      'isSelected': true
    },
    {
      'imagePath': 'assets/images/avatar2.png',
      'isSelected': false
    },
    {
      'imagePath': 'assets/images/avatar3.png',
      'isSelected': false
    },
    {
      'imagePath': 'assets/images/avatar4.png',
      'isSelected': false
    },
    {
      'imagePath': 'assets/images/avatar5.png',
      'isSelected': false
    },
    {
      'imagePath': 'assets/images/avatar6.png',
      'isSelected': false
    },
  ];

  void selectAvatar(int index){
    for (var i = 0; i < avatars.length; i++) {
      avatars[i]['isSelected'] = false;
    }
    avatars[index]['isSelected'] = true;
    update();
  }

}