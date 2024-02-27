import 'package:flutter/material.dart';

import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:nx_ui/widgets/nx_background_layer.dart';
import 'package:nx_ui/widgets/nx_primary_button.dart';
import 'package:nx_ui/widgets/nx_secondary_button.dart';
import 'package:nx_ui/widgets/nx_background_card.dart';
import 'package:nx_ui/widgets/nx_empty_screen.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NxBasicScreen(
      appContext: context,
      isFullScreen: true,
      body: Center(
        child: Stack(
          children: [
            NxBackgroundLayer(
              backgroundColor: Colors.black.withOpacity(0.3),
            ),
            Positioned(
              bottom: 0,
              child: NxBackgroundCard(
                height: 0.5,
                elevation: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NxEmptyScreen(
                      height: 350,
                      context: context,
                      information: const Text('No elements'),
                      // color: Colors.white,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        NxSecondaryButton(
                          text: "Cancel",
                          onPressed: () {},
                          buttonWidth: 155,
                          buttonHeight: 50,
                        ),
                        const Spacer(),
                        NxPrimaryButton(
                          text: "Add",
                          onPressed: () {},
                          buttonWidth: 155,
                          buttonHeight: 50,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      customAppBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
        title: const Text(
          'Social Screen',
          // style: TextStyle(
          //   fontSize: 16,
          //   fontFamily: 'Roboto',
          //   fontWeight: FontWeight.w500,
          //   color: Color(0xFF625B71),
          // ),
        ),
        leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.more_vert,
            color: Color(0xFF625B71),
          ),
        ),
      ),
      title: 'Home Screen',
    );
  }
}
