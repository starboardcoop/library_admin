import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/models/thing.dart';
import 'package:library_admin/admin/inventory/widgets/thing_editor.dart';

class ThingDetailsPage extends StatefulWidget {
  const ThingDetailsPage({
    Key? key,
    required this.thing,
    this.onSave,
  }) : super(key: key);

  final Thing thing;
  final void Function()? onSave;

  @override
  State<StatefulWidget> createState() {
    return _ThingDetailsPageState();
  }
}

class _ThingDetailsPageState extends State<ThingDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final name = widget.thing.name ?? '<Name>';
    return ThingEditor(
      title: name,
      thing: widget.thing,
      onSave: widget.onSave ?? () {},
    );
  }
}
