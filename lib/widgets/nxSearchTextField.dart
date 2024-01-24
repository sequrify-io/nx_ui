import 'package:flutter/material.dart';

class NxSearchTextField extends StatefulWidget {
  const NxSearchTextField({
    super.key,
    this.onChanged,
    this.searchText,
    this.readOnly = false,
    this.cursorColor,
    this.fillColor,
    this.labelStyle,
    this.hintStyle,
    this.prefixIcon,
  });

  final Function(String)? onChanged;
  final bool readOnly;
  final String? searchText;
  final Color? cursorColor;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;

  @override
  State<NxSearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<NxSearchTextField> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.readOnly,
      focusNode: _focus,
      autofocus: true,
      cursorColor: widget.cursorColor ?? Colors.pink,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: _focus.hasFocus == true ? widget.searchText ?? 'Search' : '',
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
        labelStyle: widget.labelStyle ??
            const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              color: Colors.blue,
            ),
        hintStyle: widget.hintStyle ??
            const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              color: Colors.blue,
            ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
        ),
        prefixIcon: widget.prefixIcon ?? const Icon(Icons.search, color: Colors.pink),
      ),
    );
  }
}
