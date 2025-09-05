import 'dart:math';

import 'package:flutter/material.dart';

class CommentListTile extends StatelessWidget {
  const CommentListTile({
    super.key,
    required this.avatar,
    required this.name,
    required this.comment,
  });
  final String avatar;
  final String name;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(avatar, scale: 1),
      ),

      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(comment, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            (Random().nextInt(4) + 1).toStringAsFixed(1).toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          Icon(Icons.star, size: 16, color: Colors.yellow.shade700),
        ],
      ),
    );
  }
}
