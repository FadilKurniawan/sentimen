import 'package:flutter/material.dart';

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
      this.minLines = 1,
      this.maxLines,
      this.height,
      this.width,
      this.onSuffixTap,
      required this.onChanged,
      required this.onSaved});

  final TextEditingController? controller;
  final IconData? iconPrefix;
  final IconData? iconSuffix;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final int minLines;
  final int? maxLines;
  final double? height;
  final double? width;
  final void Function()? onSuffixTap;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;

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
                  tooltip: 'show/hide',
                  icon: Icon(
                    iconSuffix,
                    color: Colors.grey,
                  ),
                )
              : null,
        ),
        enabled: enabled,
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        minLines: minLines,
        validator: validator,
      ),
    );
  }
}
