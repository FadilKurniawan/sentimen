import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ScrollViewWithExpanded extends StatefulWidget {
  ScrollViewWithExpanded({
    Key? key,
    required this.child,
    this.physics,
  }) : super(key: key);
  List<Widget> child;
  ScrollPhysics? physics;

  @override
  _ScrollViewWithExpandedState createState() => _ScrollViewWithExpandedState();
}

class _ScrollViewWithExpandedState extends State<ScrollViewWithExpanded> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          physics: widget.physics,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ScrollViewWithExpandedXY extends StatefulWidget {
  ScrollViewWithExpandedXY({
    Key? key,
    required this.child,
    this.physics,
  }) : super(key: key);
  final List<Widget> child;
  final ScrollPhysics? physics;

  @override
  _ScrollViewWithExpandedXYState createState() =>
      _ScrollViewWithExpandedXYState();
}

class _ScrollViewWithExpandedXYState extends State<ScrollViewWithExpandedXY> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: widget.physics,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
