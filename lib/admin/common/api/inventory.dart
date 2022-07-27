import 'package:dart_airtable/dart_airtable.dart';

import '../models/thing.dart';

class InventoryAPI {
  Future<List<Thing>> getAll() async {
    const apiKey = String.fromEnvironment('AIRTABLE_API_KEY');
    const base = String.fromEnvironment('AIRTABLE_BASE');
    const table = String.fromEnvironment('AIRTABLE_INVENTORY_TABLE');

    final airtable = Airtable(apiKey: apiKey, projectBase: base);
    final records = await airtable.getAllRecords(table);

    return records.map((r) {
      return Thing(
        name: r.getField('Name')?.value as String?,
        stock: r.getField('Stock')?.value as int?,
        isHidden: r.getField('Hidden')?.value as bool?,
        categories: (r.getField('Category')?.value as List).cast<String>(),
        imageUrls: (r.getField('Image')?.value as List?)?.map(
          (image) {
            return image['thumbnails']['large']['url'] as String;
          },
        ).toList(),
      );
    }).toList();
  }
}
