import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentimen/resources/resources.dart';

class FormInputFieldWithIcon extends StatelessWidget {
  FormInputFieldWithIcon(
      {this.controller,
      this.iconPrefix,
      this.iconSuffix,
      required this.labelText,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.enabled = true,
      this.minLines,
      this.maxLines,
      this.height,
      this.width,
      this.onSuffixTap,
      required this.onChanged,
      required this.onSaved,
      this.inputFormatters,
      this.suffixTooltip});

  final TextEditingController? controller;
  final IconData? iconPrefix;
  final IconData? iconSuffix;
  final String labelText;
  final String? suffixTooltip;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final int? minLines;
  final int? maxLines;
  final double? height;
  final double? width;
  final void Function()? onSuffixTap;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          prefixIcon: iconPrefix != null ? Icon(iconPrefix) : null,
          hintText: labelText,
          suffixIcon: iconSuffix != null
              ? IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: onSuffixTap,
                  tooltip: suffixTooltip ?? 'show/hide',
                  icon: Icon(
                    iconSuffix,
                    color: Colors.grey,
                  ),
                )
              : null,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(8),
          //   borderSide:
          //       BorderSide(color: Resources.color.borderColor, width: 1),
          // ),
        ),
        expands: maxLines != null ? false : true,
        enabled: enabled,
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        minLines: minLines,
        validator: validator,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
