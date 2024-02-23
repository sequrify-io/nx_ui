import 'package:example/repositories/notification_repository/models/notification_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationListProvider = StateProvider<List<NotificationEntry>>((ref) => []);
