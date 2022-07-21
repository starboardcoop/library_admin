import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.onPressed,
    this.heroTag,
  }) : super(key: key);

  final String? heroTag;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.red,
      heroTag: heroTag,
      child: const Icon(Icons.add),
    );
  }
}
