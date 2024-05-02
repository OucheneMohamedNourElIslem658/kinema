class EventModel {
  final String url;
  final int day;
  final String month;
  final String title;
  final String description;

  EventModel({
    required this.day,
    required this.month,
    required this.title,
    required this.description,
    required this.url
  });
}