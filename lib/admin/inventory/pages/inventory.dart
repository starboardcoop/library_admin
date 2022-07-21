import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/models/thing.dart';
import 'package:library_admin/admin/common/widgets/add_button.dart';
import 'package:library_admin/admin/inventory/pages/new_thing.dart';
import 'package:library_admin/admin/inventory/widgets/thing_list.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InventoryPageState();
  }
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: ThingList(
        things: [
          Thing(name: 'Thing', stock: 1),
          Thing(name: 'Another Thing', stock: 3),
          Thing(name: 'A Thing We Want', stock: 0),
        ],
      ),
      floatingActionButton: AddButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const NewThingPage())));
        },
        heroTag: 'AddThingButton',
      ),
    );
  }
}
