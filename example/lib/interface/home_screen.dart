import 'package:example/repositories/notification_repository/models/notification_model.dart';
import 'package:example/repositories/notification_repository/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nx_local_notifications/nx_local_notifications.dart';
import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:nx_ui/widgets/nx_background_layer.dart';
import 'package:nx_ui/widgets/nx_photo_card.dart';
import 'package:nx_ui/widgets/nx_primary_button.dart';
import 'package:nx_ui/widgets/nx_secondary_button.dart';
import 'package:nx_ui/widgets/nx_background_card.dart';
import 'package:nx_ui/widgets/nx_snackbar.dart';
import 'package:nx_ui/widgets/nx_search_text_field.dart';
import 'package:nx_ui/widgets/nx_expandable_text.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(
      notificationStreamProvider((payload) {
        final notification = NotificationEntry(
          id: '2',
          createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
          title: 'New notification',
          description: payload,
          readNotification: false,
        );
        context.pushNamed('notification_details', extra: notification);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _focus = FocusNode();
    final notificationList = ref.watch(notificationListProvider);

    return nxBasicScreen(
      appContext: context,
      isFullScreen: true,
      extendBodyBehindAppBar: true,
      appBarBackgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            NxBackgroundLayer(
              backgroundColor: Colors.white.withOpacity(0.2),
            ),
            Positioned(
              bottom: 0,
              child: NxBackgroundCard(
                height: 0.76,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: NxSearchTextField(
                        focusNode: _focus,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: NxPrimaryButton(
                        buttonWidth: MediaQuery.of(context).size.width * 0.8,
                        onPressed: () {
                          // NxCustomSnackBar.showErrorSnackBar(context: context, message: 'Error');
                          // NxCustomSnackBar.showSuccessSnackBar(context: context, message: 'Success');
                          NxCustomSnackBar.showWarningSnackBar(context: context, message: 'Warning');
                        },
                        text: 'Invoke snackbar',
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: NxSecondaryButton(
                        buttonWidth: MediaQuery.of(context).size.width * 0.8,
                        onPressed: () async {
                          final notification = NotificationEntry(
                            id: '2',
                            createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                            title: 'New data from New York',
                            description: 'TNew York, often referred to as the "Big Apple," is one of the most iconic cities in the world. Located on the northeastern coast of the United States, it is a bustling metropolis known for its diverse culture, towering skyscrapers, and vibrant atmosphere.',
                            readNotification: false,
                          );
                          notificationList.add(notification);
                          ref.read(notificationsProvider.notifier).update((_) => true);
                          ref.read(notificationListProvider.notifier).update((_) => notificationList);
                          await NotificationService.showNotification(
                            title: 'New data from New York',
                            body: 'TNew York, often referred to as the "Big Apple," is one of the most iconic cities in the world. Located on the northeastern coast of the United States, it is a bustling metropolis known for its diverse culture, towering skyscrapers, and vibrant atmosphere.',
                            payload: 'New data from New York',
                          );
                        },
                        text: 'Add notification',
                      ),
                    ),
                    const NxPhotoCard(
                      imagePath: 'assets/images/new_york.png',
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: NxExpandableText(
                        text: 'Ut in felis sed nisi posuere egestas id id neque. Integer sit amet ligula bibendum lorem fringilla dictum. Nullam consequat ex id pellentesque feugiat. Nullam in purus in urna tristique commodo. Morbi vitae velit odio. Vivamus vel congue felis. Curabitur volutpat, magna vitae porttitor tempus, massa ante mollis ante, sit amet consectetur felis felis ac leo. Sed tristique, dui ut mollis tempor, augue est dapibus sapien, eget sagittis arcu urna eget odio. Pellentesque dignissim, quam eget pharetra gravida, tortor quam feugiat risus, at tristique ex massa et risus. Praesent ipsum metus, tincidunt ac dapibus sed, convallis in enim. Praesent finibus tristique est sed iaculis. In vel volutpat massa. Proin ac est ut leo luctus imperdiet.',
                        buttonText: 'Expand text',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      customAppBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Color(0xFF625B71),
          ),
        ),
        leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.more_vert,
            color: Color(0xFF625B71),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(
              'notifications',
              extra: NotificationScreenArgs<NotificationEntry>(
                dataList: notificationList,
                onTap: (NotificationEntry notification) => context.pushNamed('notification_details', extra: notification),
              ),
            ),
            icon: const NotificationsIconButton(),
          ),
        ],
      ),
      title: 'Home Screen',
    );
  }
}
