import 'package:flutter/material.dart';

class LogoProgressIndicator extends StatefulWidget {
  const LogoProgressIndicator({super.key});

  @override
  State<LogoProgressIndicator> createState() => _LogoProgressIndicatorState();
}

class _LogoProgressIndicatorState extends State<LogoProgressIndicator>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });
      _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 2),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Image.asset("assets/images/logo.png", width: 150, height: 150),
        ),
      ),
    );
  }
}
