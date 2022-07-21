import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
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
      backgroundColor: Colors.green,
      child: const Icon(Icons.check),
    );
  }
}
