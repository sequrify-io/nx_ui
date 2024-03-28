import 'package:flutter/material.dart';

class NxSearchTextField extends StatefulWidget {
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

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final MaterialStateProperty<Color?>? fillColor;
  final MaterialStateProperty<TextStyle?>? textStyle;
  final MaterialStateProperty<TextStyle?>? hintStyle;
  final MaterialStateProperty<BorderSide?>? side;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double? width;
  final double? height;
  final MaterialStatePropertyAll<double>? elevation;
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
        surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.black),
        backgroundColor: widget.fillColor,
        controller: widget.controller,
        hintText: widget.hintText ?? 'Search',
        hintStyle: widget.hintStyle,
        elevation: widget.elevation ?? const MaterialStatePropertyAll<double>(0),
        padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
        onTap: widget.onTap,
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        leading: const Icon(Icons.search),
        trailing: widget.trailing,
      ),
    );
  }
}
