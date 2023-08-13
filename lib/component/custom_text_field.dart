import 'package:flutter/material.dart';
import 'package:phi/utils/all_colors.dart';

import '../utils/font_size.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final FormFieldValidator? validator;
  final Function()? ontap;
  final bool? enable;
  final bool? showCursor;
  final bool? enableInteractiveSelection;

  const CustomTextField(
      {super.key,
        required this.hintText,
        this.enable,
        required this.controller,
        this.keyboardType,
        this.validator, this.ontap, this.labelText, this.showCursor, this.enableInteractiveSelection});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: showCursor,
      enableInteractiveSelection: enableInteractiveSelection,
      enabled: enable??true,
      style: TextStyle(fontSize: FontSize.p1),

      autofocus: true,
      onTap: ontap,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,


      decoration: InputDecoration(
          labelText:controller.text.isEmpty?(labelText?? hintText):hintText,
          border: UnderlineInputBorder(borderSide: BorderSide(color: AllColors.white)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AllColors.white)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide( color: AllColors.ash)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide( color: Colors.red)),
          hintText: hintText,
          hintStyle: TextStyle(color: AllColors.black),
          labelStyle: TextStyle(color: AllColors.white)

      ),
    );
  }
}

class AuthInputField extends StatefulWidget {
  const AuthInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword,
    this.validator, this.labelText,
  });
  final bool? isPassword;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator? validator;

  final String? labelText;

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: widget.validator,
      obscureText: (widget.isPassword ?? false) && !isPasswordVisible,
      obscuringCharacter: "*",
      controller: widget.controller,
      decoration: InputDecoration(
          labelText:widget.controller.text.isEmpty?(widget.labelText?? widget.hintText):widget.hintText,
          border: UnderlineInputBorder(borderSide: BorderSide(color: AllColors.white)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AllColors.white)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide( color: AllColors.ash)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide( color: Colors.red)),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: AllColors.black),
          labelStyle: TextStyle(color: AllColors.white)

      ),
    );
  }
}