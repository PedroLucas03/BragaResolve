import 'package:flutter/material.dart';
import '../Atoms/appText.dart';
import '../Atoms/appSpacer.dart';

/// Molécula para cabeçalho de seção
/// Combina AppText + AppSpacer para título de seções
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.bottomSpacing = 16.0,
    this.titleStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    this.subtitleStyle = const TextStyle(fontSize: 14, color: Colors.grey),
  });

  final String title;
  final String? subtitle;
  final double bottomSpacing;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(text: title, textStyle: titleStyle),

        if (subtitle != null) ...[
          AppSpacer.vertical(4.0),
          AppText(text: subtitle!, textStyle: subtitleStyle),
        ],

        AppSpacer.vertical(bottomSpacing),
      ],
    );
  }
}