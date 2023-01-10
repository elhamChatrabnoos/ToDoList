import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key,
    this.onChanged,
    this.icon,
    required this.secure,
    this.onTap,
    this.boxColor,
    this.hintText,
    this.borderStyle,
    required this.marginSize, this.initialValue})
      : super(key: key);

  final Function(String?)? onChanged;
  final Function()? onTap;
  final bool secure;
  final Icon? icon;
  final Color? boxColor;
  final String? hintText;
  final String? initialValue;

  // final textController = TextEditingController();
  final InputBorder? borderStyle;
  final double marginSize;

  final textController = TextEditingController();


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isSecure = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.marginSize),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: widget.boxColor),
        child: TextFormField(
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            labelText: widget.hintText,
            hintText: widget.hintText,
            border: widget.borderStyle,
            suffixIcon: InkWell(
                onTap: widget.onTap, child: widget.icon ?? const SizedBox()),
          ),
          obscureText: widget.secure,
        ),
      ),
    );
  }
}
