import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/models/thing.dart';
import 'package:library_admin/admin/common/widgets/decorated_text_field.dart';

class ThingFields extends StatelessWidget {
  ThingFields({Key? key, this.thing}) : super(key: key) {
    _nameController = TextEditingController(text: thing?.name);
  }

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
        ),
        const SizedBox(height: 8),
        const DecoratedTextField(labelText: 'Categories'),
        const SizedBox(height: 8),
        const DecoratedTextField(labelText: 'Description'),
        const SizedBox(height: 8),
        const DecoratedTextField(labelText: 'Bulk Add'),
      ],
    );
  }
}
