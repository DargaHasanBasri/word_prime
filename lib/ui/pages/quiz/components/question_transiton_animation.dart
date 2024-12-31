import 'package:flutter/material.dart';

class QuestionTransition extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  const QuestionTransition({
    Key? key,
    required this.child,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<QuestionTransition> createState() => _QuestionTransitionState();
}

class _QuestionTransitionState extends State<QuestionTransition> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}