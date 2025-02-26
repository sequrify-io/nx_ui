import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nx_ui/models/destination.dart';
import 'package:nx_ui/widgets/nx_background_card.dart';
import 'package:nx_ui/widgets/nx_background_layer.dart';
import 'package:nx_ui/widgets/nx_coming_soon_widget.dart';
import 'package:nx_ui/widgets/nx_empty_screen.dart';
import 'package:nx_ui/widgets/nx_expandable_text.dart';
import 'package:nx_ui/widgets/nx_navigation_drawer.dart';
import 'package:nx_ui/widgets/nx_primary_button.dart';
import 'package:nx_ui/widgets/nx_search_text_field.dart';
import 'package:nx_ui/widgets/nx_secondary_button.dart';
import 'package:nx_ui/widgets/nx_shimmer_box.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NX UI Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  int _selectedIndex = 0;
  final _searchController = TextEditingController();

  final _drawerDestinations = <Destination>[
    const Destination(
      'Home',
      Icon(Icons.home_outlined),
      Icon(Icons.home),
    ),
    const Destination(
      'Profile',
      Icon(Icons.person_outline),
      Icon(Icons.person),
    ),
    const Destination(
      'Settings',
      Icon(Icons.settings_outlined),
      Icon(Icons.settings),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NX UI Example'),
      ),
      drawer: NxCustomNavigationDrawer(
        destinations: _drawerDestinations,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pop(context);
        },
        signOutDestination: const Destination(
          'Sign out',
          Icon(Icons.logout_outlined),
          Icon(Icons.logout),
        ),
      ),
      body: Stack(
        children: [
          const NxBackgroundLayer(
            backgroundColor: Colors.black12,
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: NxSearchTextField(
                    controller: _searchController,
                    hintText: 'Search...',
                    onChanged: (value) {
                      // Handle search
                    },
                    trailing: [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Buttons Example',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        NxPrimaryButton(
                          text: 'Primary Button',
                          onPressed: () {},
                          buttonWidth: 200,
                        ),
                        NxSecondaryButton(
                          text: 'Secondary Button',
                          onPressed: () {},
                          buttonWidth: 200,
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'Cards Example',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const NxBackgroundCard(
                          height: 0.3,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text('Background Card Content'),
                                SizedBox(height: 16),
                                NxShimmerBox(
                                  height: 100,
                                ),
                                SizedBox(height: 16),
                                NxExpandableText(
                                  text:
                                      'This is a long text that can be expanded to show more content. Click the button below to see the full text in a dialog.',
                                  buttonText: 'Read More',
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'Empty States Example',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        NxEmptyScreen(
                          context: context,
                          information: const Text('No items found'),
                          height: 200,
                        ),
                        const SizedBox(height: 16),
                        const NxComingSoonWidget(
                          text: 'This feature will be available soon',
                          comingSoonTitle: 'Coming Soon',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
