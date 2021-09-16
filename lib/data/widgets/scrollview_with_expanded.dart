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
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          controller: scrollController,
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

class ScrollViewWithExpandedXY extends StatelessWidget {
  ScrollViewWithExpandedXY({
    Key? key,
    required this.child,
    this.physics,
    this.scrollControllerY,
    this.scrollControllerX,
  }) : super(key: key);
  final List<Widget> child;
  final ScrollPhysics? physics;
  final ScrollController? scrollControllerY;
  final ScrollController? scrollControllerX;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          controller: scrollControllerX ?? ScrollController(),
          physics: physics,
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
