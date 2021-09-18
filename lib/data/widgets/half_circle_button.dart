import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sentimen/themes/theme_services.dart';

class HalfCircleButton extends StatelessWidget {
  final Widget? child;
  final Gradient? gradient;
  final double width;
  final double? height;
  final void Function()? onPressed;
  final double? borderRadius;
  final bool enabled;
  final double marginHorizontal;
  final String? title;
  final bool reverse;

  const HalfCircleButton({
    Key? key,
    this.title,
    this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 45,
    this.onPressed,
    this.borderRadius,
    this.enabled = true,
    this.reverse = false,
    this.marginHorizontal = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
      decoration: BoxDecoration(
        gradient: gradient ??
            LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              colors: enabled
                  ? <Color>[
                      reverse
                          ? Resources.color.textColorWhite
                          : ThemeService().isDarkMode()
                              ? Resources.color.dropdownDarkButtonColor
                              : Resources.color.colorPrimary.withOpacity(0.3),
                      reverse
                          ? Resources.color.textColorWhite
                          : ThemeService().isDarkMode()
                              ? Resources.color.dropdownDarkButtonColor
                              : Resources.color.colorPrimary.withOpacity(0.3)
                    ]
                  : <Color>[
                      Resources.color.colorPaleGrey,
                      Resources.color.colorPaleGrey
                    ],
            ),
        boxShadow: [
          enabled
              ? BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.2),
                  offset: Offset(-3.0, 0.0),
                  blurRadius: 4,
                  spreadRadius: 0.0,
                )
              : BoxShadow(color: Colors.transparent),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(height ?? 45),
            bottomLeft: Radius.circular(height ?? 45)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(height ?? 45),
              bottomLeft: Radius.circular(height ?? 45)),
          onTap: enabled ? onPressed ?? () {} : null,
          child: Center(
              child: child ??
                  Text(
                    title.toString(),
                    style: Theme.of(context).textTheme.button?.copyWith(
                        fontSize: 16,
                        color: reverse ? Resources.color.colorPrimary : null),
                  )),
        ),
      ),
    );
  }
}
