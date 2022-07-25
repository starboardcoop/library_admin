import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/api/inventory.dart';
import 'package:library_admin/admin/common/models/thing.dart';
import 'package:library_admin/admin/common/widgets/add_button.dart';
import 'package:library_admin/admin/common/widgets/details_placeholder.dart';
import 'package:library_admin/admin/inventory/pages/new_thing.dart';
import 'package:library_admin/admin/inventory/pages/thing_details.dart';
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

  final _api = InventoryAPI();
  List<Thing> _things = [];

  @override
  void initState() {
    _api.getAll().then((value) => setState(() => _things = value));
    super.initState();
  }

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
          setState(() => _detailsPanel = _newThingPage(context));

          if (!_isDesktop) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => _detailsPanel!));
          }
        },
        heroTag: 'AddThingButton',
      ),
    );
  }

  NewThingPage _newThingPage(BuildContext context) {
    return NewThingPage(
      onSave: () {
        if (!_isDesktop) {
          Navigator.of(context).pop();
        }

        setState(() => _detailsPanel = null);
      },
    );
  }

  ThingList get _thingList {
    return ThingList(
      things: _things,
      onThingTap: (thing) {
        setState(
          () {
            _detailsPanel = _thingDetailsPage(thing);

            if (!_isDesktop) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return _detailsPanel!;
                  },
                ),
              );
            }
          },
        );
      },
    );
  }

  ThingDetailsPage _thingDetailsPage(Thing thing) {
    return ThingDetailsPage(
      onSave: () {
        if (!_isDesktop) {
          Navigator.of(context).pop();
        }

        setState(() => _detailsPanel = null);
      },
      thing: thing,
    );
  }
}
