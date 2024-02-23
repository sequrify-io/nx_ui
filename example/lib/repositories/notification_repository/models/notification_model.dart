import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationEntry {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  @JsonKey(defaultValue: '')
  final String description;
  final String createdAt;
  final DateTime? readAt;
  bool readNotification;

  NotificationEntry({required this.id, required this.title, required this.description, required this.createdAt, this.readAt, this.readNotification = false});

  factory NotificationEntry.fromJson(Map<String, dynamic> data) => _$NotificationEntryFromJson(data);

  Map<String, dynamic> toJson() => _$NotificationEntryToJson(this);
}
