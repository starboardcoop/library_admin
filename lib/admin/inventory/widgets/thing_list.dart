import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/models/thing.dart';

class ThingList extends StatelessWidget {
  const ThingList({
    Key? key,
    required this.things,
    this.onThingTap,
  }) : super(key: key);

  final List<Thing> things;
  final void Function(Thing)? onThingTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: things.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(things[index].name ?? '<Name>'),
          trailing: Chip(
            label: Text(things[index].stock?.toString() ?? '0'),
            backgroundColor:
                (things[index].stock ?? 0) == 0 ? Colors.pink[100] : null,
          ),
          onTap: () => onThingTap?.call(things[index]),
        );
      },
    );
  }
}
