import 'package:flutter/material.dart';

/// A Material 3 search field widget with support for different visual states and custom styling.
///
/// This widget wraps Flutter's [SearchBar] widget and provides additional customization
/// options for appearance and behavior. It includes a search icon by default and
/// supports trailing widgets for additional actions.
///
/// The widget's appearance can be customized for different states (enabled, disabled,
/// focused, hovered) using [WidgetStateProperty] parameters.
///
/// Example usage:
/// ```dart
/// NxSearchTextField(
///   onChanged: (value) {
///     // Handle search text changes
///   },
///   onSubmitted: (value) {
///     // Handle search submission
///   },
///   hintText: 'Search items...',
///   fillColor: const WidgetStatePropertyAll<Color>(Colors.grey),
///   trailing: [
///     IconButton(
///       icon: Icon(Icons.clear),
///       onPressed: () {
///         // Clear search
///       },
///     ),
///   ],
/// )
/// ```
class NxSearchTextField extends StatefulWidget {
  /// Creates a search text field.
  ///
  /// * [onChanged] - Called when the text changes
  /// * [onSubmitted] - Called when the user submits the search
  /// * [onTap] - Called when the field is tapped
  /// * [fillColor] - Background color for different states
  /// * [textStyle] - Text style for different states
  /// * [hintStyle] - Hint text style for different states
  /// * [hintText] - Placeholder text (defaults to "Search")
  /// * [controller] - For controlling the text input
  /// * [focusNode] - For controlling focus
  /// * [width] - Field width
  /// * [height] - Field height
  /// * [elevation] - Elevation for different states
  /// * [trailing] - Widgets to show after the search icon
  /// * [side] - Border style for different states
  /// * [shape] - Field shape for different states
  const NxSearchTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.fillColor,
    this.textStyle,
    this.hintStyle,
    this.hintText,
    this.controller,
    this.focusNode,
    this.width,
    this.height,
    this.elevation,
    this.trailing,
    this.side,
    this.shape,
  });

  /// Called when the user changes the text in the field.
  final Function(String)? onChanged;

  /// Called when the user submits the search (e.g., by pressing enter).
  final Function(String)? onSubmitted;

  /// Called when the user taps on the search field.
  final Function()? onTap;

  /// The background color of the search field for different states.
  ///
  /// Use [WidgetStatePropertyAll] for a constant color or implement
  /// [WidgetStateProperty] for state-dependent colors.
  final WidgetStateProperty<Color?>? fillColor;

  /// The text style for the input text in different states.
  final WidgetStateProperty<TextStyle?>? textStyle;

  /// The text style for the hint text in different states.
  final WidgetStateProperty<TextStyle?>? hintStyle;

  /// The border style for different states.
  ///
  /// Use this to customize the border color, width, and style
  /// based on the field's state.
  final WidgetStateProperty<BorderSide?>? side;

  /// The shape of the search field for different states.
  ///
  /// This determines the field's border radius and overall shape.
  final WidgetStateProperty<OutlinedBorder?>? shape;

  /// The placeholder text shown when the field is empty.
  ///
  /// Defaults to "Search" if not specified.
  final String? hintText;

  /// A controller for the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// Defines the keyboard focus for this widget.
  ///
  /// If null, this widget will create its own [FocusNode].
  final FocusNode? focusNode;

  /// The width of the search field.
  ///
  /// If null, the field will size itself to its parent's constraints.
  final double? width;

  /// The height of the search field.
  ///
  /// If null, the field will size itself to its parent's constraints.
  final double? height;

  /// The elevation of the search field for all states.
  ///
  /// This controls the shadow beneath the field.
  /// Defaults to 0 if not specified.
  final WidgetStatePropertyAll<double>? elevation;

  /// Additional widgets to display after the search icon.
  ///
  /// Commonly used for clear button or other action buttons.
  final Iterable<Widget>? trailing;

  @override
  State<NxSearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<NxSearchTextField> {
  late FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: SearchBar(
        side: widget.side,
        shape: widget.shape,
        textStyle: widget.textStyle,
        focusNode: widget.focusNode ?? _focus,
        surfaceTintColor: const WidgetStatePropertyAll<Color>(Colors.black),
        backgroundColor: widget.fillColor,
        controller: widget.controller,
        hintText: widget.hintText ?? 'Search',
        hintStyle: widget.hintStyle,
        elevation: widget.elevation ?? const WidgetStatePropertyAll<double>(0),
        padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16),),
        onTap: widget.onTap,
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        leading: const Icon(Icons.search),
        trailing: widget.trailing,
      ),
    );
  }
}
