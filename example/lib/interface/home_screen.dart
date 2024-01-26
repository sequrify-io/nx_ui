import 'package:flutter/material.dart';
import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:nx_ui/widgets/nxBackgroundCard.dart';
import 'package:nx_ui/widgets/nxBackgroundImage.dart';
import 'package:nx_ui/widgets/nxEmptyScreen.dart';
import 'package:nx_ui/widgets/nxSearchTextField.dart';
import 'package:nx_ui/widgets/nxCustomSnackbar.dart';
import 'package:nx_ui/widgets/nxPrimaryButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String searchString;
    return nxBasicScreen(
      appContext: context,
      isFullScreen: true,
      extendBodyBehindAppBar: true,
      appBarBackgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            const NxBackgroundImage(
              imagePath: "assets/images/nextapps_logo.png",
              imageShift: 295,
              opacity: 0.5,
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
                        onChanged: (value) {
                          searchString = value.toLowerCase();
                        },
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
      title: 'Home Screen',
      leftButton: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(
          Icons.more_vert,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
