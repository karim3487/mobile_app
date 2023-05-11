import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String? hint;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        maxLength: 25,
        keyboardType: this.inputType,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: this.hint,
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white54),
            counterText: '',
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            prefixIcon: this.isIcon ? Icon(this.icon, color: iconColor) : null),
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    required this.icon,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.white54,
    this.iconColor = Colors.white54,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}
