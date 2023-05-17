import 'package:flutter/material.dart';
import 'package:mobile_app/shared/colors.dart';

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
            color: Color.fromARGB(255, 62, 122, 181),
            fontSize: 16,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: this.hint,
            hintStyle: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 178, 205, 240),
                fontWeight: FontWeight.normal),
            counterText: '',
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            prefixIcon: this.isIcon
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(this.icon, color: iconColor),
                  )
                : null),
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
