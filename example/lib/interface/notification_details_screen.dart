import 'package:example/repositories/notification_repository/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nx_local_notifications/nx_local_notifications.dart';
import 'package:nx_ui/widgets/nx_photo_card.dart';

class NotificationDetailsScreen extends ConsumerWidget {
  const NotificationDetailsScreen({super.key, required this.notification});
  final NotificationEntry notification;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF625B71),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            ref.read(notificationsProvider.notifier).update((_) => false);
            context.pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/icon_left_arrow.svg',
          ),
        ),
      ),
      body: NotificationDetailsView(
        notification: notification,
        context: context,
        widget: const NxPhotoCard(
          imagePath: 'assets/images/new_york.png',
        ),
      ),
    );
  }
}
