import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/models/thing.dart';
import 'package:library_admin/admin/common/widgets/decorated_text_field.dart';

class ThingFields extends StatelessWidget {
  ThingFields({
    Key? key,
    this.thing,
    this.editable = true,
  }) : super(key: key) {
    _nameController = TextEditingController(text: thing?.name);
  }

  final bool editable;
  final Thing? thing;
  late final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DecoratedTextField(
          labelText: 'Name',
          controller: _nameController,
          enabled: editable,
        ),
        const SizedBox(height: 8),
        DecoratedTextField(
          labelText: 'Categories',
          enabled: editable,
        ),
        const SizedBox(height: 8),
        DecoratedTextField(
          labelText: 'Description',
          enabled: editable,
        ),
        const SizedBox(height: 8),
        DecoratedTextField(
          labelText: 'Bulk Add',
          enabled: editable,
        ),
      ],
    );
  }
}
