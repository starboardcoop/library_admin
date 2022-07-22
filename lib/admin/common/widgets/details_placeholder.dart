import 'package:flutter/material.dart';

class DetailsPlaceholder extends StatelessWidget {
  const DetailsPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Details')),
    );
  }
}
