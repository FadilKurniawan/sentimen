import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sentimen/resources/resources.dart';

class FormBuilderTextIcon extends StatelessWidget {
  FormBuilderTextIcon(
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
      this.name,
      this.inputFormatters});

  final TextEditingController? controller;
  final IconData? iconPrefix;
  final IconData? iconSuffix;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final int? minLines;
  final int? maxLines;
  final double? height;
  final double? width;
  final void Function()? onSuffixTap;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: FormBuilderTextField(
          name: name ?? '',
          style: Theme.of(context).textTheme.bodyText2,
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Resources.color.borderColor, width: 1),
            ),
          ),
          expands: maxLines != null ? false : true,
          enabled: enabled,
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          minLines: minLines,
          validator: validator,
          inputFormatters: inputFormatters,
          valueTransformer: (val) => val?.toString()),
    );
  }
}
