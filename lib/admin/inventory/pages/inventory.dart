import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/models/thing.dart';
import 'package:library_admin/admin/common/widgets/add_button.dart';
import 'package:library_admin/admin/common/widgets/details_placeholder.dart';
import 'package:library_admin/admin/inventory/pages/new_thing.dart';
import 'package:library_admin/admin/inventory/widgets/thing_list.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({
    Key? key,
    this.onAddButtonTap,
  }) : super(key: key);

  final void Function()? onAddButtonTap;

  @override
  State<StatefulWidget> createState() {
    return _InventoryPageState();
  }
}

class _InventoryPageState extends State<InventoryPage> {
  final Widget _detailsPlaceholder = const DetailsPlaceholder();

  Widget? _detailsPanel;
  bool _isDesktop = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 701) {
        return _mainPanel(context);
      }

      _isDesktop = true;

      return Row(
        children: [
          Expanded(child: _mainPanel(context)),
          Expanded(
            flex: 2,
            child: _detailsPanel ?? _detailsPlaceholder,
          ),
        ],
      );
    });
  }

  Scaffold _mainPanel(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: _thingList,
      floatingActionButton: AddButton(
        onPressed: () {
          setState(
            () => _detailsPanel = NewThingPage(
              onSave: () {
                if (!_isDesktop) {
                  Navigator.of(context).pop();
                }

                setState(() => _detailsPanel = null);
              },
            ),
          );

          if (!_isDesktop) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => _detailsPanel!));
          }
        },
        heroTag: 'AddThingButton',
      ),
    );
  }

  ThingList get _thingList {
    return ThingList(
      things: [
        Thing(name: 'Thing', stock: 1),
        Thing(name: 'Another Thing', stock: 3),
        Thing(name: 'A Thing We Want', stock: 0),
      ],
    );
  }
}
