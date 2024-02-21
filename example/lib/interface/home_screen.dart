import 'package:flutter/material.dart';
import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:nx_ui/widgets/nxBackgroundCard.dart';
import 'package:nx_ui/widgets/nxBackgroundLayer.dart';
import 'package:nx_ui/widgets/nxEmptyScreen.dart';
import 'package:nx_ui/widgets/nxSearchTextField.dart';
import 'package:nx_ui/widgets/nxCustomSnackbar.dart';
import 'package:nx_ui/widgets/nxPrimaryButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              // imagePath: "assets/images/nextapps_logo.png",
              // imageShift: 295,
              // imageOpacity: 0.5,
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
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    nxPrimaryButton(
                      imageColor: Colors.black,
                      onPressed: () {
                        NxCustomSnackBar.showErrorSnackBar(context: context, message: 'Error');
                      },
                      labelText: 'Invoke snackbar',
                    ),
                    nxEmptyScreen(
                      context,
                      height: 300,
                      const Text('No elements'),
                      Colors.white,
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
      ),
      title: 'Home Screen',
    );
  }
}
