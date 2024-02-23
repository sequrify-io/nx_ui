import 'package:example/repositories/notification_repository/models/notification_model.dart';
import 'package:example/repositories/notification_repository/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nx_local_notifications/nx_local_notifications.dart';
import 'package:nx_ui/widgets/nx_snackbar.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key, required this.arguments});
  final NotificationScreenArgs<NotificationEntry> arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataList = ref.watch(notificationListProvider);

    void onDismiss(DismissDirection direction, NotificationEntry item, int index, BuildContext context) {
      NotificationService.cancel(int.parse(item.id));
      dataList.removeAt(index);
      ref.read(notificationListProvider.notifier).update((_) => dataList);
      NxCustomSnackBar.showSuccessSnackBar(context: context, message: 'Successfully deleted notification');
    }

    return Scaffold(
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
        actions: [
          IconButton(
            onPressed: () {
              dataList.clear();
              NotificationService.cancelAll();
              ref.read(notificationListProvider.notifier).update((_) => []);
            },
            icon: const Icon(
              Icons.delete,
              color: Color(0xFF5F3ECC),
            ),
          )
        ],
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
      body: Center(
        child: NotificationsListView<NotificationEntry>(
          dataList: dataList,
          onTap: arguments.onTap,
          context: context,
          onDismiss: onDismiss,
        ),
      ),
    );
  }
}
