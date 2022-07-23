import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
    required this.onPressed,
    this.heroTag,
  }) : super(key: key);

  final void Function()? onPressed;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: Colors.blueGrey[600],
      child: const Icon(Icons.edit),
    );
  }
}
