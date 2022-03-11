import 'package:flutter/material.dart';

class MotionContainer extends StatefulWidget {
  final Widget widget;
  final Map<String, dynamic> animate;
  final Map<String, dynamic> transition;
  final Map<String, dynamic> rotation;
  final Map<String, dynamic> opacity;

  const MotionContainer(
      {Key? key,
      required this.widget,
      this.animate = const {},
      this.transition = const {},
      this.rotation = const {},
      this.opacity = const {}})
      : super(key: key);

  @override
  _MotionContainerState createState() => _MotionContainerState();
}

class _MotionContainerState extends State<MotionContainer>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    if (widget.transition["duration"] > 0) {
      controller = AnimationController(
        duration: Duration(milliseconds: widget.transition["duration"]),
        vsync: this,
      );
    }

    if (widget.animate["scale"] > 0) {
      animation = Tween<double>(begin: 1.0, end: widget.animate["scale"])
          .animate(controller);
    }

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: widget.widget,
    );
  }
}
