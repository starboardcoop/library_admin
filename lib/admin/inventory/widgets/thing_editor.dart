import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/models/thing.dart';
import 'package:library_admin/admin/common/widgets/save_button.dart';

import 'thing_fields.dart';

class ThingEditor extends StatefulWidget {
  const ThingEditor({
    Key? key,
    required this.title,
    required this.onSave,
    this.thing,
  }) : super(key: key);

  final String title;
  final Thing? thing;
  final void Function() onSave;

  @override
  State<StatefulWidget> createState() {
    return _ThingEditorState();
  }
}

class _ThingEditorState extends State<ThingEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ThingFields(thing: widget.thing),
      floatingActionButton: SaveButton(
        onPressed: () {
          widget.onSave();
          Navigator.of(context).pop();
        },
        heroTag: 'ThingEditorSave',
      ),
    );
  }
}
