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
        Image.network(
          thing?.imageUrls?[0] ?? '',
          semanticLabel: thing?.name,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.blueGrey[100],
              child: const SizedBox.square(
                  dimension: 240, child: Text('No Image')),
            );
          },
          width: 240,
          height: 240,
        ),
        DecoratedTextField(
          labelText: 'Name',
          controller: _nameController,
          enabled: editable,
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          children: thing!.categories
                  ?.map((c) => Chip(
                        label: Text(c),
                        deleteIcon: const Icon(Icons.remove),
                        onDeleted: () {},
                      ))
                  .toList() ??
              [],
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
        const SizedBox(height: 8),
        CheckboxListTile(
          onChanged: (value) => thing?.isHidden = value,
          value: thing?.isHidden ?? false,
          title: const Text('Hidden'),
        ),
      ],
    );
  }
}
