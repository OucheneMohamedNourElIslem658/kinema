String getTimeRange(DateTime dateTime, int minutesToAdd) {
  DateTime endDateTime = dateTime.add(Duration(minutes: minutesToAdd));
  String startTime =
      '${dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.hour >= 12 ? 'PM' : 'AM'}';
  String endTime =
      '${endDateTime.hour % 12 == 0 ? 12 : endDateTime.hour % 12}:${endDateTime.minute.toString().padLeft(2, '0')} ${endDateTime.hour >= 12 ? 'PM' : 'AM'}';
  return '$startTime - $endTime';
}

String addMinutes(DateTime dateTime, int minutesToAdd) {
  DateTime newDateTime = dateTime.add(Duration(minutes: minutesToAdd));
  return formatHour(newDateTime);
}

String formatDateTime(DateTime dateTime) {
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  String dayOfWeek = days[dateTime.weekday - 1];
  String dayOfMonth = dateTime.day.toString().padLeft(2, '0');
  return '$dayOfWeek $dayOfMonth';
}

String formatHour(DateTime dateTime) {
  String hour = dateTime.hour.toString().padLeft(2, '0');
  String minute = dateTime.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}
