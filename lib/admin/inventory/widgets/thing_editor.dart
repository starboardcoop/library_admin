import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/models/thing.dart';
import 'package:library_admin/admin/common/widgets/edit_button.dart';
import 'package:library_admin/admin/common/widgets/save_button.dart';

import 'thing_fields.dart';

class ThingEditor extends StatefulWidget {
  const ThingEditor({
    Key? key,
    required this.title,
    required this.onSave,
    this.thing,
    this.editable = true,
  }) : super(key: key);

  final bool editable;
  final String title;
  final Thing? thing;
  final void Function() onSave;

  @override
  State<StatefulWidget> createState() {
    return _ThingEditorState();
  }
}

class _ThingEditorState extends State<ThingEditor> {
  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ThingFields(
        thing: widget.thing,
        editable: _editing,
      ),
      floatingActionButton: _editing
          ? SaveButton(
              onPressed: widget.onSave,
              heroTag: 'ThingEditorSave',
            )
          : _editButton,
    );
  }

  Widget get _editButton {
    return EditButton(
      heroTag: 'ThingEditorEdit',
      onPressed: () {
        setState(() => _editing = true);
      },
    );
  }
}
