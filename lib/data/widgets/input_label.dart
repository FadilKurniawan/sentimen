import 'package:flutter/material.dart';
import 'package:sentimen/resources/resources.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    Key? key,
    this.title,
    this.child,
    this.suffixChild,
    this.prefixChild,
    this.titlePadding = const EdgeInsets.only(bottom: 8),
    this.rowTitleSuffix,
    this.titleStyle,
  }) : super(key: key);

  final String? title;
  final Widget? child;
  final Widget? suffixChild;
  final Widget? prefixChild;
  final EdgeInsets titlePadding;
  final MainAxisAlignment? rowTitleSuffix;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        title != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: rowTitleSuffix ?? MainAxisAlignment.start,
                  children: [
                    prefixChild ?? Container(),
                    Text(
                      title ?? '',
                      style: titleStyle ??
                          Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontSize: 12,
                              color: Resources.color.textColor,
                              fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 9),
                    suffixChild ?? Container(),
                  ],
                ),
              )
            : Container(),
        child ?? Container(),
      ],
    );
  }
}
