import 'package:flutter/material.dart';
import 'package:library_admin/admin/inventory/widgets/thing_editor.dart';

class NewThingPage extends StatefulWidget {
  const NewThingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewThingPageState();
  }
}

class _NewThingPageState extends State<NewThingPage> {
  @override
  Widget build(BuildContext context) {
    return ThingEditor(
      title: 'New Thing',
      onSave: () {},
    );
  }
}
