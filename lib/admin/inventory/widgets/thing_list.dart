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
      controller: ScrollController(),
      itemCount: things.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(things[index].name ?? '<Name>'),
          trailing: Chip(
            label: Text(things[index].stock?.toString() ?? '0'),
            backgroundColor: (things[index].stock ?? 0) == 0
                ? Colors.pink[100]
                : Colors.blueGrey[100],
          ),
          onTap: () => onThingTap?.call(things[index]),
          tileColor: (index % 2 == 0) ? null : Colors.blueGrey[50],
          hoverColor: Colors.blueGrey[100],
        );
      },
    );
  }
}
