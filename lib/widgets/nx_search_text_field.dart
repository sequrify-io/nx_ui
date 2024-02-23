import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NxSearchTextField extends StatefulWidget {
  const NxSearchTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.readOnly = false,
    this.cursorColor,
    this.fillColor,
    this.labelStyle,
    this.hintStyle,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.width,
    this.height,
  });

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool readOnly;
  final Color? cursorColor;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double? width;
  final double? height;

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
      child: TextField(
        readOnly: widget.readOnly,
        controller: widget.controller,
        focusNode: widget.focusNode ?? _focus,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          labelText: 'Search',
          border: const OutlineInputBorder(),
          suffixIcon: widget.suffixIcon ?? const Icon(Ionicons.search),
        ),
      ),
    );
  }
}
