import 'package:flutter/material.dart';

class TextFiledCu extends StatelessWidget {
  const TextFiledCu({
    Key? key,
    this.initialValue,
    this.onChange,
    this.onTap,
    required this.obscureText,
    this.controller,
    this.icon,
    this.hintText,
    this.suffixIcon,
    this.helperText,
    this.counterText,
    this.borderRadius,
    required this.borderColor,
    this.onTapIcon,
    this.onTapIconSuffix,
    required this.width, this.labelText, this.keyboardType
  }) : super(key: key);

  final String? initialValue;
  final Function(String)? onChange;
  final Function()? onTap;
  final Function()? onTapIcon;
  final Function()? onTapIconSuffix;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? icon;
  final String? hintText;
  final Widget? suffixIcon;
  final String? helperText;
  final String? counterText;
  final double? borderRadius;
  final Color borderColor;
  final double width;
  final String? labelText;
  final TextInputType? keyboardType;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      keyboardType: keyboardType,
      initialValue: initialValue,
      onChanged: onChange,
      onTap: onTap,
      obscureText:obscureText,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          icon:InkWell(
            child:icon,
            onTap: onTapIcon,
          ),
          hintText: hintText,
          suffixIcon: InkWell(
            child:suffixIcon,
            onTap: onTapIconSuffix,
          ),
          helperText: helperText,
          counterText: counterText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(
                color: borderColor,
                width: width,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(
                  width: width,
                  color: borderColor
              )
          )
      ),
    );
  }
}