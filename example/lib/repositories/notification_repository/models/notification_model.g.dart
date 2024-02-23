// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEntry _$NotificationEntryFromJson(Map<String, dynamic> json) =>
    NotificationEntry(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      createdAt: json['createdAt'] as String,
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      readNotification: json['readNotification'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationEntryToJson(NotificationEntry instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'readAt': instance.readAt?.toIso8601String(),
      'readNotification': instance.readNotification,
    };
