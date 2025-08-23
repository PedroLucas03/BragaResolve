import 'dart:math' as math;

import 'package:flutter/material.dart';

class LoginScaffold extends StatelessWidget {
  const LoginScaffold({super.key, required this.body, this.appBarBuilder});
  final Widget body;
  final PreferredSizeWidget Function(BuildContext)? appBarBuilder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headerAndFooterImage(context, false),
            headerAndFooterImage(context, true),
          ],
        ),
        Scaffold(
          appBar: _buildAppBar(context),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            child: body,
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    if (appBarBuilder != null) {
      return appBarBuilder!(context);
    } else {
      return AppBar(backgroundColor: Colors.transparent);
    }
  }

  Widget headerAndFooterImage(BuildContext context, bool rotate) {
    return SizedBox(
      width: double.infinity,
      height: math.min(110, MediaQuery.of(context).size.height / 10),
      child: Transform(
        alignment: FractionalOffset.center,
        transform: rotate ? Matrix4.rotationZ(math.pi) : Matrix4.rotationZ(0),
        child: Image.asset("assets/images/logo_top.jpg", fit: BoxFit.cover),
      ),
    );
  }
}
